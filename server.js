const express = require('express');
const bodyParser = require('body-parser');
const expbhs = require('express-handlebars');
const express_handlebars_sections = require('express-handlebars-sections');



const app = express();

const WControllers = require('./Controllers/Controllers');

app.use('/public',express.static('public'));
app.use('/',WControllers);


const hbs = expbhs.create({
	extname: 'hbs',
	defaultLayout: 'main',
	partialsDir: __dirname + '/views/partials/',
	section: express_handlebars_sections(),
    helpers:{
      section:function(name, options){
          if(!this._sections){this._sections = {}};
          this._sections[name] = options.fn(this);
          return null;
      }}
});


app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
app.engine('hbs', hbs.engine);
app.set('view engine', 'hbs');


// const port = 3000;
  //app.listen(port, () => console.log(`Server running on port ${port}!`));
app.listen(process.env.PORT || 3000);