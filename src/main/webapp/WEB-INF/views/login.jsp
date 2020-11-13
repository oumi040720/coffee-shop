<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Login </title>
		
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
										<h5 class="text-muted text-uppercase py-3 font-16">Đăng Nhập</h5>
									</div>
									<c:if test="${not empty message}">
	        							<div>
	        								<div class="alert alert-${alert} alert-dismissible fade show mb-0" role="alert">
	        									<button type="button" class="close" data-dismiss="alert" aria-label="Close">
	        										<span aria-hidden="true">&times;</span>
	        									</button>
	        									<s:message code='${message}' />
		        							</div>
		        						</div>
		        						<br>
	        						</c:if>
									<form method="post" action="<c:url value='/check_login' />" class="mt-2">
										<div class="form-group mb-3">
											<input id="username" class="form-control" type="text" name="username" placeholder="Tên tài khoản">
											<span>
												<small id="warningUsername" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											<input class="form-control" type="password" name="password" id="password" placeholder="Mật khẩu">
											<span>
												<small id="warningPassword" class="text-danger"></small>
											</span>
										</div>
										<div class="form-group mb-3">
											 <div class="custom-control custom-checkbox">
											 	 <input type="checkbox" class="custom-control-input" id="checkbox-signin" >
											 	 <label class="custom-control-label" for="checkbox-signin">
											 	 	Ghi nhớ mật khẩu
											 	 </label>
											 </div>
										</div>
										<div class="form-group text-center">
											<button class="btn btn-success btn-block waves-effect waves-light" type="submit"> Đăng Nhập </button>
										</div>
										<a href="pages-recoverpw.html" class="text-muted">
											<i class="mdi mdi-lock mr-1"></i>  Quên mật khẩu?
										</a>
									</form>
									<div class="text-center mt-4">
										<h5 class="text-muted py-2"><b>Đăng nhập với</b></h5>
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
									Bạn chưa có tài khoản? 
									<a href="<c:url value='/registration' />" class="text-white ml-1">
										<b>Đăng ký</b>
									</a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
		<script type="text/javascript">
			$('form').on('submit', () => {
				var username = $('#username').val();
        		var password = $('#password').val();
        		
        		var checkUsername = false;
    			var checkPassword = false;
    			
    			if (username.trim().length > 0) {
					$('#warningUsername').text('');
					checkUsername = true;
				} else {
					$('#warningUsername').text('Không được bỏ trống TÊN TÀI KHOẢN!');
					checkUsername = false;
				}
    			
    			if (password.trim().length > 0) {
					$('#warningPassword').text('');
					checkPassword = true;
				} else {
					$('#warningPassword').text('Không được bỏ trống MẬT KHẨU!');
					checkPassword = false;
				}
    			
    			if (checkUsername && checkPassword) {
					return true;
    			} else {
    				return false;
    			}
			});
		</script>
	</body>
</html>