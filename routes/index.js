var express = require('express');
var router = express.Router();
var connection = require('./connection');
var passwordHash = require('password-hash');
var _ = require('lodash');
var fs = require('fs');
var path=require('path');
var multipart = require('connect-multiparty');
var multipartMiddleware = multipart();
var async = require("async");

var lstUID = '';


/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});



router.post('/registerUser', function(req, res, next){
	var reqObj = req.body;   
	var pwd = passwordHash.generate(reqObj.password);
	var newUserID;
	var findID = "SELECT MAX(`user_id`)+1 as id FROM `register_quiz`";
	var query = connection.query(findID, function (err, newId){
		newUserID = 'QUIZ000'+newId[0].id;
		
		var insertSql = "INSERT INTO register_quiz SET ?";
		var insertValues = {
			"UID": newUserID,
			"user_name" : reqObj.username,
			"user_email" : reqObj.email,
			"user_mobile": reqObj.mobnum,
			"user_pwd": pwd,
			"profile_picture" : "http://localhost:8100/assets/images/profilepics/default.png"
		};

		var query = connection.query(insertSql, insertValues, function (err, result){
			if(err){
				console.error('SQL error: ', err);
				res.json({
		            status:false,
		            message:'there are some error with query'
		        })
			} else {
				var Employee_Id = result.insertId;
				res.json({
		            status:true,
		            data:{"Emp_id":Employee_Id},
		            message:'User Registered Sucessfully'
		        })
			}
		});
	});
});

router.post('/usersLogin', function(req, res, next){
	var reqObj = req.body;   
	var pwd = passwordHash.generate(reqObj.password);	
	
	var selectSql = "SELECT * FROM `register_quiz` where user_email = ?";
	var query = connection.query(selectSql,[reqObj.email], function (err, result){
		if(err){
			console.error('SQL error: ', err);
			res.json({status:false, message: "Kindly try again!"});
		} else {
			if(result.length >0){
				if(passwordHash.verify(reqObj.password, result[0].user_pwd)){
					res.json({
	                    status:true,
	                    data:{"UID":result[0].UID, "user_id": result[0].user_id,"user_name": result[0].user_name,"user_id": result[0].user_id,"user_mobile": result[0].user_mobile},
	                    message:'successfully authenticated'
	                });
				} else {
					res.json({
	                	status:false,
	                  	message:"Email and password does not match"
	                });
				}
			} else {
				res.json({
                	status:false,
                  	message:"Email and password does not exist. Kindly Register."
                });
			}
		}
	});
});

router.get('/getRegisterUsers', function(req,res,next){
	var selectSql = "SELECT user_name, user_email, user_mobile FROM `register_quiz`";

	var query = connection.query(selectSql, function (err, result){
		if(err){
			console.error('SQL error: ', err);
			return next(err);
		}
		res.json(result);
	});
});

router.post('/questionSet', function(req, res, next){
	var reqObj = req.body; 
	var selectSql;
	if(reqObj.training === "angularjs"){
		selectSql = "SELECT * FROM `angular_questionset`";	
	} else if(reqObj.training === "knockoutjs"){
		selectSql = "SELECT * FROM `knockout_questionset`";
	} else if(reqObj.training === "bootstrap"){
		selectSql = "SELECT * FROM `bootstrap_questionset`";
	} else if(reqObj.training === "nodejs"){
		selectSql = "SELECT * FROM `nodejs_questionset`";
	}
	var query = connection.query(selectSql, function (err, result){
		if(err){
			console.error('SQL error: ', err);
			return next(err);
		} else {
			_.each(result, function(i){
		        var resdata = new Array();
		        if(i.option4 != ""){
			        resdata.push(i.option1);resdata.push(i.option2);resdata.push(i.option3);resdata.push(i.option4);
			    } else if(i.option4 != ""){
			    	resdata.push(i.option1);resdata.push(i.option2);resdata.push(i.option3);
			    } else {
			    	resdata.push(i.option1);resdata.push(i.option2);
			    }
			    i.options=resdata;
			    delete(i.option1);
			    delete(i.option2); 
			    delete(i.option3);
			    delete(i.option4);
			    delete(i.id);
		    });
			//console.log(JSON.stringify(result));
			var data = new Object();
			data.result = result;
			data.count = result.length;
			res.json(data);
		}
		
	});	
});

router.get('/getCategories', function(req,res,next){
	var selectSql = "SELECT * FROM `quiz_category`";

	var query = connection.query(selectSql, function (err, result){
		if(err){
			console.error('SQL error: ', err);
			return next(err);
		}
		res.json(result);
	});
});

router.post('/saveScore', function(req,res,next){
	var reqObj = req.body;
	var insertSql;
	var uid;
	var findResult = "SELECT * FROM `quiz_result` WHERE UID = ?";
	var query = connection.query(findResult,[reqObj.UID], function (err, result){
		if(err){
			console.error('SQL error: ', err);
			return next(err);
		} else {
			if(result.length >0){
				uid = reqObj.UID;
				delete reqObj.UID;
				insertSql = "UPDATE quiz_result SET ? WHERE UID = ?";	
				var query = connection.query(insertSql, [reqObj, uid], function (err, result){
					if(err){
						console.error('SQL error: ', err);
						res.json({
				            status:false,
				            message:'there are some errors'
				        })
					} else {
						res.json({
				            status:true,
				            message:'Score Submitted Sucessfully'
				        })
					}
				});			
			} else {
				insertSql = "INSERT INTO quiz_result SET ?";
				var query = connection.query(insertSql, reqObj, function (err, result){
					if(err){
						console.error('SQL error: ', err);
						res.json({
				            status:false,
				            message:'there are some errors'
				        })
					} else {
						res.json({
				            status:true,
				            message:'Score Submitted Sucessfully'
				        })
					}
				});	
			}
			
			
		}
	});
});

router.post('/getUserDetails', function(req,res,next){
	var reqObj = req.body;
	var selectSql = "SELECT * from `register_quiz` where UID = ?";
	lstUID = reqObj.UID;
	var query = connection.query(selectSql,[reqObj.UID], function (err, result){
		//console.log(query);
		if(err){
			console.error('SQL error: ', err);
			res.json({status:false, message: "Kindly try again!"});
		} else {
			delete(result[0].user_pwd);
			res.json(result[0]);
		}
	});
});

router.post('/updateUserDetails', function(req,res,next){
	var reqObj = req.body;
	uid = reqObj.UID;
	lstUID = uid;
	delete reqObj.UID;
	insertSql = "UPDATE register_quiz SET ? WHERE UID = ?";	
	console.log(reqObj);
	var query = connection.query(insertSql, [reqObj, uid], function (err, result){
		if(err){
			console.error('SQL error: ', err);
			res.json({
	            status:false,
	            message:'There are some errors while uploading'
	        })
		} else {
			res.json({
	            status:true,
	            message:'Your Profile got updated Sucessfully'
	        })
		}
	});	
});

router.post('/uploadPics', multipartMiddleware, function(req, res) {
	//console.log(req.files);
	fs.readFile(req.files.image.path, function (err, data){ 
		var dirname = 'C:/Users/anmukhop/ionicLearn/quiz_angular2/src/assets/images'+'/profilepics/'; 
		var newPath = dirname +   req.files.image.originalFilename; 
		//console.log(newPath);
		var imgLoc = 'http://localhost:8100/assets/images/profilepics/'+req.files.image.originalFilename;
    	
    	fs.writeFile(newPath, data, function (err) {
		    if(err){
				res.json({"status":"false", "message":"Failed to upload your file"});
			}else {
				res.json({"status":"true", "message":"Successfully uploaded your file"});
			}
		});

		var img = {profile_picture: imgLoc};
		console.log(img);
		var insertSql = "UPDATE register_quiz SET ? WHERE UID = ?";	
		var query = connection.query(insertSql, [img, lstUID], function (err, result){
			if(err){
				console.error('SQL error: ', err);
			} else {
				console.log('Wow');
			}
		});
	});
});

router.get('/topScorers', function(req, res, next){
	var finalResult = new Array();
	
	var angularHighest = "select quiz_result.uid,quiz_result.angularjs as OBTAIN,register_quiz.user_name, register_quiz.profile_picture,register_quiz.user_email, DATE_FORMAT(quiz_result.submission_time, '%W %M %e %Y') as submission_time, Hour(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffhour, Minute(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffminute from quiz_result,register_quiz where quiz_result.uid = register_quiz.uid and quiz_result.angularjs = (SELECT MAX(angularjs) from quiz_result)";

	var nodeHighest = "select quiz_result.uid,quiz_result.nodejs as OBTAIN,register_quiz.user_name, register_quiz.profile_picture,register_quiz.user_email, DATE_FORMAT(quiz_result.submission_time, '%W %M %e %Y') as submission_time, Hour(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffhour, Minute(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffminute from quiz_result,register_quiz where quiz_result.uid = register_quiz.uid and quiz_result.nodejs = (SELECT MAX(nodejs) from quiz_result)";
	var knockoutHighest = "select quiz_result.uid,quiz_result.knockoutjs as OBTAIN,register_quiz.user_name, register_quiz.profile_picture,register_quiz.user_email, DATE_FORMAT(quiz_result.submission_time, '%W %M %e %Y') as submission_time, Hour(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffhour, Minute(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffminute from quiz_result,register_quiz where quiz_result.uid = register_quiz.uid and quiz_result.knockoutjs = (SELECT MAX(knockoutjs) from quiz_result)";
	var bootstrapHighest = "select quiz_result.uid,quiz_result.bootstrap as OBTAIN,register_quiz.user_name, register_quiz.profile_picture,register_quiz.user_email, DATE_FORMAT(quiz_result.submission_time, '%W %M %e %Y') as submission_time, Hour(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffhour, Minute(TIMEDIFF(CURRENT_TIMESTAMP, quiz_result.submission_time)) as timediffminute from quiz_result,register_quiz where quiz_result.uid = register_quiz.uid and quiz_result.bootstrap = (SELECT MAX(bootstrap) from quiz_result)";	
	
    async.parallel([
       function(parallel_done) {
           connection.query(angularHighest, {}, function(err, results) {
               if (err) return parallel_done(err);
               results[0].logo = 'https://i.ytimg.com/vi/Inkz9JmL__k/maxresdefault.jpg';
               finalResult.push(results[0]);
               parallel_done();
           });
       },
       function(parallel_done) {
           connection.query(nodeHighest, {}, function(err, results) {
               if (err) return parallel_done(err);
               results[0].logo = 'http://asphostportal.com/img/icon-nodejs.png';
               finalResult.push(results[0]);
               parallel_done();
           });
       },
       function(parallel_done) {
           connection.query(knockoutHighest, {}, function(err, results) {
               if (err) return parallel_done(err);
               results[0].logo = 'https://udemy-images.udemy.com/course/750x422/70562_3496_3.jpg';
               finalResult.push(results[0]);
               parallel_done();
           });
       },
       function(parallel_done) {
           connection.query(bootstrapHighest, {}, function(err, results) {
               if (err) return parallel_done(err);
               results[0].logo = 'https://control.divio.com/media/tmp/addons/225/small_promo_image_1.png.440x280_q99_crop_upscale.png';
               finalResult.push(results[0]);
               parallel_done();
           });
       }
    ], function(err) {
         if (err) console.log(err);
         res.send(finalResult);
    });
});

module.exports = router;
