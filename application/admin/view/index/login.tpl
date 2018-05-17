
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登录{$Think.const.WEB_NAME}后台管理中心</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	
	
	<link rel="stylesheet" href="/admin/css/bootstrap.min.css">
	<link rel="stylesheet" href="/admin/css/animate.css">
	<link rel="stylesheet" href="/admin/css/style1.css">


	<!-- Modernizr JS -->
	<script src="/admin/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/admin/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<!-- Start Sign In Form -->
					<form action="/admin/index/login.html" method="post" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>登录</h2>
						<div class="form-group">
							<label for="username" class="sr-only">Username</label>
							<input type="text" name="username" class="form-control" id="username" placeholder="Username" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">Password</label>
							<input type="password" name="password" class="form-control" id="password" placeholder="Password" autocomplete="off">
						</div>
						<div class="form-group">
							<input type="submit" value="立即登录" class="btn btn-primary">
						</div>
					</form>
					<!-- END Sign In Form -->

				</div>
			</div>
			<div class="row" style="padding-top: 170px; clear: both;">
				<div class="col-md-12 text-center">
					<p>
						<small>
							All Rights Reserved. More Templates 
								<a href="http://www.miitbeian.gov.cn/" target="_blank">备案号:{$Think.const.WEB_ICP}</a>
						</small>
					</p>
				</div>
			</div>
		</div>
	
	<!-- jQuery -->
	<script src="/admin/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/admin/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="/admin/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="/admin/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="/admin/js/main.js"></script>


	</body>
</html>

