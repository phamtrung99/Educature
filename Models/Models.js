const db = require('../Connection/dbconnect');
module.exports = {
    GetAllAuthors: async () => {
        const sql = `select * from Authors`;
        const rows = db.load(sql);
        return rows;
    },
    GetCourseListbyIDSubject: async (IDSubject) => {
        const sql = `select * from Subject_Course, Courses, Subjects, Author_Course,Authors where Subject_Course.course_id = Courses.course_id and Subject_Course.subject_id = '${IDSubject}' and Subjects.subject_id = '${IDSubject}'  and Courses.course_id = Author_Course.course_id and Authors.author_id = Author_Course.author_id`;
        const rows = db.load(sql);
        return rows;
    },
    GetDetailCourse: async (IDSubject, IDCourse) => {
        const sql = `select * from Subject_Course, Courses, Subjects, Author_Course,Authors where Subject_Course.course_id = Courses.course_id and Subject_Course.subject_id = '${IDSubject}' and Subjects.subject_id = '${IDSubject}' and Courses.course_id = Author_Course.course_id and Authors.author_id = Author_Course.author_id and Courses.course_id = '${IDCourse}'`;
        const rows = db.load(sql);
        return rows;
    },
    GetFeedBackByCourseID: async (IDCourse) => {
        const sql = `select * from Feedback,Students where course_id = '${IDCourse}' and Feedback.student_id = Students.student_id`;
        const rows = db.load(sql);
        return rows;
    },
    CountFeedbackByCourseID: async (IDCourse) => {
        const sql = `select count(*) AS dem from Feedback where course_id = '${IDCourse}'`;
        const rows = db.load(sql);
        return rows;
    },
    GetCourseByKeyWord: async (KeyWord) => {
        const sql = `select * from Courses, Subjects,   Subject_Course, Author_Course, Authors where course_title like '%${KeyWord}%' and Subjects.subject_id = Subject_Course.subject_id and Subject_Course.course_id = Courses.course_id and Courses.course_id = Author_Course.course_id and Authors.author_id = Author_Course.author_id`;
        const rows = db.load(sql);
        return rows;
    },
    GetCountCourseByKeyWord: async (KeyWord) => {
        const sql = `select count(*) AS dem from Courses where course_title like '%${KeyWord}%'`;
        const rows = db.load(sql);
        return rows;
    },
    // InsertCourseToCartByIDCourse: async (IDCourse,IDStudent) => {
    //     const rows1 = await db.load('select * from cart');
    //     const len = rows1.length + 1;
    //     const CartID =  'CA0' + len;
    //     const THOI_DIEM = '2020-01-01 20:22:00';
    //     const sql = `INSERT INTO cart VALUES ('${CartID}','${IDStudent}','${THOI_DIEM}',0,0,0)` ;
    //     const rows = db.load(sql);
    //     return rows;
    // },
    InsertCartItem: async (IDCart, IDCourse) => {
        // const cartidrow = await db.load(`select cart_id from cart where student_id = '${IDStudent}' and pay_status = 0;`);
        // const cartid = cartidrow[0].cart_id;
        const sql = `INSERT INTO CartItems VALUES ('${IDCart}','${IDCourse}');`;
        const rows = db.load(sql);
        return rows;
    },
    GetAllCartItemByIDCart: async (IDCart) => {
        const sql = `select *,Courses.course_price - Courses.course_price*(Discount.saleoff/100) AS Totalprice1 from Cart, CartItems,Courses,Discount where Cart.cart_id = '${IDCart}' and CartItems.cart_id = Cart.cart_id and Courses.course_id = CartItems.course_id and Courses.course_id  = Discount.course_id`;
        const rows = db.load(sql);
        return rows;
    },
    CountCartItemByIDCart: async (IDCart) => {
        const sql = `select count(*) AS dem from Cart, CartItems where Cart.cart_id = '${IDCart}' and CartItems.cart_id = Cart.cart_id;`;
        const rows = db.load(sql);
        return rows;
    },
    RemoveCartItems: async (IDcart, IDcourse) => {
        const sql = `delete from CartItems where cart_id = '${IDcart}' and course_id='${IDcourse}';`;
        const rows = db.load(sql);
        return rows;
    },
    GetTotalPrice: async (IDcart) => {
        const sql = `select sum(TONG.Totalprice1) AS total from (select Courses.course_price - Courses.course_price*(Discount.saleoff/100) AS Totalprice1 from Cart, CartItems,Courses,Discount where Cart.cart_id = '${IDcart}' and CartItems.cart_id = Cart.cart_id and Courses.course_id = CartItems.course_id and Courses.course_id  = Discount.course_id) AS TONG;`;
        const rows = db.load(sql);
        return rows;
    },
    CheckCourseIfExsistInCart: async (IDCART, IDcourse) => {
        const sql = `select count(*) AS dem from CartItems where  CartItems.cart_id = '${IDCART}' and CartItems.course_id = '${IDcourse}'`;
        const rows = db.load(sql);
        return rows;
    },
    GetAllCourseDiscount: async (saleoff) => {
        const sql = `select * from Courses,Subject_Course, Discount where Courses.course_id = Discount.course_id and Subject_Course.course_id = Courses.course_id and Discount.saleoff >= ${saleoff}`;
        const rows = db.load(sql);
        return rows;
    },
    CountSubscibersAllCourses: async () => {
        const sql = `select Courses.course_title,Authors.author_fname,Authors.author_lname, count(Enroll.student_id) AS SLER from Courses, Enroll,Author_Course,Authors where Courses.course_id = Enroll.course_id  and Author_Course.course_id = Courses.course_id and Authors.author_id = Author_Course.author_id group by Courses.course_title,Authors.author_fname,Authors.author_lname`;
        const rows = db.load(sql);
        return rows;
    },
    GetAllStudent: async () => {
        const sql = `SELECT * FROM Students`;
        const rows = db.load(sql);
        return rows;
    },
    ManageEnrollByMonth: async () => {
        const sql = `select MONTH(Enroll.enroll_date) AS month,count(*) as sl from Enroll group by MONTH(Enroll.enroll_date)`;
        const rows = db.load(sql);
        return rows;
    },
    TOP6RatingCourse: async () => {
        const sql = `select ROW_NUMBER() OVER (ORDER BY (select 1)) as STT, T.course_title, T.AVE FROM (select course_title ,sum(rating_star)/count(course_title) AS AVE from Feedback,Courses
        where Courses.course_id = Feedback.course_id
        group by Courses.course_title
        order by AVE DESC
        LIMIT 6 )AS T
        `;
        const rows = db.load(sql);
        return rows;
    },
    InsertBill: async (id_bill, id_cart, pay_money) => {
        const sql = `INSERT INTO  bill VALUES ('${id_bill}','${id_cart}', NOW(),${pay_money});`;
        const rows = db.load(sql);
        return rows;
    },
    GetBillIDTop1: async () => {
        const sql = `SELECT SUBSTRING(id_bill,3,3) AS ID from  bill  order by id_bill DESC limit 1`;
        const rows = db.load(sql);
        return rows;
    },
    UpadeCart_Paystatus: async (id_cart, pay_money) => {
        const sql = `UPDATE Cart set pay_status = 1, order_date = NOW(), total_price = ${pay_money} where cart_id = '${id_cart}';`;
        const rows = db.load(sql);
        return rows;
    },
    CheckCartExistsInBill: async (id_cart) => {
        const sql = `select count(*) AS dem from bill, Cart where bill.cart_id ='${id_cart}' and Cart.cart_id = bill.cart_id and Cart.pay_status = 1;`;
        const rows = db.load(sql);
        return rows;
    },
    GetMoneyALlStudent: async () => {
        const sql = `select Students.student_id, Students.fname, Students.lname, sum(bill.pay_money) AS money from bill,Cart,Students where Cart.cart_id = bill.cart_id and Cart.student_id = Students.student_id 
        group by Students.student_id, Students.fname, Students.lname`;
        const rows = db.load(sql);
        return rows;
    },
    GetRevenuePerMonth: async () => {
        const sql = `select MONTH(bill.pay_date) as month, sum(bill.pay_money) AS money  from bill group by MONTH(bill.pay_date);`;
        const rows = db.load(sql);
        return rows;
    },
    CheckUsernameAndPass: async (username, password) => {
        const sql = `select count(*) AS checkresults, student_id from Students where student_password ='${password}' and student_username = '${username}';`;
        const rows = db.load(sql);
        return rows;
    },
    InsertUser: async (ID, username, password, picture, firtname, lastname, mail, phone) => {
        const sql = `INSERT INTO Students VALUES ('${ID}','${username}','${password}','${picture}','${firtname}','${lastname}',NULL,'${mail}',${phone},NOW(),NOW(),0)`;
        const rows = db.load(sql);
        return rows;
    },
    GetStudentIDTop1: async () => {
        const sql = `SELECT SUBSTRING(student_id,3,3) AS ID from  Students order by student_id DESC limit 1;`;
        const rows = db.load(sql);
        return rows;
    },
    CheckCartNotPayByIDstudent: async (IDstudent) => {
        const sql = `select count(*) as dem from Cart where student_id = '${IDstudent}' and pay_status = 0;`;
        const rows = db.load(sql);
        return rows;
    },
    SelectCartNotPayByIDstudent: async (IDstudent) => {
        const sql = `select * from Cart where student_id = '${IDstudent}' and pay_status = 0;`;
        const rows = db.load(sql);
        return rows;
    },
    InsertNewCart: async (IDcart, IDstudent) => {
        const sql = `INSERT INTO Cart VALUES ('${IDcart}','${IDstudent}',NOW(),0,0,0);`;
        const rows = db.load(sql);
        return rows;
    },
    GetCartIDTop1: async () => {
        const sql = `SELECT SUBSTRING(cart_id,3,3) AS ID from Cart order by cart_id DESC limit 1;`;
        const rows = db.load(sql);
        return rows;
    },
    GetCourseBuyedByIDStudent: async (IDstudent) => {
        const sql = `select * from Courses, Subjects,   Subject_Course, Author_Course, Authors, Cart, CartItems 
        where Subjects.subject_id = Subject_Course.subject_id 
        and Subject_Course.course_id = Courses.course_id 
        and Courses.course_id = Author_Course.course_id 
        and Authors.author_id = Author_Course.author_id 
        and CartItems.course_id = Courses.course_id
        and Cart.cart_id = CartItems.cart_id 
        and Cart.student_id = '${IDstudent}'
        and Cart.pay_status = '1';`;
        const rows = db.load(sql);
        return rows;
    },
    CountCourseBuyedByIDStudent: async (IDstudent) => {
        const sql = `select count(*) AS dem from Courses, Subjects,   Subject_Course, Author_Course, Authors, Cart, CartItems 
        where Subjects.subject_id = Subject_Course.subject_id 
        and Subject_Course.course_id = Courses.course_id 
        and Courses.course_id = Author_Course.course_id 
        and Authors.author_id = Author_Course.author_id 
        and CartItems.course_id = Courses.course_id
        and Cart.cart_id = CartItems.cart_id 
        and Cart.student_id = '${IDstudent}'
        and Cart.pay_status = '1';`;
        const rows = db.load(sql);
        return rows;
    },
    GetLessonByIDCOure: async (IDCOURSE) => {
        const sql = `select * from Lessons where course_id = '${IDCOURSE}' `;
        const rows = db.load(sql);
        return rows;
    },
    InsertFeedBack: async (IDFB, IDCOURSE, IDSTU, RATING,MESS) => {
        const sql = `INSERT INTO Feedback VALUES  ('${IDFB}','${IDCOURSE}','${IDSTU}',${RATING},'${MESS}',NOW());`;
        const rows = db.load(sql);
        return rows;
    },
    GetFeedBackIDTop1: async () => {
        const sql = `SELECT SUBSTRING(feedback_id,3,3) AS ID from Feedback order by feedback_id DESC limit 1;`;
        const rows = db.load(sql);
        return rows;
    },
}