<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | 403 </title>
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
	</head>
	
	<body class="authentication-bg">
		<div class="account-pages pt-5 my-5">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-8 col-lg-6 col-xl-5">
						<div class="text-center">
	                        <div class="text-error shadow-text">500</div>
	                        <h3 class="text-uppercase text-white">Chức năng đang được nâng cấp</h3>
	                        <p class="text-white mt-4">
	                           Xin lỗi! Chức năng này hiện đang được nâng cấp!
	                        </p>
	                        <br>
	                        <c:if test="${USER == null}">
	                         	<a class="btn btn-pink waves-effect waves-light" href="<c:url  value='/login'/>"> 
		                        	Đăng Nhập
		                        </a>
	                        </c:if>
	                        <c:if test="${USER.roleCode eq 'admin'}">
		                        <a class="btn btn-pink waves-effect waves-light" href="<c:url  value='/admin/dashboard'/>"> 
		                        	Quay Lại Trang Chủ 
		                        </a>
	                        </c:if>
	                        <c:if test="${USER.roleCode eq 'cashier'}">
		                        <a class="btn btn-pink waves-effect waves-light" href="<c:url  value='/admin/order/list?page=1'/>"> 
		                        	Quay Lại Trang Chủ 
		                        </a>
	                        </c:if>
	                         <c:if test="${USER.roleCode eq 'user'}">
		                        <a class="btn btn-pink waves-effect waves-light" href="<c:url  value='/home'/>"> 
		                        	Quay Lại Trang Chủ 
		                        </a>
	                        </c:if>
	                    </div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
	</body>
</html>