<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>购物网站后台管理系统登录</title>

<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />

</head>     
<body style="background-color: #E2E2E2;">
	<div class="container">
		<div class="row text-center " style="padding-top: 100px;">
			<div class="col-md-12">
				<img src="assets/img/logo-invoice.png" />
			</div>
		</div>
		<div class="row ">
			<div
				class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">

				<div class="panel-body">
					<%--用于输出提示信息，必须的--%>
					<s:fielderror></s:fielderror>
					<p>${requestScope.tip}</p> 
					<form action="adminLogin" method="post" role="form">
						<hr />
						<h5>输入相关信息登录</h5>
						<br/>
						<div class="form-group input-group">
							<span class="input-group-addon"><i class="fa fa-tag"></i></span>
							<input type="text" class="form-control" name="adminUser.username"
								placeholder="输入账号 " />
						</div>
						<div class="form-group input-group">
							<span class="input-group-addon"><i class="fa fa-lock"></i></span>
							<input type="password" class="form-control"
								name="adminUser.password" placeholder="输入密码，请保证坏境安全" />
						</div>
						<div class="form-group">
							<label class="checkbox-inline"> <input type="checkbox" />
								记住我
							</label> <span class="pull-right"> <a href="index.html">忘记密码 ?
							</a>
							</span>
						</div>
						<button type="submit" class="btn btn-primary ">登录</button>
						<hr />
						还未注册 ? <a href="index.html">点这儿 </a> 或者去 <a href="index.html">主页</a>
					</form>
				</div>

			</div>


		</div>
	</div>

</body>
</html>
