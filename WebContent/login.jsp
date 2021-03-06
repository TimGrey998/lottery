<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="Kodinger">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>抽奖系统登陆</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/my-login.css">
<link rel="icon" href="/lottery/layui/images/logo.png" type="image/x-icon" />
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="/lottery/img/logo.jpg">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">抽奖系统后台登陆</h4>
							<form action="/lottery/login" method="post"
								class="my-login-validation">
								<div class="form-group">
									<label for="email">用户名</label> <input id="email" type="text"
										class="form-control" name="name" required autofocus>
									<div class="notice">
										<p style="color: red;">${message}</p>
									</div>
								</div>

								<div class="form-group">
									<label for="password">密码 <a href="forgot.html"
										class="float-right"> Forgot Password? </a>
									</label> <input id="password" type="password" class="form-control"
										name="pwd" required data-eye>
									<div class="invalid-feedback">Password is required</div>
								</div>

								<div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="remember" id="remember"
											class="custom-control-input"> <label for="remember"
											class="custom-control-label">Remember Me</label>
									</div>
								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Login</button>
								</div>
								<div class="mt-4 text-center">
									Don't have an account? <a href="register.html">Create One</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">Copyright &copy; 2017 &mdash; Your
						Company</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
