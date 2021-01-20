<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>商品信息一览</title>

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
						<h1 class="page-head-line">Feedback Table</h1>
						<h1 class="page-subhead-line">For operations to Feedbacks
							including details and deleting.</h1>
					</div>
				</div>
				
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<div class="panel panel-danger">
							<div class="panel-body">
								<form action="findLikeItem" method="post" role="form">
									<div class="form-group">
										<input class="form-control" type="text"
											name="itemname" placeholder="输入商品名称以查询">
										<button type="submit" class="btn btn-danger">查询
										</button><button class="btn btn-danger" 
										style="margin-left:20px"><a href="getAllItems" 
										style="text-decoration:none;color:white">全部商品</a></button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<!--    Striped Rows Table  -->
						<div class="panel panel-default">
							<div class="panel-heading">Feedback Table</div>
							<div class="panel-body">
								<%--用于输出提示信息--%>
								<p>${requestScope.tip}</p>
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th>商品名称</th>
												<th>描述</th>
												<th>单价</th>
												<th>查看</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="items">
												<tr>
													<td><s:property value="itemID" /></td>
													<td><s:property value="name" /></td>
													<td><s:property value="description" /></td>
													<td><s:property value="price" /></td>
													<form action="itemDetail" method="post">
														<input type="text" name="item.itemID"
															value="<s:property value="itemID"/>"
															style="display: none"> <input type="text"
															name="item.name" value="<s:property value="name"/>"
															style="display: none"> <input type="text"
															name="item.description" value="<s:property value="description"/>"
															style="display: none"> <input type="text"
															name="item.price"
															value="<s:property value="price"/>"
															style="display: none">
														<td><button type="submit">查看</button></td>
													</form>
													<form action="itemDelete" method="post">
														<input type="text" name="item.itemID"
															value="<s:property value="itemID"/>"
															style="display: none"> <input type="text"
															name="item.name" value="<s:property value="name"/>"
															style="display: none"> <input type="text"
															name="item.description" value="<s:property value="description"/>"
															style="display: none"> <input type="text"
															name="item.price"
															value="<s:property value="price"/>"
															style="display: none">
														<td><button type="submit">删除</button></td>
													</form>
												</tr>
											</s:iterator>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!--  End  Striped Rows Table  -->
					</div>

				</div>
				<!-- /. ROW  -->

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
