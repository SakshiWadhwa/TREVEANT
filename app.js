var express = require("express");
var bodyparser = require("body-parser");
var url = require("url");
var mysql = require("mysql");
var session = require("express-session");
var formidable = require('formidable');
var fs = require('fs-extra');
var random = require("random-key")

var app = express();
app.use(bodyparser.urlencoded({extended:true}));
app.use(session({secret:'hello'}));
app.use('/static',express.static('static'));
app.set("view engine", "ejs");

var con = mysql.createConnection({
	host:"localhost",
	user:"root",
	password:"",
	database:"backend"
});

app.get('/', function(req, res)
{
	var category = 'select * from category';
	con.query(category ,function(err,category_result)
	{
		var project = "select * from project";
		con.query(project ,function(err,project_result)
		{
			var membership = "select * from membership";
			con.query(membership, function(err, membership_result)
			{
				var testimonial = "select * from testimonial";
				con.query(testimonial, function(err, testimonial_result)
				{
					var blog = "select * from blog";
					con.query(blog, function(err, blog_result)
					{
						res.render('frontend/index',{service_data:req.session.name,data_category:category_result, data_project:project_result, data_membership:membership_result, data_testimonial:testimonial_result, data_blog:blog_result,service_data:req.session.name});	
						// console.log(category_result);
					});
				});
			});
		});
	});
});


/*---------------------------------------------About-----------------------------------------------------------------*/
app.get('/about_section', function(req, res)
{
	var category = 'select * from category';
	con.query(category, function(err, category_result)
	{
		var project = "select * from project";
		con.query(project ,function(err,project_result)
		{
			res.render('frontend/about', {data_category:category_result, data_project:project_result, service_data:req.session.name});
		});
	});
});



/*-------------------------------------------Subscribe--------------------------------------------------------------*/
app.post('/subscribe', function(req, res)
{
	var name, email, pswd;
	name = req.body.subscribe_name;
	email = req.body.subscribe_email;
	var q = "insert into subscribe set subscribe_name = '"+name+"' , subscribe_email = '"+email+"' ";
	con.query(q, function(err, result)
	{
		if(err) throw err;
		console.log("inserted");
		res.redirect('/');
	});
});

/*-----------------------------------------Register New User----------------------------------------------------*/
app.post("/user_register", function(req, res)
{
	var firstname, lastname, email, pswd;
	firstname = req.body.user_fname;
	lastname = req.body.user_lname;
	email = req.body.login_email;
	pswd = req.body.login_pswd;

	var q = "insert into user (user_firstname, user_lastname, user_email, user_password) values ('" + firstname +"', '" + lastname +"', '" + email + "', ' " + pswd + "') ";
	con.query(q, function(err, result)
	{
		if(err) throw err;
		res.redirect('/');
	});
});
/*-----------------------------------------Login---------------------------------------------------------------*/
app.post("/payment_login", function(req, res)
{
	var email, pswd, title;
	email = req.body.login_email;
	pswd = req.body.login_pswd;
	title = req.body.mem_title;

	var q = "select count(user_email) as val from user where user_email = '" + email + "' and user_password = '" + pswd + "' and user_status = 'active'";
	con.query(q, function(err, login_result)
	{
		if(err)
		{
			throw err;
		}
		
	    if (login_result[0].val)
		{
			req.session.name = email;
			console.log(title);
			res.redirect('/payment/'+title);
		}
		else
		{
			res.redirect('/');
		}
	
	});
});

/*------------------------------------------------Payment------------------------------------------------------*/
app.get("/payment/:title", function(req,res)
{	

	if(req.session.name)
	{		
		res.render('frontend/payment',{data_membership:req.params.title});
	}
	else 
	{
		res.redirect('/');
	}
});

app.post("/payment_doc", function(req, res)
{
	var title = req.body.mem_title;

	var name, contact, email, address, age, option, randomKey;
	name = req.body.pay_name;
	contact = req.body.pay_contact;
	email = req.body.pay_email;
	address = req.body.pay_address;
	age = req.body.pay_age;
	option = req.body.pay_option;
	randomKey = random.generate();
	req.session.payment_id = randomKey;

	var q = "insert into payment (payment_id, payment_name, payment_contact, payment_email, payment_address, payment_age, payment_option,payment_status) values ('" +req.session.payment_id +"', '" + name +"', '" + contact + "', ' " + email + "', '" + address + "', '" + age +  "', '" + option + "', 'cart' )";

	con.query(q, function(err, result)
	{
		
		if(option == 'Stripe')
		{
			res.redirect('/stripe_option/'+req.session.payment_id+'/'+title);
		}
		else
		{
			res.redirect('/paypal_option/'+req.session.payment_id+'/'+title);
		}
		
	});
});

app.get("/stripe_option/:msg/:titles", function(req, res)
{
	var q = "select * from payment where payment_id = '"+req.params.msg+"'  "; 
	con.query(q, function(err, result)
	{	if(err) throw err;
		//console.log(result);
		var q1 = "select membership_price from membership where membership_title = '"+req.params.titles+"'";
		
		con.query(q1,function(err,result1){
			//console.log(result1);
			if(err) throw err;
			res.render("frontend/stripe", {data:result, data_membership:req.params.titles, data_price_stripe:result1});
		});		
	});
});

app.get("/paypal_option/:msg/:title", function(req, res)
{
	var q = "select * from payment where payment_id = '"+req.params.msg+"'  ";
	con.query(q, function(err, result)
	{	if(err) throw err;
		var q1 = "select membership_price from membership where membership_title = '"+req.params.title+"'";
		
		con.query(q1,function(err,result2){
			if(err) throw err;
			res.render("frontend/paypal", {data:result, data_membership: req.params.title, data_price_paypal:result2});
			//console.log("pay_mem: "+ result2);
		});		
	});
});

app.post("/stripe_option/your-server-side-code/:title", function(req, res)
{ 	
	// var q = "update user set membership_title = '" + req.params.title + "', payment_id = '"+req.session.payment_id+"'where user_email = '"+req.session.name+"'";
	// con.query(q,function(err,result){

	// 	var q1 = "update payment set payment_status  = 'success', user_email = '"+ req.session.name +"' where payment_id = '" + req.session.payment_id + "'" ;
	// 	con.query(q1, function(err, invoice_result)
	// 	{
	// 		if(err) throw err;
 //            var payjoin = 'select * from membership inner join user on user.membership_title = membership.membership_title inner join payment on user.payment_id = payment.payment_id where user.user_email = "'+req.session.name+'"';

	// 		con.query(payjoin, function(err, payresult)
	// 		{
	// 			res.render('frontend/invoice', {payment_data: payresult});
				
	// 			req.session.payment_id = '';
	// 		});
	// 	});	    
	// });
	res.redirect('/invoice');
});

app.post("https://www.sandbox.paypal.com/cgi-bin/webscr/paypal_option/your-server-side-code/:title", function(req, res)
{ 	
	res.redirect('/invoice');
});


app.get("/invoice", function(req, res)
{
	var q = "update user set membership_title = '" + req.params.title + "', payment_id = '"+req.session.payment_id+"'where user_email = '"+req.session.name+"'";
	con.query(q,function(err,result){

		var q1 = "update payment set payment_status  = 'success', user_email = '"+ req.session.name +"' where payment_id = '" + req.session.payment_id + "'" ;
		con.query(q1, function(err, invoice_result)
		{
			if(err) throw err;
            var payjoin = 'select * from membership inner join user on user.membership_title = membership.membership_title inner join payment on user.payment_id = payment.payment_id where user.user_email = "'+req.session.name+'"';

			con.query(payjoin, function(err, payresult)
			{
				res.render('frontend/invoice', {payment_data: payresult});
				
				req.session.payment_id = '';
			});
		});	    
	});
});

/*----------------------------------------------Payment Cancelation----------------------------------------*/
app.get('/cancel_payment', function(req, res)
{
	var q = "delete from payment where payment_id = '" + req.session.payment_id + "' ";
	con.query(q, function(err, result)
	{
		if(err) throw err;
		req.session.payment_id = "";
		res.redirect('/');
	});
});

app.get('/service', function(req, res)
{
	res.redirect('/');
});

app.post("/service_login", function(req, res)
{
	var form = new formidable.IncomingForm();
	form.parse(req,function(err,fields,files)
	{
		var email, pswd, title;
		email = fields.cat_email;
		pswd = fields.cat_pswd;
		name = fields.ser_name;
		id = fields.ser_id;
		//console.log("name " + name + " id: " + id);
		var q = "select count(user_email) as val from user where user_email = '" + email + "' and user_password = '" + pswd + "' and user_status = 'active'";
		con.query(q, function(err, service_login_result)
		{
			if(err)
			{
				throw err;
			}
			
		    if (service_login_result[0].val)
			{
				req.session.name = email;
				res.redirect('/wedding_service/' + name + '/' + id);
			}
			else
			{
				res.redirect('/');
			}
		});
	});
});

/*---------------------------------------------------------Services list--------------------------------------*/
app.get("/wedding_service/:name/:id", function(req,res)
{	
	if(req.session.name)
	{
		var category = 'select * from category';
		con.query(category, function(err, category_result)
		{
			var project = "select * from project";
			con.query(project ,function(err,project_result)
			{
				var serjoin = 'select * from category inner join service on service.category_id = category.category_id where category.category_name = "'+req.params.name+'" ';
				con.query(serjoin, function(err, ser_join_result)
				{
					var services = "select * from service where category_id = '" + req.params.id + "'";
					con.query(services, function(err, service_result)
					{
						if(err) throw err;
						if(req.query.pid != null)
							{
								//console.log(req.query.pid);
								var pid = req.query.pid;		
							}
							else
							{
								var pid = "";
							}
						
						res.render('frontend/wedding_service',{service_data:req.session.name, data_category: category_result, data_project:project_result, data_category_name: req.params.name, service_join_data: ser_join_result, data_service:service_result,pid:pid});
						// console.log(service_result);
					});
				});
			});
		});
	}
	else 
	{
		res.redirect('/');
	}
});

/*----------------------------------------------Gallery--------------------------------------------------*/
app.get('/project_gallery/:name/:id', function(req, res)
{
	var category = 'select * from category';
	con.query(category, function(err, category_result)
	{
		var project = "select * from project";
		con.query(project ,function(err,project_result)
		{
			var galjoin = 'select * from project inner join gallery on gallery.project_id = project.project_id where project.project_title = "'+ req.params.name +'" ';
			con.query(galjoin, function(err, gal_join_result)
			{
				var galleries = "select * from gallery where project_id = '" + req.params.id + "'";
				con.query(galleries, function(err, gallery_result)
				{
					if(err) throw err;
					res.render('frontend/events_gallery',{service_data:req.session.name, data_category:category_result, data_project:project_result, data_project_name: req.params.name, gallery_join_data: gal_join_result, data_gallery:gallery_result});
				});
			});
		});
	});
});

app.get('/wed_cart/:wed_service_id/:name/:id', function(req, res)
{
	var q = "insert into order_events set service_id = '"+req.params.wed_service_id+"' , order_status = 'cart', user_email = '"+req.session.name+"' ";
	
	con.query(q,function(err,result)
	{
		if(err) throw err;
		res.redirect('/wedding_service/'+req.params.name+'/'+req.params.id+"?pid="+req.params.wed_service_id);
	});
});

app.get('/cart',function(req,res){
	var q = "select * from user inner join order_events on user.user_email = order_events.user_email inner join service on order_events.service_id = service.service_id where user.user_email= '"+req.session.name+"' and order_events.order_status= 'cart' ";
	con.query(q,function(err,cart_result){
		var q1 = "select membership.membership_price from membership inner join user on user.membership_title = membership.membership_title where user.user_email = '"+req.session.name+"' ";
		con.query(q1,function(err,result){
			var q2 = "select * from user inner join order_events on user.user_email = order_events.user_email inner join service on order_events.service_id = service.service_id where user.user_email= '"+req.session.name+"' and order_events.order_status= 'success' ";
			con.query(q2, function(err, history_result)
			{
				res.render('frontend/cart', {cart_data: cart_result,discount:result, history_data:history_result});	
				// console.log(history_result);
			});
		});
	});
});

/*-----------------------------------Delete Service---------------------------------------------------*/
app.get("/delete_service/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from order_events where id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/cart');
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.get('/cancel_order', function(req, res)
{
	res.redirect('/');
});
app.get('/cancel', function(req, res)
{
	res.redirect('/');
});

app.get('/proceed_order/:x', function(req, res)
{
	res.render('frontend/order_payment', {proceed_data: req.params.x});
});

app.post('/final_payment', function(req, res)
{
	var name, contact, email, address, amount, option;
	name = req.body.order_name;
	contact = req. body.order_contact;
	email = req.body.order_email;
	address = req.body.order_address;
	amount = req.body.order_amount;
	option = req.body.order_option;

	order_key = random.generate();
	req.session.order_id = order_key;


	var q = "insert into cart_details set cart_name = '"+ name + "', cart_contact = '"+ contact + "', cart_email = ' " + email + "', cart_address = '" + address + "', cart_amount = '"+amount+ "', cart_payment_option = '"+ option + "', order_id = '" + req.session.order_id + "', cart_status = 'cart', user_email = '" + req.session.name + "'";
	con.query(q, function(err, result)
	{
		var q1 = "update order_events set order_id = '" + req.session.order_id + "' where user_email = '" + req.session.name + "' and order_status = 'cart'";
		con.query(q1, function(err, result1)
		{
			if(option == 'Stripe')
			{
				res.redirect('/order_stripe_link/' + req.session.order_id + '/' );
			}
			else
			{
				//console.log("pay id" + req.session.payment_id);
				res.redirect('/order_paypal_link/' + req.session.order_id + '/' );
			}
		});
	});
});

app.get('/order_stripe_link/:id', function(req, res)
{
	var q = "select * from cart_details where order_id = '" + req.params.id + "'";
	con.query(q, function(err, order_result_stripe)
	{
		res.render('frontend/order_stripe', {order_data_stripe : order_result_stripe});
	});
});

app.get('/order_paypal_link/:id', function(req, res)
{
	var q = "select * from cart_details where order_id = '" + req.params.id + "'";
	con.query(q, function(err, order_result_paypal)
	{
		// var q1 = "select * from payment where payment_id = '" + req.params.pay_id + "' ";
		// con.query(q1, function(err, pay_result)
		// {
			res.render("frontend/order_paypal", {order_data_paypal : order_result_paypal}); 
		// });
	});
});

app.post('/stripe_payment_order/your-server-side-code/', function(req, res)
{
	res.redirect('/service_invoice');
});

app.get('/service_invoice', function(req, res)
{
    var q = "update cart_details set cart_status = 'success' where user_email = '" + req.session.name + "' and order_id = '" + req.session.order_id +"'";
	con.query(q, function(err, result)
	{
		var q1 = "update order_events set order_status = 'success' where user_email = '" + req.session.name + "' and order_id = '" + req.session.order_id +"' ";  
		con.query(q1, function(err, result1)
		{
			var q2 = "select * from order_events inner join service on order_events.service_id = service.service_id where order_events.order_id = '" + req.session.order_id + "' and user_email = '"+req.session.name+"' ";
			con.query(q2, function(err, service_invoice_result)
			{
				var q3 = "select * from cart_details where order_id = '"+req.session.order_id+"' and user_email = '"+req.session.name+"'";
				con.query(q3,function(err,cart_result){
					res.render('frontend/order_invoice', {service_invoice_data : service_invoice_result,cart_data:cart_result});
					// console.log(service_invoice_result);
					req.session.order_id = '';
			
				});
			});
		});
	});
});

/*-------------------------------------------------Blogs-----------------------------------------------------------*/
app.get('/blog_post', function(req, res)
{
	var category = 'select * from category';
	con.query(category, function(err, category_result)
	{
		var project = "select * from project";
		con.query(project ,function(err,project_result)
		{
			var q = 'select * from blog';
			con.query(q, function(err, blog_post_result)
			{
				res.render('frontend/blog', {blog_post_data:blog_post_result,data_category:category_result, data_project:project_result, service_data:req.session.name});
			});
		});
	});
});

app.get('/blog_page_link/:title/:id', function(req, res)
{
	var category = 'select * from category';
	con.query(category, function(err, category_result)
	{
		var project = "select * from project";
		con.query(project ,function(err,project_result)
		{
			var q = 'select * from blog';
			con.query(q, function(err, blog_page_result)
			{
				res.render('frontend/blog_page', {blog_page_data:blog_page_result, blog_page_title:req.params.title, blog_page_id:req.params.id, data_category:category_result, data_project:project_result, service_data:req.session.name});
				// console.log(blog_page_result);
			});
		});
	});
});
app.listen(7896);
