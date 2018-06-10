var express = require("express");
var bodyparser = require("body-parser");
var url = require("url");
var mysql = require("mysql");
var session = require("express-session");

var formidable = require('formidable');
var fs = require('fs-extra');

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

/*--------------------------------------------------------login----------------------------------------------------------*/
app.get('/', function(req,res)
{
	if(req.session.name)
	{
		res.redirect("/dashboard");
	}
	else
	{
		res.render('login');
	}
});

app.post('/new_page', function(req,res)
{
	var email = req.body.emailfield;
	var password = req.body.passwordfield;
	var status = req.body.sel;

	var q = "select count (email) as val from admin where email = '" + email + "' and password = '" + password + "' and status = 'active'";
	con.query(q, function(err,result)
	{
		if(err)
		{
			throw err;
		}
		if(result[0].val == 1)
		{
			req.session.name = email;
			res.redirect('/dashboard');
		}
		else
		{
			res.render('login');
		}
	});
});

app.get("/dashboard", function(req,res)
{
	if(req.session.name)
	{
		res.render('dashboard');
	}
	else 
	{
		res.redirect('/');
	}
});

/*------------------------------------------------------CATEGORY----------------------------------------------------*/
app.get("/add_category", function(req,res)
{
	if(req.session.name)
		res.render('Category/add_category');
	else 
		res.redirect('/');
})

/*-------------------------------------------------insert data into table-------------------------------------------*/
app.post("/addcategory", function(req,res)
{
	var form = new formidable.IncomingForm();
	form.parse(req,function(err,fields,files)
	{
		var cat, img, desc, status;
		cat = fields.cat_name;
		icon =fields.cat_icon
		img = files.cat_img.path;
		desc =fields.cat_description;
		status=fields.cat_status;
		var newpath = "./static/"+files.cat_img.name;

		console.log(img);
		console.log(newpath);

		fs.copy(img,newpath, function (err) {
		  if (err) throw err;
		  console.log('File Renamed!');
		});

		var q = "insert into category (category_name, category_icon, category_img, category_description, category_status) values ('" + cat +"', '" + icon + "', ' " + newpath + "', '" + desc + "', '" + status +"' )";
		console.log("desc " + desc);
		con.query(q, function(err, result)
		{
			if(err)
			{
				throw err;
			}
			console.log("category inserted; ");
			res.end('<a href = "/viewcategory">' + 'View Category' + '</a>');
		});
	});
		
});

/*-------------------------------------------------view whole table------------------------------------------------*/
// app.get("/viewcategory", function(req,res)
// {
// 	var q = "select * from category";
// 	con.query(q, function(err,result)
// 	{
// 		if(err)
// 		{
// 			throw err;
// 		}
// 		res.render("category_data", {data:result});
// 	});
// });

/*-----------------------------------------------------view through id---------------------------------------------*/
app.get("/view_cat_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from category where category_id = '" + req.params.id + "'";
		console.log(q);

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Category/showEntryByCatName", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*--------------------------------------------------update category------------------------------------------------*/
app.get("/update_cat_data/:cat_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from category where category_id = '" + req.params.cat_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Category/add_category", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_category/:cat_name", function(req,res)
{
	var form = new formidable.IncomingForm();
	var cat = req.params.cat_name;

	form.parse(req, function(err,fields, files)
	{
		var img, desc, status;
		icon = fields.cat_icon;
		img = files.cat_img.path;
		desc = fields.cat_description;
		status = fields.cat_status;

		var newpath = "./static/" + files.cat_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed after update!");
		});

		var q = "UPDATE category SET category_img = '" + newpath + "', category_icon = '" + icon + "' where category_name = '" + cat + "'";
		// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
		console.log("category: " + cat + " status: " + status + "image: " + img + "desc: " + desc);
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			res.redirect('/viewcategory');
		});	
	});
});

/*---------------------------------------------------delete category------------------------------------------------------------*/
app.get('/viewcategory', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from category";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Category/delete_category', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.get("/delete_cat_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from category where category_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewcategory');
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post('/deletecategory',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from category where category_id='"+ch+"'";
		console.log("DC 1 " + h);		
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from category where category_id='"+ch[i]+"'";
			console.log("DC 2 " + h);		
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewcategory');
});

/*-------------------------------------------------------Change Password--------------------------------------------------*/
app.get("/change_password", function(req,res)
{
	if(req.session.name)
	{
		var q='select email,password from admin where email = "'+req.session.name+'"';
		// var q = "select * from admin;"

		 con.query(q, function(err, result)
		 {
		 	if(err)
		 	{
		 		throw err;
	 		}	
		 	res.render('profile/change_password', {data:result});
		 });
	 } 
	 else 
	 {
	 	res.redirect('/');	
	 }
});

app.get("/passwordChange/:email", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from admin where email = '" + req.params.email + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("profile/change_password", {data:result});
		});
	} 
	else 
	{
		res.redirect('/');
	}
});

app.post("/set_password", function(req,res)
{
	var mail,current,new_pswd,re;
	var mail = req.body.user;
	current = req.body.current_password;
	new_pswd = req.body.new_password;
	re = req.body.re_password;

	if((current != new_pswd) && (new_pswd == re))
	{
		var q = "UPDATE admin SET password = '" + re + "' where email = '" + mail + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			req.session.destroy(function(err)
			{
				if(err)
				{
					throw err;
				}
				res.redirect('/');
			});
		});	
		console.log("tue");
	}
	else
	{
		res.redirect('/change_password');
		console.log("flse");
	}
	
});

/*-------------------------------------------------button to come back to dashboard-------------------------------------*/
app.post("/dash/:email", function(req,res)
{
	res.render('dashboard');
})

/*--------------------------------------------------Logout---------------------------------------------------------------*/
app.get('/logout', function(req,res)
{
	// delete req.session.name;
	// res.redirect('/login');

	if(req.session.name)
	{
		req.session.destroy(function(err)
		{
			if(err)
			{
				throw err;
			}
			else
			{
				console.log("expired");
				res.redirect('/');
			}
		});
	}
	else
	{
		res.redirect('/');
	}
});


/*---------------------------------------------------SERVICES------------------------------------------------------------*/
app.get("/add_service", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from category";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Services/add_service', {dat:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/addService", function(req,res)
{
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		var cat, img, desc, status, cat_id, name;

		cat_id = fields.cat_name;
		name = fields.ser_name;
		img = files.ser_img.path;
		des = fields.ser_description;
		amount = fields.book_amount;
		var newpath = "./static/"+files.ser_img.name;
		
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed");
		});

		var q = "insert into service set category_id = '" + cat_id + "', service_name = '" + name + "', service_img = '" + newpath + "', service_description = '" + des + "', book_amount = '" + amount + "'";
		console.log("desc " + desc);
		con.query(q, function(err, result)
		{
			if(err)
			{
				throw err;
			}
			console.log("Service inserted; ");
			res.end('<a href = "/viewservice">' + 'View Service' + '</a>');
		});
	});
});

app.get("/view_ser_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from service where service_id = '" + req.params.id + "'";
		console.log(q);

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Services/viewServiceEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*--------------------------------------------------update category------------------------------------------------*/
app.get("/update_ser_data/:ser_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from service where service_id = '" + req.params.ser_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Services/add_service", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.post("/update_service/:service_name", function(req,res)
{

	var cat, img, desc, status;
	ser = req.params.service_name;

	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		img = files.ser_img.path;
		desc = fields.ser_description;
		amount = fields.book_amount;
	
		var newpath = "./static/" + files.ser_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed after update");
		});

		var q = "UPDATE service SET service_img = '" + newpath + "', book_amount = '" + amount + "' where service_name = '" + ser + "'";
		// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			res.redirect('/viewservice');
		});	
	});
});

/*---------------------------------------------------delete------------------------------------------------------------*/
app.get('/viewservice', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from service";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Services/delete_service', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.get("/delete_ser_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from service where service_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			} 
			res.redirect('/viewservice');
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.post('/deleteservice',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from service where service_id='"+ch+"'";
		console.log("Delete single " + h);		
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from service where service_id='"+ch[i]+"'";
			console.log("Delete multiple " + h);		
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewservice');
});

/*--------------------------------------------------USER-----------------------------------------------------------------------*/
app.get("/add_user", function(req,res)
{
	res.render('User/add_user');
})

/*------------------insert data into table----------------------------*/
app.post("/adduser", function(req,res)
{
	var firstname, lastname, email, pswd, status;
	firstname = req.body.us_firstname;
	lastname = req.body.us_lastname;
	email = req.body.us_email;
	pswd = req.body.us_password;
	status = req.body.us_status;

	var q = "insert into user set user_firstname = '" + firstname + "', user_lastname = '" + lastname + "', user_email = '" + email + "', user_password = '" + pswd + "', user_status = '" + status + "'";

	con.query(q, function(err, result)
	{
		if(err)
		{
			throw err;
		}
		console.log("user inserted; ");
		res.end('<a href = "/viewuser">' + 'View Users' + '</a>');
	});
});

/*-------------------view through id---------------------------------*/
app.get("/view_us_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from user where user_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("User/viewUsEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*-----------------update project--------------------------------*/
app.get("/update_us_data/:us_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from user where user_id = '" + req.params.us_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("User/add_user", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_us/:us_nam", function(req,res)
{
	var name, email, status;
	name = req.params.us_nam;
	pswd = req.body.us_password;
	status = req.body.us_status;


	var q = "UPDATE user SET user_password = '" + pswd + "', user_status = '" + status + "' where user_email = '" + name + "'";
	// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
	con.query(q, function(err,result)
	{
		if(err)
		{
			throw err;
		}
		console.log("user updated");
		res.redirect('/viewuser');
	});	
});

/*--------------------------delete project------------------------------------*/
app.get('/viewuser', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from user";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('User/delete_user', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.get("/delete_us_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from user where user_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewuser');
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post('/deleteuser',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from user where user_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from user where user_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewuser');
});



/*-------------------------------------------------PROJECT---------------------------------------------------------------------*/
app.get("/add_project", function(req,res)
{
	res.render('Project/add_project');
})

/*------------------insert data into table----------------------------*/
app.post("/addproject", function(req,res)
{
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		var pro, img, desc, status;
		pro = fields.pro_name;
		img = files.pro_img.path;
		desc = fields.pro_description;
		status = fields.pro_status;

		var newpath = "./static/" + files.pro_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed");
		});

		var q = "insert into project (project_title, project_img, project_description, project_status) values ('" + pro + "', ' " + newpath + "', '" + desc + "', '" + status +"' )";
		console.log("desc " + desc);
		con.query(q, function(err, result)
		{
			if(err)
			{
				throw err;
			}
			console.log("project inserted; ");
			res.end('<a href = "/viewproject">' + 'View Project' + '</a>');
		});
	});
});

/*-------------------view through id---------------------------------*/
app.get("/view_pro_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from project where project_id = '" + req.params.id + "'";
		console.log(q);

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Project/viewEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*-----------------update project--------------------------------*/
app.get("/update_pro_data/:pro_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from project where project_id = '" + req.params.pro_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Project/add_project", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_project/:pro_name", function(req,res)
{
	var pro = req.params.pro_name;
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		var img, desc, status;
		img = files.pro_img.path;
		desc = fields.pro_description;
		status = fields.pro_status;
		var newpath = "./static/" + files.pro_img.name;

		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed after update");
		});

		var q = "UPDATE project SET project_img = '" + newpath + "', project_description = '" + desc + "' where project_title = '" + pro + "'";
		// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			res.redirect('/viewproject');
		});	
	});
});

/*--------------------------delete project------------------------------------*/
app.get('/viewproject', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from project";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Project/delete_project', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.get("/delete_pro_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from project where project_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewproject');
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.post('/deleteproject',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from project where project_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from project where project_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewproject');
});


/*-------------------------------------------------GALLERY---------------------------------------------------------------------*/
app.get("/add_gallery", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from project";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Gallery/add_gallery', {x:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.post("/addgallery", function(req,res)
{
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		var img, desc, status, cat_id;
		pro_name = fields.pro_title;
		title = fields.gal_title;
		img = files.gal_img.path;
		des = fields.gal_description;
		status = fields.gal_status;

		var newpath = "./static/" + files.gal_img.name;
		fs.copy(img, newpath, function(err)
		{
			if (err) throw err;
			console.log("file renamed");
		});

		var q = "insert into gallery set project_id = '" + pro_name + "', gallery_title = '" + title + "', gallery_img = '" + newpath + "', gallery_description = '" + des + "', gallery_status = '" + status + "'";
		con.query(q, function(err, result)
		{
			if(err)
			{
				throw err;
			}
			console.log("Gallery inserted; ");
			res.end('<a href = "/viewgallery">' + 'View Gallery' + '</a>');
		});
	});
});

app.get("/view_gal_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from gallery where gallery_id = '" + req.params.id + "'";
		console.log(q);

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Gallery/viewGalleryEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*--------------------------------------------------update category------------------------------------------------*/
app.get("/update_gal_data/:gal_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from gallery where gallery_id = '" + req.params.gal_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Gallery/add_gallery", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.post("/update_gallery/:gal_title", function(req,res)
{
	var title = req.params.gal_title;
	var form = new formidable.IncomingForm();

	form.parse(req, function(err, fields, files)
	{
		var img, desc, status;
		img = files.gal_img.path;
		desc = fields.gal_description;
		status = fields.gal_status;

		var newpath = "./static/" + img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed after updated");
		});

		var q = "UPDATE gallery SET gallery_img = '" + newpath + "', gallery_status = '" + status + "' where gallery_title = '" + title + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			res.redirect('/viewgallery');
		});
	});		
});

/*---------------------------------------------------delete------------------------------------------------------------*/
app.get('/viewgallery', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from gallery";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Gallery/delete_gallery', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.get("/delete_gal_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from gallery where gallery_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			} 
			res.redirect('/viewgallery');
		});
	}
	else
	{
		res.redirect('/');
	}
});

app.post('/deletegallery',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from gallery where gallery_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from gallery where gallery_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewgallery');
});

/*------------------------------------------------MEMBERSHIP-------------------------------------------------------------------*/
app.get("/add_membership", function(req,res)
{
	res.render('Membership/add_membership');
})

/*------------------insert data into table----------------------------*/
app.post("/addMembership", function(req,res)
{
	var mem, desc, price, status;
	mem = req.body.mem_title;
	desc = req.body.mem_description;
	price = req.body.mem_price;
	status = req.body.mem_status;

	// var q = "insert into category set category_name = '" + cat + "', category_img = '" + img + "'and category_description + '"+ desc +"', category_status = '" + status + "'";
	var q = "insert into membership (membership_title, membership_description, membership_price, membership_status) values ('" + mem + "', ' " + desc + "', '" + price + "', '" + status +"' )";
	con.query(q, function(err, result)
	{
		if(err)
		{
			throw err;
		}
		console.log("membership insert ed; ");
		res.end('<a href = "/viewmembership">' + 'View Membership' + '</a>');
	});
});

/*-------------------view through id---------------------------------*/
app.get("/view_mem_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from membership where membership_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Membership/viewMemEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*-----------------update project--------------------------------*/
app.get("/update_mem_data/:mem_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from membership where membership_id = '" + req.params.mem_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Membership/add_membership", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_membership/:mem_title", function(req,res)
{
	var mem, img, desc, status;
	mem = req.params.mem_title;
	desc = req.body.mem_description;
	price = req.body.mem_price;
	status = req.body.mem_status;

	var q = "UPDATE membership SET membership_description = '" + desc + "', membership_price = '" + price + "' where membership_title = '" + mem + "'";
	// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
	con.query(q, function(err,result)
	{
		if(err)
		{
			throw err;
		}
		console.log("record updated");
		res.redirect('/viewmembership');
	});	
});

/*--------------------------delete project------------------------------------*/
app.get('/viewmembership', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from membership";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Membership/delete_membership', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.get("/delete_mem_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from membership where membership_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewmembership');
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post('/deletemembership',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from membership where membership_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from membership where membership_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewmembership');
});

/*-----------------------------------------------TESTIMONIALS------------------------------------------------------------------*/
app.get("/add_testimonial", function(req,res)
{
	res.render('Testimonials/add_testimonial');
})

/*------------------insert data into table----------------------------*/
app.post("/addTestimonial", function(req,res)
{
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		var test, desig, review, img;
		test = fields.test_name;
		desig = fields.test_designation;
		review = fields.test_review;
		img = files.test_img.path;

		var newpath = "./static/" + files.test_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed");
		});

		var q = "insert into testimonial (testimonial_name, testimonial_designation, testimonial_review, testimonial_img) values ('" + test + "', ' " + desig + "', '" + review + "', '" + newpath +"' )";
		con.query(q, function(err, result)
		{
			if(err)
			{
				throw err;
			}
			console.log("testimonial inserted; ");
			res.end('<a href = "/viewtestimonial">' + 'View Testimonial' + '</a>');
		});
	});
	
});

/*-------------------view through id---------------------------------*/
app.get("/view_test_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from testimonial where testimonial_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Testimonials/viewTestEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*-----------------update project--------------------------------*/
app.get("/update_test_data/:test_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from testimonial where testimonial_id = '" + req.params.test_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Testimonials/add_testimonial", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_testimonial/:test_nam", function(req,res)
{
	var name, desig, review, img;
	name = req.params.test_nam;

	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		desig = fields.test_designation;
		review = fields.test_review;
		img = files.test_img.path;

		var newpath = "./static/" + files.test_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed");
		});

		var q = "UPDATE testimonial SET testimonial_review = '" + review + "', testimonial_img = '" + newpath + "' where testimonial_name = '" + name + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			res.redirect('/viewtestimonial');
		});	
	});
	
});

/*--------------------------delete project------------------------------------*/
app.get('/viewtestimonial', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from testimonial";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Testimonials/delete_testimonial', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.get("/delete_test_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from testimonial where testimonial_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewtestimonial');
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post('/deletetestimonial',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from testimonial where testimonial_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from testimonial where testimonial_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewtestimonial');
});

/*--------------------------------------------------BLOG-----------------------------------------------------------------------*/
app.get("/add_blog", function(req,res)
{
	res.render('Blog/add_blog');
})

/*------------------insert data into table----------------------------*/
app.post("/addBlog", function(req,res)
{
	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		var test, desig, review, img, desc, status;
		title = fields.blg_title;
		date = fields.blg_date;
		author = fields.blg_author;
		img = files.blg_img.path;
		desc = fields.blg_description;
		status = fields.blg_status;

		var newpath = "/static/" + files.blg_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed");
		});

		var q = "insert into blog (blog_title, blog_date, blog_author, blog_img, blog_description, blog_status) values ('" + title + "', ' " + date + "', '" + author + "', '" + newpath + "', '" + desc + "', '" + status + "' )";
		con.query(q, function(err, result)
		{
			if(err)
			{
				throw err;
			}
			console.log("blog inserted; ");
			res.end('<a href = "/viewblog">' + 'View Blogs' + '</a>');
		});
	});
	
});

/*-------------------view through id---------------------------------*/
app.get("/view_blg_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from blog where blog_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Blog/viewBlogEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*-----------------update project--------------------------------*/
app.get("/update_blg_data/:blg_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from blog where blog_id = '" + req.params.blg_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Blog/add_blog", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_blog/:blg_title", function(req,res)
{
	var title, date, author, img, desc, status;
	title = req.params.blg_title;

	var form = new formidable.IncomingForm();
	form.parse(req, function(err, fields, files)
	{
		date = fields.blg_date;
		author = fields.blg_author;
		img = files.blg_img.path;
		desc = fields.blg_description;
		status = fields.blg_status;

		var newpath = "/static/" + files.blg_img.name;
		fs.copy(img, newpath, function(err)
		{
			if(err) throw err;
			console.log("file renamed after updated");
		});

		var q = "UPDATE blog SET blog_img= '" + newpath + "', blog_status = '" + status + "' where blog_title = '" + title + "'";
		// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			console.log("record updated");
			res.redirect('/viewblog');
		});	
	});
	
});

/*--------------------------delete project------------------------------------*/
app.get('/viewblog', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from blog";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Blog/delete_blog', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.get("/delete_blg_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from blog where blog_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewblog');
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post('/deleteblog',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from blog where blog_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from blog where blog_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewblog');
});

/*------------------------------------------------SUBSCRIBE--------------------------------------------------------------------*/
app.get("/add_subscribe", function(req,res)
{
	res.render('Subscribe/add_subscribe');
})

/*------------------insert data into table----------------------------*/
app.post("/addSubscribe", function(req,res)
{
	var name, email, status;
	name = req.body.sub_name;
	email = req.body.sub_email;
	status = req.body.sub_status;

	var q = "insert into subscribe (subscribe_name, subscribe_email, subscribe_status) values ('" + name + "', ' " + email + "', '" + status + "' )";
	con.query(q, function(err, result)
	{
		if(err)
		{
			throw err;
		}
		console.log("subscription inserted; ");
		res.end('<a href = "/viewsubscribe">' + 'View Subscriptions' + '</a>');
	});
});

/*-------------------view through id---------------------------------*/
app.get("/view_sub_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from subscribe where subscribe_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Subscribe/viewSubEntry", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
});

/*-----------------update project--------------------------------*/
app.get("/update_sub_data/:sub_id", function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from subscribe where subscribe_id = '" + req.params.sub_id + "'";

		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render("Subscribe/add_subscribe", {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post("/update_sub/:sub_nam", function(req,res)
{
	var name, email, status;
	name = req.params.sub_nam;
	email = req.body.sub_email;
	status = req.body.sub_status;


	var q = "UPDATE subscribe SET subscribe_email = '" + email + "', subscribe_status = '" + status + "' where subscribe_name = '" + name + "'";
	// q += "update category set category_description = '" + desc + "' where category_name = '" + cat + "'";
	con.query(q, function(err,result)
	{
		if(err)
		{
			throw err;
		}
		console.log("subscription updated");
		res.redirect('/viewsubscribe');
	});	
});

/*--------------------------delete project------------------------------------*/
app.get('/viewsubscribe', function(req,res)
{
	if(req.session.name)
	{
		var q = "select * from subscribe";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.render('Subscribe/delete_subscribe', {data:result});
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.get("/delete_sub_data/:id", function(req,res)
{
	if(req.session.name)
	{
		var q = "delete from subscribe where subscribe_id = '" + req.params.id + "'";
		con.query(q, function(err,result)
		{
			if(err)
			{
				throw err;
			}
			res.redirect('/viewsubscribe');
		});
	}
	else
	{
		res.redirect('/');
	}
	
});

app.post('/deletesubscribe',function(req,res)  
{
	var ch = req.body.check;
	if(typeof ch == "string")    										//single delete through checks
	{
		var q= "delete from subscribe where subscribe_id='"+ch+"'";
		con.query(q, function(err,result)
		{
			console.log('deleted');
      	});
	}	
	else	                   											//multiple delete's
	{
		for( var i = 0; i < ch.length; i++) 
		{
			var h= "delete from subscribe where subscribe_id='"+ch[i]+"'";
			con.query(h,function(err,result)
			{
				console.log('deleted');
	      	});
		}
	}
	res.redirect('/viewsubscribe');
});

app.listen(9999);