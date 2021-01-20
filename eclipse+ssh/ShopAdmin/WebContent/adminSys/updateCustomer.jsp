<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>用户信息更新</title>

<!-- BOOTSTRAP STYLES-->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<!-- FONTAWESOME STYLES-->
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<!--CUSTOM BASIC STYLES-->
<link href="assets/css/basic.css" rel="stylesheet" />
<!--CUSTOM MAIN STYLES-->
<link href="assets/css/custom.css" rel="stylesheet" />
<!-- GOOGLE FONTS-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">ADMINISTRATION</a>
			</div>

			<div class="header-right">

				<a href="message-task.html" class="btn btn-info" title="New Message"><b>30
				</b><i class="fa fa-envelope-o fa-2x"></i></a> <a href="message-task.html"
					class="btn btn-primary" title="New Task"><b>40 </b><i
					class="fa fa-bars fa-2x"></i></a> <a href="login.html"
					class="btn btn-danger" title="Logout"><i
					class="fa fa-exclamation-circle fa-2x"></i></a>


			</div>
		</nav>
		<!-- /. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li>
						<div class="user-img-div">
							<img src="assets/img/user.png" class="img-thumbnail" />

							<div class="inner-text">
								Gly <br /> <small>上次登录 : 2周前 </small>
							</div>
						</div>

					</li>


					<li>
                        <a  href="index.html"><i class="fa fa-dashboard "></i>主页</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap "></i>用户管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="getAllCustomers"><i class="fa fa-bicycle "></i>用户一览</a>
                            </li>
                             <li>
                                <a href="customerUpdate"><i class="fa fa-flask "></i>用户修改</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-sitemap "></i>商品管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="getAllItems"><i class="fa fa-bicycle "></i>商品一览</a>
                            </li>
                             <li>
                                <a href="addItem.jsp"><i class="fa fa-flask "></i>商品添加</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                         <a href="getAllFeedbacks"><i class="fa fa-bicycle "></i>反馈信息</a>
                    </li>
                    <li>
                        <a href="adminLogin.jsp"><i class="fa fa-sign-in "></i>退出</a>
                    </li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-head-line">Basic Forms</h1>
						<h1 class="page-subhead-line">This is dummy text , you can
							replace it with your original text.</h1>
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="panel panel-danger">
							<div class="panel-heading">SINGUP FORM</div>
							<div class="panel-body">
							    <!-- 输出验证信息 -->
							    <s:fielderror></s:fielderror>
							    <s:fielderror></s:fielderror>
								<form action="customerUpdate" role="form">
									<div class="form-group">
										<label>用户编号</label> <input class="form-control" type="text"
											name="customer.customerID" readonly="readonly" 
											value="${customer.customerID}">
									</div>
									<div class="form-group">
										<label>用户名</label> <input class="form-control" type="text"
											name="customer.account" 
											value="${customer.account}">
									</div>
									<div class="form-group">
										<label>密码</label> <input class="form-control" type="text"
											name="customer.password" 
											value="${customer.password}">
									</div>
									<div class="form-group">
										<label>姓名</label> <input class="form-control" type="text"
											name="customer.name" 
											value="${customer.name}">
									</div>
									<div class="form-group">
										<label>性别</label> <input class="form-control" type="text"
											name="customer.sex" placeholder="请输入‘男’或‘女’"
											value="${customer.sex}">
									</div>
									<div class="form-group">
										<label>电话</label> <input class="form-control" type="text"
											name="customer.phone" readonly="readonly"
											value="${customer.phone}">
									</div>
									<div class="form-group">
										<label>电子邮箱</label> <input class="form-control" type="text"
											name="customer.email"
											value="${customer.email}">
									</div>
									<div class="form-group">
										<label>联系地址</label> <input class="form-control" type="text"
											name="customer.address" 
											value="${customer.address}">
									</div>
									<button type="submit" class="btn btn-danger">提交修改</button>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<div id="footer-sec">
		&copy; 2014 YourCompany | Design By : <a
			href="http://www.binarytheme.com/" target="_blank">BinaryTheme.com</a>
	</div>
	<!-- /. FOOTER  -->
	<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
	<!-- JQUERY SCRIPTS -->
	<script src="assets/js/jquery-1.10.2.js"></script>
	<!-- BOOTSTRAP SCRIPTS -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- METISMENU SCRIPTS -->
	<script src="assets/js/jquery.metisMenu.js"></script>
	<!-- CUSTOM SCRIPTS -->
	<script src="assets/js/custom.js"></script>


</body>
</html>