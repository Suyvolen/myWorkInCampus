<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>商品信息详情</title>

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
					class="fa fa-bars fa-2x"></i></a> <a href="adminLogin.jsp"
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


					<li><a href="index.html"><i class="fa fa-dashboard "></i>主页</a>
					</li>
					<li><a href="#"><i class="fa fa-sitemap "></i>用户管理 <span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="getAllCustomers"><i class="fa fa-bicycle "></i>用户一览</a>
							</li>
							<li><a href="customerUpdate"><i class="fa fa-flask "></i>用户修改</a>
							</li>
						</ul></li>
					<li><a href="#"><i class="fa fa-sitemap "></i>商品管理 <span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="getAllItems"><i class="fa fa-bicycle "></i>商品一览</a>
							</li>
							<li><a href="addItem.jsp"><i class="fa fa-flask "></i>商品添加</a></li>
						</ul></li>
					<li><a href="getAllFeedbacks"><i class="fa fa-bicycle "></i>反馈信息</a>
					</li>
					<li><a href="adminLogin.jsp"><i class="fa fa-sign-in "></i>退出</a>
					</li>
				</ul>
			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-head-line">Item Detail Table</h1>
						<h1 class="page-subhead-line">For item details.</h1>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-12">
					    <div class="panel panel-danger">
					        <div class="panel-body">
					            <form role="form">
							        <div class="form-group">
										<button class="btn btn-danger" 
										style="margin-left:20px"><a href="getAllItems" 
										style="text-decoration:none;color:white">全部商品</a></button>
									</div>
							    </form>
					        </div>
					    </div>
					</div>
				</div>

				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="panel panel-danger">
							<div class="panel-heading">DETAIL FORM</div>
							<div class="panel-body">
								<s:form action="itemUpdate" method="post" role="form">
									<div class="form-group">
										<label>编号</label> <input class="form-control" type="text"
											value="${item.itemID}" name="item.itemID">
									</div>
									<div class="form-group">
										<label>名称</label> <input class="form-control" type="text"
											value="${item.name}" name="item.name">
									</div>
									<div class="form-group">
										<label>描述</label> <input class="form-control" type="text"
											value="${item.description}" name="item.description">
									</div>
									<div class="form-group">
										<label>单价</label> <input class="form-control" type="text"
											value="${item.price}" name="item.price">
									</div>
									<button type="submit" class="btn btn-danger">提交修改</button>
								</s:form>
								<div class="form-group">
									<label class="control-label col-lg-4">Item Image</label>
									<div class="">
										<div class="fileupload fileupload-new"
											data-provides="fileupload">
											<div class="fileupload-new thumbnail"
												style="width: 200px; height: 150px;">
												<img src="../image/item_${item.itemID}.jpg" alt="暂无图片" />
											</div>
										</div>
									</div>
								</div>
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
