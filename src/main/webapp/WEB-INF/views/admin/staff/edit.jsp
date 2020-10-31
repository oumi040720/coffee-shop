<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Staff</title>
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
		<link href="<c:url value='/template/admin/libs/bootstrap-datepicker/bootstrap-datepicker.min.css' />" rel="stylesheet" type="text/css">
	</head>
	
	<body>
        <div id="wrapper">
        
        	<%@ include file="/WEB-INF/views/admin/common/header.jsp" %>
        
        	<%@ include file="/WEB-INF/views/admin/common/menu.jsp" %>
        
        	<div class="content-page">
        		<div class="container-fluid">
        			<div class="row">
        				<div class="col-12">
        					<div class="page-title-box">
        						<div class="page-title-right">
        							<ol class="breadcrumb m-0">
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Uplon</a></li>
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Nhân viên</a></li>
        								<c:if test="${check}">
        									<li class="breadcrumb-item active">Cập nhật</li>
        								</c:if>
        								<c:if test="${!check}">
        									<li class="breadcrumb-item active">Thêm mới</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${check}">
        							<h4 class="page-title">Cập nhật nhân viên</h4>
        						</c:if>
        						<c:if test="${!check}">
        							<h4 class="page-title">Thêm mới nhân viên</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div class="row">
        							<c:url var="action" value="/admin/staff/save" />
        							<form:form action="${action}" modelAttribute="staff" cssClass="col-lg-12" 
        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Vai trò <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<select id="roleCode" name="roleCode" class="form-control">
        											<c:if test="${!check}">
	        											<option value="">-- Lựa chọn vai trò --</option>
	        											<<c:forEach items="${roles}" var="role">
	        												<option value="${role.roleCode}">${role.roleName}</option>
	        											</c:forEach>
        											</c:if>
        											<c:if test="${check}">
	        											<option value="">-- Lựa chọn vai trò --</option>
	        											<<c:forEach items="${roles}" var="role">
	        												<c:choose>
	        													<c:when test="${roleCode eq role.roleCode}">
	        														<option value="${role.roleCode}" selected="selected">${role.roleName}</option>
	        													</c:when>
	        													<c:otherwise>
	        														<option value="${role.roleCode}">${role.roleName}</option>
	        													</c:otherwise>
	        												</c:choose>
	        											</c:forEach>
        											</c:if>
        										</select>
        										<ul class="parsley-errors-list filled">
        											<li id="warningRole" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Tên nhân viên <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="fullname" cssClass="form-control" />
        										<ul class="parsley-errors-list filled">
        											<li id="warningFullname" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										E-mail <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="email" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningEmail" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Tên tài khoản <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<c:if test="${check}">
        											<span class="form-control">${staff.username}</span>
        											<form:hidden path="username"/>
        										</c:if>
        										<c:if test="${!check}">
        											<form:input path="username" cssClass="form-control" onfocusout="getUser()"/>
        										</c:if>
        										<ul class="parsley-errors-list filled">
        											<li id="warningUsername" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Mật khẩu <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<input id="password" type="password" name="p" class="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningPassword" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Xác nhận mật khẩu <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<input id="confirm" type="password" class="form-control">
        										<ul class="parsley-errors-list filled">
        											<li id="warningConfirm" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Ngày Sinh <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="birthday" cssClass="form-control" 
        											data-provide="datepicker" data-date-autoclose="true" />
        										<ul class="parsley-errors-list filled">
        											<li id="warningBirthday" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Số điện thoại <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="phone" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningPhone" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Địa chỉ <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="address" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningAddress" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Hình ảnh <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="photo" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningPhoto" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label"></label>
        									<div class="col-lg-10">
        										<button id="submit" type="submit" class="btn btn-success">
        											<c:if test="${check}"> Cập nhật </c:if>
        											<c:if test="${!check}"> Thêm </c:if>
        										</button>
        										<c:if test="${check}"> 
        											<form:hidden path="id"/>
        											<input type="hidden" name="userID" value="${userID}">
        										</c:if>
        										<form:hidden path="flagDelete"/>
        										<button type="reset" class="btn btn-outline-warning">
        											Nhập lại
        										</button>
        									</div>
        								</div>
        							</form:form>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        
        	<input id='flag' type="hidden" value='' >
        
			<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>        	
        	<script src="<c:url value='/template/admin/libs/moment/moment.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/bootstrap-datepicker/bootstrap-datepicker.min.js' />"></script>
	        <script type="text/javascript">
		        $(document).ready(function(){
		    		$("#birthday").attr({
		    			"placeholder": "mm/dd/yyyy"
		    		});
		    	});
	        </script>
	        <c:if test="${check}">
		        <script type="text/javascript">
			        $(document).ready(function(){
			    		var birthday = $("#birthday").val().split("-");
			    		$("#birthday").val(birthday[1] + '/' + birthday[2] + '/' + birthday[0]);
			    	});
		        </script>
	        </c:if>
	        <c:if test="${!check}">
		        <script type="text/javascript">
			        $(document).ready(function(){
			    		$("#birthday").val('01/01/2000');
			    	});
		        </script>
	        </c:if>

			<c:if test="${!check}">
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
	    							 $('#username').removeClass('parsley-error');
	    						 } else {
	    							 $('#flag').val('false');
	    							 $('#username').addClass('parsley-error');
	    							 $('#warningUsername').text('TÊN TÀI KHOẢN đã tồn tại!');
	    						 }
	    					 }
	    				});
	            	}
        		</script>
        	</c:if>
        	<script type="text/javascript">
        		var checkValidated = function() {
        			var check = '${check}';
        			
        			var fullname = $('#fullname').val();
        			var birthday = $('#birthday').val();
        			var email = $('#email').val();
        			var phone = $('#phone').val();
        			var address = $('#address').val();
        			var photo = $('#photo').val();
        			var username = $('#username').val();
        			var role = $('#roleCode').val();
            		var password = $('#password').val();
            		var confirm = $('#confirm').val();
        			
        			var checkFullname = false;
        			var checkBirthday = false;
        			var checkEmail = false;
        			var checkPhone = false;
        			var checkAddress = false;
        			var checkPhoto = false;
        			var checkUsername = false;
        			var checkRole = false;
        			var checkPassword = false;
            		var checkConfirm = false;
        			
        			var flag = $('#flag').val();
        			
					if (fullname.trim().length > 0) {
						$('#warningFullname').text('');
						$('#fullname').removeClass('parsley-error');
						checkFullname = true;
					} else {
						$('#fullname').addClass('parsley-error');
						$('#warningFullname').text('Không được bỏ trống HỌ VÀ TÊN!');
						checkFullname = false;
					}
					
					if (birthday.trim().length > 0) {
						$('#warningBirthday').text('');
						$('#birthday').removeClass('parsley-error');
						checkBirthday = true;
					} else {
						$('#birthday').addClass('parsley-error');
						$('#warningBirthday').text('Không được bỏ trống NGÀY SINH!');
						checkBirthday = false;
					}
					
					if (email.trim().length > 0) {
						$('#warningEmail').text('');
						$('#email').removeClass('parsley-error');
						checkEmail = true;
					} else {
						$('#email').addClass('parsley-error');
						$('#warningEmail').text('Không được bỏ trống E-MAIL!');
						checkEmail = false;
					}
					
					if (phone.trim().length > 0) {
						$('#warningPhone').text('');
						$('#phone').removeClass('parsley-error');
						checkPhone = true;
					} else {
						$('#phone').addClass('parsley-error');
						$('#warningPhone').text('Không được bỏ trống SỐ ĐIỆN THOẠI!');
						checkPhone = false;
					}
					
					if (address.trim().length > 0) {
						$('#warningAddress').text('');
						$('#address').removeClass('parsley-error');
						checkAddress = true;
					} else {
						$('#address').addClass('parsley-error');
						$('#warningAddress').text('Không được bỏ trống ĐỊA CHỈ!');
						checkAddress = false;
					}
					
					if (photo.trim().length > 0) {
						$('#warningPhoto').text('');
						$('#photo').removeClass('parsley-error');
						checkPhoto = true;
					} else {
						$('#photo').addClass('parsley-error');
						$('#warningPhoto').text('Không được bỏ trống HÌNH ẢNH!');
						checkPhoto = false;
					}
					
					if (username.trim().length > 0) {
						$('#warningUsername').text('');
						$('#username').removeClass('parsley-error');
						checkUsername = true;
					} else {
						$('#username').addClass('parsley-error');
						$('#warningUsername').text('Không được bỏ trống TÊN TÀI KHOẢN!');
						checkUsername = false;
					}
					
					if (check === 'false') {
						if (password.trim().length > 0) {
							$('#warningPassword').text('');
							$('#password').removeClass('parsley-error');
							checkPassword = true;
						} else {
							$('#password').addClass('parsley-error');
							$('#warningPassword').text('Không được bỏ trống MẬT KHẨU!');
							checkPassword = false;
						}
						
						if (confirm.trim().length > 0) {
							$('#warningConfirm').text('');
							$('#confirm').removeClass('parsley-error');
							checkConfirm = true;
						} else {
							$('#confirm').addClass('parsley-error');
							$('#warningConfirm').text('Không được bỏ trống XÁC NHẬN MẬT KHẨU!');
							checkConfirm = false;
						}
						
						if (checkPassword && checkConfirm) {
							if (password === confirm) {
								$('#warningConfirm').text('');
								$('#confirm').removeClass('parsley-error');
								checkPassword = true;
								checkConfirm = true;
							} else {
								checkPassword = false;
								checkConfirm = false;
			        			$('#confirm').addClass('parsley-error');
								$('#warningConfirm').text('XÁC NHẬN MẬT KHẨU không chính xác!');
							}
						} 
					} else {
						if (password.trim().length > 0) {
							if (confirm.trim().length > 0) {
								$('#warningConfirm').text('');
								$('#confirm').removeClass('parsley-error');
								checkConfirm = true;
							} else {
								$('#confirm').addClass('parsley-error');
								$('#warningConfirm').text('Không được bỏ trống XÁC NHẬN MẬT KHẨU!');
								checkConfirm = false;
							}
							
							if (checkPassword && checkConfirm) {
								if (password === confirm) {
									$('#warningConfirm').text('');
									$('#confirm').removeClass('parsley-error');
									checkPassword = true;
									checkConfirm = true;
								} else {
									checkPassword = false;
									checkConfirm = false;
				        			$('#confirm').addClass('parsley-error');
									$('#warningConfirm').text('XÁC NHẬN MẬT KHẨU không chính xác!');
								}
							} 
						}
					}
					
					if (role.trim().length > 0) {
						$('#warningRole').text('');
						$('#roleCode').removeClass('parsley-error');
						checkRole = true;
					} else {
						$('#roleCode').addClass('parsley-error');
						$('#warningRole').text('Không được bỏ trống VAI TRÒ!');
						checkRole = false;
					}
					
					if (checkUsername) {
						if (flag === 'true') {
							$('#warningUsername').text('');
						 	$('#username').removeClass('parsley-error');
							checkUsername = true;
						} else if (flag === 'false') {
							$('#username').addClass('parsley-error');
							$('#warningUsername').text('TÊN TÀI KHOẢN đã tồn tại!');
							checkUsername = false;
						}
					} 
					
					if (checkBirthday) {
						var pattern = new RegExp('(0|1)[0-9]/[0-3][0-9]/(19|20)[0-9]{2}'); 
						if(birthday.match(pattern)) {
							var array = birthday.split('/'); 
							
							var day = array[1]; 
							var month = array[0] - 1;
							var year = array[2]; 
							
							sourceDate = new Date(year,month,day); 
							
							if(year != sourceDate.getFullYear()) {
								$('#birthday').addClass('parsley-error');
								$('#warningBirthday').text('Năm của NGÀY SINH không hợp lệ!');
								checkBirthday = false;
							} else {
								$('#warningBirthday').text('');
								$('#birthday').removeClass('parsley-error');
								checkBirthday = true;
							}
							
							if(month != sourceDate.getMonth()) {
								$('#birthday').addClass('parsley-error');
								$('#warningBirthday').text('Tháng của NGÀY SINH không hợp lệ!');
								checkBirthday = false;
							} else {
								$('#warningBirthday').text('');
								$('#birthday').removeClass('parsley-error');
								checkBirthday = true;
							}
							
							if(day != sourceDate.getDate()) {
								$('#birthday').addClass('parsley-error');
								$('#warningBirthday').text('Ngày của NGÀY SINH không hợp lệ!');
								checkBirthday = false;
							} else {
								$('#warningBirthday').text('');
								$('#birthday').removeClass('parsley-error');
								checkBirthday = true;
							}
						} else {
							$('#birthday').addClass('parsley-error');
							$('#warningBirthday').text('Định dạng NGÀY SINH không hợp lệ!');
							checkBirthday = false;
						}
					}
					
					if (checkEmail) {
						var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
						if (filter.test(email)) {
							$('#warningEmail').text('');
							$('#email').removeClass('parsley-error');
							checkEmail = true;
						} else {
							$('#email').addClass('parsley-error');
							$('#warningEmail').text('E-MAIL không hợp lệ!');
							checkEmail = false;
						}
					}
					
					if (check === 'false') {
						if (checkFullname && checkBirthday && checkEmail && checkPhone && checkAddress
								&& checkPhoto && checkUsername && checkPassword && checkConfirm && checkRole) {
							return true;
						} else {
							return false;
						}
					} else {
						if (password.trim().length > 0) {
							if (checkFullname && checkBirthday && checkEmail && checkPhone && checkAddress
									&& checkPhoto && checkUsername && checkPassword && checkConfirm && checkRole) {
								return true;
							} else {
								return false;
							}
						} else {
							if (checkFullname && checkBirthday && checkEmail && checkPhone && checkAddress
									&& checkPhoto && checkUsername && checkRole) {
								return true;
							} else {
								return false;
							}
						}
					}
        		}
        	</script>
        </div>
	</body>
</html>