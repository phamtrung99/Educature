const express = require('express');
const router = express.Router();
const model = require('../Models/Models');
const bodyParser = require('body-parser');
const Passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const session = require('express-session');
const Models = require('../Models/Models');
const path = require('path');

//Passport setup
router.use(session({
    secret: "mysecret",
    cookie: {
        maxAge: 1000 * 60 * 180
    }
}));
router.use(Passport.initialize());
router.use(Passport.session());
router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

Passport.use(new LocalStrategy(
    async (username, password, done) => {
        const usr = await model.CheckUsernameAndPass(username, password);
        const id = usr[0].student_id;
        //console.log(id);
        if (usr[0].checkresults == 1) { //Nếu chỗ này sửa lại thành >0 thì database sẽ hack được bằng SQL injection.
            return done(null, id);
        } else return done(null, false);
    }
));

Passport.serializeUser((id, done) => {
    done(null, id);
});

Passport.deserializeUser((id, done) => {
    return done(null, id);
});

router.get('/login', async (req, res) => {
    res.sendFile('Login.html', { root: path.join(__dirname, '../views/LoginPage/') });
});

router.post('/login', Passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/Login',
    failureFlash: true
}));

//Ket thuc setup passport---

//router.use('../public',express.static('public'));
// router.get('/register', async (req, res) => {
//     if (req.isAuthenticated()) {
//         //console.log(req.user);
//         res.render('../views/LoginPage/Login.hbs');
//     } else {
//         res.render('../views/LoginPage/Register.hbs');
//     }
// });
router.post('/register', async (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    const firtname = req.body.firstname;
    const lastname = req.body.lastname;
    const mail = req.body.mail;
    const phone = req.body.phone;

    const IDstu = await model.GetStudentIDTop1();
    var id = parseInt(IDstu[0].ID);
    id = id + 1;
    var stu_id;
    if (id < 10) {
        stu_id = "ST00" + id;
    } else if (id < 100 && id >= 10) {
        stu_id = "ST0" + id;
    } else {
        stu_id = "ST" + id;
    }
    var studentID = String(stu_id);  //Tao ID Student moi.
    const picture_link = 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSnlVwlWdJBGf3RoYzkrBwoFXqVBVz1B8LxyQ&usqp=CAU';
    await model.InsertUser(studentID, username, password, picture_link, firtname, lastname, mail, phone);
    console.log('Đã tạo thành công user ' + firtname + lastname + ' mã ' + studentID);
    res.render('../views/animationPage/Welcome.hbs');

});

var IDcart = 'CA000';  // Biến ID cart Global
router.get('/', async (req, res) => {
    const CheckUser = req.isAuthenticated();
    if (req.user == 'AD001') {
        console.log('\nAdmin đăng nhập hiện tại:' + req.user);
        res.redirect('/admin');
    } else {
        if (req.isAuthenticated()) {
            console.log('\nUser đăng nhập hiện tại:' + req.user);
            //Tạo cart mới cho user nếu chưa có cart cũ
            const IDstudent = req.user; //Nho sua cho nay
            const CheckCart = await model.CheckCartNotPayByIDstudent(IDstudent); //Kiem tra gio hang nao chua thanh toan cua student
            if (CheckCart[0].dem > 0) { // Neu co cart chua thanh toan => load cart do len
                const CartList = await model.SelectCartNotPayByIDstudent(IDstudent);//Danh sach cart chua thanh toan
                IDcart = CartList[0].cart_id;
                console.log('Load Cart cũ ID ' + IDcart + ' của user ' + IDstudent);
            } else {  //Neu khong co cart nao chua thanh toan
                const IDca = await model.GetCartIDTop1();
                var id = parseInt(IDca[0].ID);
                id = id + 1;
                var ca_id;
                if (id < 10) {
                    ca_id = "CA00" + id;
                } else if (id < 100 && id >= 10) {
                    ca_id = "CA0" + id;
                } else {
                    ca_id = "CA" + id;
                }
                IDcart = String(ca_id);  //Tao ID cart moi
                await model.InsertNewCart(IDcart, IDstudent); //tao cart moi cho student do
                console.log('Đã tạo cart mới ID ' + IDcart + ' cho user ' + IDstudent);
            }
            //Kết thúc tạo cart mới

            //Trang chủ dành cho user.
            const la = await model.GetAllAuthors();
            const dcc = await model.GetAllCourseDiscount(1);
            

            res.render('../views/HomePage/Home', { listauthors: la, discountcourse: dcc, CheckUser, user:req.user });
        } else {
            //Trang chủ cho khách vãng lai
            const la = await model.GetAllAuthors();
            const dcc = await model.GetAllCourseDiscount(1);
            res.render('../views/HomePage/Home', { listauthors: la, discountcourse: dcc, CheckUser });
        }
    }
});

router.get('/logout', function (req, res) {
    console.log('User đã Logout\n ');
    req.logout();
    res.redirect('/');
});


router.get('/Courses/:IDSubject', async (req, res) => {
    const CheckUser = req.isAuthenticated();
    const lc = await model.GetCourseListbyIDSubject(req.params.IDSubject);
    res.render('../views/CoursesPage/ListCourse.hbs', { ListCourse: lc, CheckUser });
});


router.get('/Courses/:IDSubject/:IDCourse', async (req, res) => {
    const CheckUser = req.isAuthenticated();
    const cour = await model.GetDetailCourse(req.params.IDSubject, req.params.IDCourse);
    const fb = await model.GetFeedBackByCourseID(req.params.IDCourse);
    const countfb = await model.CountFeedbackByCourseID(req.params.IDCourse);
    const lesson = await model.GetLessonByIDCOure(req.params.IDCourse);
    if (req.isAuthenticated()) {
        const CheckIfExists = await model.CheckCourseIfExsistInCart(IDcart, req.params.IDCourse);
        res.render('../views/CourseDetailPage/CourseDetail.hbs', { Course: cour[0], Feedback: fb, CountFB: countfb[0], Check: CheckIfExists[0], CheckUser, lesson: lesson });
    } else {
        res.render('../views/CourseDetailPage/CourseDetail.hbs', { Course: cour[0], Feedback: fb, CountFB: countfb[0], CheckUser, lesson: lesson });
    }
});

router.post('/Courses/:IDSubject/:IDCourse', async (req, res) => {
    const course_id = req.body.courseid;
    const subjectid = req.body.subjectid;
    model.InsertCartItem(IDcart, course_id);
    console.log('ADD TO CART ' + IDcart + ': COURSE ' + course_id);
    res.redirect('/Courses' + `/${subjectid}` + `/${course_id}`);
});

router.post('/Courses/:IDSubject/:IDCourse/Message', async (req, res) => {
    if (req.isAuthenticated()) {
    const course_id = req.params.IDCourse;
    const subjectid = req.params.IDSubject;
    const message = req.body.message;
    const rating = parseInt(req.body.ratingstar);
    const user = req.user;

    const FB = await model.GetFeedBackIDTop1();
    var id = parseInt(FB[0].ID);
    id = id + 1;
    var fb_id;
    if (id < 10) {
        fb_id = "FB00" + id;
    } else if (id < 100 && id >= 10) {
        fb_id = "FB0" + id;
    } else {
        fb_id = "FB" + id;
    }
    var IDFB = String(fb_id);  //Tao ID feedback moi
    model.InsertFeedBack(IDFB,course_id,user,rating,message);
    console.log('\nĐã thêm nhận xét của ' + user + ' về ' + course_id + '\nRating: ' + rating + '\nNội dung: ' + message);
    res.redirect('/Courses' + `/${subjectid}` + `/${course_id}`);
    }else{
        res.sendFile('Login.html', { root: path.join(__dirname, '../views/LoginPage/') });
    }
});

router.get('/Search', async (req, res) => {
    //console.log(req.query.coursename);
    const CheckUser = req.isAuthenticated();
    const search = await model.GetCourseByKeyWord(req.query.coursename);
    const countsearch = await model.GetCountCourseByKeyWord(req.query.coursename);
    res.render('../views/SearchPage/ListSearch.hbs', { LS: search, CS: countsearch[0], CheckUser });
});
router.get('/Cart', async (req, res) => {
    const CheckUser = req.isAuthenticated(); // Biến này để check load đúng header.
    if (req.isAuthenticated()) {
        const CountCartItem = await model.CountCartItemByIDCart(IDcart);
        const LI = await model.GetAllCartItemByIDCart(IDcart);
        const Total = await model.GetTotalPrice(IDcart);
        res.render('../views/CartItemPage/CartItem.hbs', { ListItem: LI, demcart: CountCartItem[0], totalPrice: Total[0], CheckUser });
    } else {
        res.sendFile('Login.html', { root: path.join(__dirname, '../views/LoginPage/') });
    }
});
router.post('/Cart', async (req, res) => {
    const RIDCart = req.body.removeCartID;
    const RIDCourse = req.body.removeCourseID;
    if (RIDCourse != undefined && RIDCart != undefined) {
        await model.RemoveCartItems(RIDCart, RIDCourse);
        console.log('REMOVE CART ' + RIDCart + ': COURSE ' + RIDCourse);
    }
    res.redirect('/Cart');
});

router.get('/Buyed', async (req, res) => {
    if (req.isAuthenticated()) {
        const CheckUser = req.isAuthenticated();
        const BuyedCour = await model.GetCourseBuyedByIDStudent(req.user);
        const countbuyed = await model.CountCourseBuyedByIDStudent(req.user);
        res.render('../views/BuyedPage/Buyed.hbs', { LS: BuyedCour, CS: countbuyed[0], CheckUser });
    } else {
        res.redirect('/Loading');
    }
});

router.get('/Lesson', async (req, res) => {
    res.render('../views/LessonPage/Lesson.hbs');
});

router.get('/Loading', async (req, res) => {
    res.render('../views/animationPage/Loading.hbs');
});

router.get('/admin', async (req, res) => {
    const CheckUser = req.isAuthenticated();
    if (req.user == 'AD001') {
        const StuMoney = await model.GetMoneyALlStudent();
        const RevPerMon = await model.GetRevenuePerMonth();
        res.render('../views/AdminPage/RevenueManage', { StuMoney: StuMoney, RevPerMon: RevPerMon });
    } else {
        console.log('User cố gắng truy cập AdminPage.');
        res.redirect('/Loading');
    }

    //const MonthMana = await model.ManageEnrollByMonth();

});

router.get('/admin/CourseManage', async (req, res) => {
    const CheckUser = req.isAuthenticated();
    if (req.user == 'AD001') {
        const NumofSub = await model.CountSubscibersAllCourses();
        const TopRatCo = await model.TOP6RatingCourse();
        res.render('../views/AdminPage/CourseManage', { NumofSub: NumofSub, TopRatCo: TopRatCo });
    } else {
        console.log('User cố gắng truy cập AdminPage.');
        res.redirect('/Loading');
    }
});

router.get('/admin/CustomerManage', async (req, res) => {
    const CheckUser = req.isAuthenticated();
    if (req.user == 'AD001') {
        const AllStu = await model.GetAllStudent();
        const MonthMana = await model.ManageEnrollByMonth();
        res.render('../views/AdminPage/CustomerManage', { AllStu: AllStu, MonMana: MonthMana });
    } else {
        console.log('User cố gắng truy cập AdminPage.');
        res.redirect('/Loading');
    }
});

router.get('/Cart/paypal/success/:idcart/:money', async (req, res) => {
    if (req.isAuthenticated()) {
        const CheckUser = req.isAuthenticated();
        const IDcart = req.params.idcart;
        const money = parseInt(req.params.money);
        const IDbill = await model.GetBillIDTop1();
        var bi = parseInt(IDbill[0].ID);
        bi = bi + 1;
        var bill_id;
        if (bi < 10) {
            bill_id = "BI00" + bi;
        } else if (bi < 100 && bi >= 10) {
            bill_id = "BI0" + bi;
        } else {
            bill_id = "BI" + bi;
        }
        var biid = String(bill_id);
        var checkcart = await model.CheckCartExistsInBill(IDcart);
        if (checkcart[0].dem == 0) {  //Kiểm tra giỏ hàng đã thanh toán trước đó chưa.
            await model.InsertBill(biid, IDcart, money);
            await model.UpadeCart_Paystatus(IDcart, money);
            console.log('Thanh toán thành công ID bill: ' + biid);
            res.render('../views/PaypalPay/Success.hbs', { CheckUser });
        } else res.render('../views/PaypalPay/Error.hbs', { CheckUser });
    } else {
        res.sendFile('Login.html', { root: path.join(__dirname, '../views/LoginPage/') });
    }
});

module.exports = router;