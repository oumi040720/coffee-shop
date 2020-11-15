<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Account</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
	</head>
	
	<body>
        <%@ include file="/WEB-INF/views/user/common/menu.jsp" %>
        
        <section class="home-slider owl-carousel">
        	<div class="slider-item" style="background-image: url(template/user/images/bg_3.jpg);">
        		<div class="overlay"></div>
        		<div class="container">
        			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
        				<div class="col-md-7 col-sm-12 text-center ftco-animate">
							<h1 class="mb-3 mt-5 bread">Tài khoản</h1>
							<p class="breadcrumbs">
								<span class="mr-2"><a href="<c:url value='/home' />">Trang chủ</a></span>
								<span>Tài khoản</span>
							</p>
						</div>
        			</div>
        		</div>
        	</div>
        </section>
		
		<section class="ftco-section contact-section">
			<div class="container mt-5">
				<c:if test="${not empty message}">
   					<div>
  						<div class="alert alert-${alert} alert-dismissible fade show mb-0" role="alert">
  							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
  								<span aria-hidden="true">&times;</span>
  							</button>
  							<s:message code="${message}" />
   						</div>
					</div>
					<br>
					<br>
  				</c:if>
				<div class="row block-9">
					<div class="col-md-4 ftco-animate">
						<form id="formChangePassword" action="<c:url value='/change_password' />" class="contact-form">
							<div class="row">
								<div class="col-md-12 mb-4">
									<h2 class="h4">Đổi mật khẩu</h2>
								</div>
							</div>
							<div class="form-group">
								<input type="password" id="oldPassword" name="oldPassword" 
										class="form-control" placeholder="Xác nhận mật khẩu cũ">
								<span>
									<small class="text-danger" id="warningOldPassword"></small>
								</span>
							</div>
							<div class="form-group">
								<input type="password" id="newPassword" name="newPassword" 
										class="form-control" placeholder="Nhập mật khẩu mới">
								<span>
									<small class="text-danger" id="warningNewPassword"></small>
								</span>
							</div>
							<div class="form-group">
								<input type="password" id="confirmPassword" name="confirmPassword" 
										class="form-control" placeholder="Xác nhận mật khẩu mới">
								<span>
									<small class="text-danger" id="warningConfirmPassword"></small>
								</span>
							</div>
							<div class="form-group">
								<input type="submit" value="Đổi mật khẩu" class="btn btn-primary py-3 px-5">
							</div>
						</form>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-6 ftco-animate">
						<form id="formChangeInfo" action="<c:url value='/change_info' />" class="contact-form">
							<div class="row">
								<div class="col-md-12 mb-4">
									<h2 class="h4">Thông tin cá nhân</h2>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										<input type="text" id="fullname" name="fullname" 
												class="form-control" placeholder="Họ và tên" value="${CUSTOMER.fullname}">
										<span>
											<small class="text-danger" id="warningFullname"></small>
										</span>
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<input type="number" id="phone" name="phone" 
												class="form-control" placeholder="Số điện thoại" value="${CUSTOMER.phone}">
										<span>
											<small class="text-danger" id="warningPhone"></small>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<input type="text" id="email" name="email" 
									class="form-control" placeholder="Địa chỉ e-mail" value="${CUSTOMER.email}">
								<span>
									<small class="text-danger" id="warningEmail"></small>
								</span>
							</div>
							<div class="form-group">
								<input type="text" id="address" name="address" 
									class="form-control" placeholder="Địa chỉ" value="${CUSTOMER.address}">
								<span>
									<small class="text-danger" id="warningAddress"></small>
								</span>
							</div>
							<div class="form-group">
								<input type="submit" value="Thay đổi thông tin" class="btn btn-primary py-3 px-5">
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>        
        
        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script type="text/javascript">
        $('#formChangePassword').on('submit', () => {
    		var oldPassword = $('#oldPassword').val();
    		var newPassword = $('#newPassword').val();
    		var confirmPassword = $('#confirmPassword').val();
			
			var checkOldPassword = false;
			var checkNewPassword = false;
    		var checkConfirmPassword = false;
    		
    		if (oldPassword.trim().length > 0) {
				$('#warningOldPassword').text('');
				checkOldPassword = true;
			} else {
				$('#warningOldPassword').text('Không được bỏ trống MẬT KHẨU CŨ!');
				checkOldPassword = false;
			}
    		
    		if (newPassword.trim().length > 0) {
				$('#warningNewPassword').text('');
				checkNewPassword = true;
			} else {
				$('#warningNewPassword').text('Không được bỏ trống MẬT KHẨU MỚI!');
				checkNewPassword = false;
			}
			
			if (confirmPassword.trim().length > 0) {
				$('#warningConfirmPassword').text('');
				checkConfirmPassword = true;
			} else {
				$('#warningConfirmPassword').text('Không được bỏ trống XÁC NHẬN MẬT KHẨU!');
				checkConfirmPassword = false;
			}
			
			if (checkNewPassword && checkConfirmPassword) {
				if (newPassword === confirmPassword) {
					$('#warningConfirmPassword').text('');
					checkNewPassword = true;
					checkConfirmPassword = true;
				} else {
					checkNewPassword = false;
					checkConfirmPassword = false;
					$('#warningConfirmPassword').text('XÁC NHẬN MẬT KHẨU không chính xác!');
				}
			} 
			
			if (checkOldPassword && checkNewPassword && checkConfirmPassword) {
				return true;
			} else {
	        	return false;
			}
       	});
        </script>
        
        <script type="text/javascript">
        $('#formChangeInfo').on('submit', () => {
        	var fullname = $('#fullname').val();
			var email = $('#email').val();
			var phone = $('#phone').val();
			var address = $('#address').val();
			
			var checkFullname = false;
			var checkEmail = false;
			var checkPhone = false;
			var checkAddress = false;

			if (fullname.trim().length > 0) {
				$('#warningFullname').text('');
				checkFullname = true;
			} else {
				$('#warningFullname').text('Không được bỏ trống HỌ VÀ TÊN!');
				checkFullname = false;
			}
			
			if (email.trim().length > 0) {
				$('#warningEmail').text('');
				checkEmail = true;
			} else {
				$('#warningEmail').text('Không được bỏ trống E-MAIL!');
				checkEmail = false;
			}
			
			if (phone.trim().length > 0) {
				$('#warningPhone').text('');
				checkPhone = true;
			} else {
				$('#warningPhone').text('Không được bỏ trống SỐ ĐIỆN THOẠI!');
				checkPhone = false;
			}
			
			if (address.trim().length > 0) {
				$('#warningAddress').text('');
				checkAddress = true;
			} else {
				$('#warningAddress').text('Không được bỏ trống ĐỊA CHỈ!');
				checkAddress = false;
			}
			
			if (checkEmail) {
				var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if (filter.test(email)) {
					$('#warningEmail').text('');
					checkEmail = true;
				} else {
					$('#warningEmail').text('E-MAIL không hợp lệ!');
					checkEmail = false;
				}
			}
			
			if (checkFullname && checkEmail && checkPhone && checkAddress) {
				return true;
			} else {
				return false;
			}
        });
        </script>
	</body>
</html>