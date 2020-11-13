<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Sign Up </title>
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
	</head>
	
	<body class="authentication-bg">
		<div class="account-pages pt-5 my-5">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-8 col-lg-6 col-xl-5">
						<div class="account-card-box">
							<div class="card mb-0">
								<div class="card-body p-4">
									<div class="text-center">
										<div class="my-3">
											<a href="#">
												<span>
													<img src="<c:url value='/template/admin/images/logo.png' />" height="28">
												</span>
											</a>
										</div>
										<h5 class="text-muted text-uppercase py-3 font-16">Đăng ký</h5>
									</div>
									<form id="form" action="<c:url value="/register" />" class="mt-2" method="post">
										<div class="form-group mb-3">
											<input class="form-control" type="text" id="username" 
													name="username"  placeholder="Nhập tên tài khoản" onfocusout="getUser()">
											<span>
												<small id="warningUsername" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											<input class="form-control" type="text" id="fullname" 
													name="fullname"  placeholder="Nhập họ và tên">
											<span>
												<small id="warningFullname" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											<input class="form-control" type="text" id="email"
											 		name="email" placeholder="Nhập địa chỉ email">
											 <span>
												<small id="warningEmail" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											<input class="form-control" type="password" id="password" 
													name="password" placeholder="Nhập mật khẩu">
											<span>
												<small id="warningPassword" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											<input class="form-control" type="password" id="confirm" 
													name="confirm" placeholder="Nhập xác nhận mật khẩu">
											<span>
												<small id="warningConfirm" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											<input class="form-control" type="tel" id="phone"
													name="phone" placeholder="Nhập số điện thoại">
											<span>
												<small id="warningPhone" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											 <div class="custom-control custom-checkbox">
											 	 <input type="checkbox" class="custom-control-input" id="checkbox-signup" >
											 	 <label class="custom-control-label" for="checkbox-signup">
											 	 	I accept <a href="#">Terms and Conditions</a>
											 	 </label>
											 </div>
										</div>
										<div class="form-group text-center">
											<button class="btn btn-success btn-block waves-effect waves-light" type="submit"> Join Now </button>
										</div>
									</form>
									<div class="text-center mt-4">
										<h5 class="text-muted py-2"><b>Sign in with</b></h5>
										<div class="row">
											<div class="col-12">
												 <button type="button" class="btn btn-facebook waves-effect font-14 waves-light mt-3">
                                                	<i class="fab fa-facebook-f mr-1"></i> Facebook
                                            	</button>
                                            	<button type="button" class="btn btn-googleplus waves-effect font-14 waves-light mt-3">
                                                	<i class="fab fa-google-plus-g mr-1"></i> Google
                                            	</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col-12 text-center">
								<p class="text-white-50">
									Already have account?
									<a href="<c:url value='/login' />" class="text-white ml-1">
										<b>Sign In</b>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<input id='flag' type="hidden" value='' >
	
		<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
		<script type="text/javascript">
       		var getUser =  function() {
           		var url = '${domain}' + '/user/username/' + $('#username').val();
				console.log(url);
				
           		$.ajax({
   					 url: url,
   					 type : "get",
   					 success: function(result) {
   						 console.log(result);
   						 if (!result) {
   							 $('#flag').val('true');
   							 $('#warningUsername').text('');
   						 } else {
   							 $('#flag').val('false');
   							 $('#warningUsername').text('TÊN TÀI KHOẢN đã tồn tại!');
   						 }
   					 }
   				});
           	}
      	</script>
		<script type="text/javascript">
			$('#form').on('submit', () => {
				var username = $('#username').val();
        		var password = $('#password').val();
        		var confirm = $('#confirm').val();
        		var fullname = $('#fullname').val();
        		var email = $('#email').val();
        		var phone = $('#phone').val();
        		
        		var checkUsername = false;
    			var checkPassword = false;
    			var checkConfirm = false;
    			var checkFullname = false;
    			var checkEmail = false;
    			var checkPhone = false;
    			
    			var flag = $('#flag').val();
    			
    			if (username.trim().length > 0) {
					$('#warningUsername').html('');
					checkUsername = true;
				} else {
					$('#warningUsername').html('Không được bỏ trống TÊN TÀI KHOẢN!');
					checkUsername = false;
				}
    			
    			if (checkUsername) {
    				if (username.trim().length < 6) {
    					$('#warningUsername').html('TÊN TÀI KHOẢN phải tối thiểu 6 ký tự!');
    					checkUsername = false;
    				} else {
    					checkUsername = true;
    					$('#warningUsername').html('');
    				}
    				
					if (flag === 'true') {
						$('#warningUsername').html('');
						checkUsername = true;
					} else if (flag === 'false') {
						$('#warningUsername').html('TÊN TÀI KHOẢN đã tồn tại!');
						checkUsername = false;
					} 
    			}
    			
    			if (password.trim().length > 0) {
					$('#warningPassword').html('');
					checkPassword = true;
				} else {
					$('#warningPassword').html('Không được bỏ trống MẬT KHẨU!');
					checkPassword = false;
				}
    			
    			if (checkPassword) {
    				if (password.trim().length < 6) {
    					$('#warningPassword').html('MẬT KHẨU phải tối thiểu 6 ký tự!');
    					checkPassword = false;
    				} else {
    					checkPassword = true;
    					$('#warningPassword').html('');
    				}
    			} 
    			
    			if (confirm.trim().length > 0) {
					$('#warningConfirm').html('');
					checkConfirm = true;
				} else {
					$('#warningConfirm').html('Không được bỏ trống XÁC NHẬN MẬT KHẨU!');
					checkConfirm = false;
				}
    			
    			if (checkPassword && checkConfirm) {
					if (password === confirm) {
						$('#warningConfirm').html('');
						checkPassword = true;
						checkConfirm = true;
					} else {
						checkPassword = false;
						checkConfirm = false;
						$('#warningConfirm').html('XÁC NHẬN MẬT KHẨU không chính xác!');
					}
				} 
    			
    			if (fullname.trim().length > 0) {
					$('#warningFullname').html('');
					checkFullname = true;
				} else {
					$('#warningFullname').html('Không được bỏ trống HỌ VÀ TÊN!');
					checkFullname = false;
				}
    			
    			if (email.trim().length > 0) {
					$('#warningEmail').html('');
					checkEmail = true;
				} else {
					$('#warningEmail').html('Không được bỏ trống EMAIL!');
					checkEmail = false;
				}
    			
    			if (checkEmail) {
					var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
					if (filter.test(email)) {
						$('#warningEmail').html('');
						checkEmail = true;
					} else {
						$('#warningEmail').html('E-MAIL không hợp lệ!');
						checkEmail = false;
					}
				}
    			
    			if (phone.trim().length > 0) {
					$('#warningPhone').html('');
					checkPhone = true;
				} else {
					$('#warningPhone').html('Không được bỏ trống SỐ ĐIỆN THOẠI!');
					checkPhone = false;
				}
    			
    			if (checkUsername && checkPassword && checkConfirm && checkFullname && checkEmail && checkPhone) {
					return true;
    			} else {
    				return false;
    			}
			});
		</script>
	</body>
</html>