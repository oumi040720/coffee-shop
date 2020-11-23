<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Input</title>
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Đơn vị</a></li>
        								<c:if test="${check}">
        									<li class="breadcrumb-item active">Cập nhật</li>
        								</c:if>
        								<c:if test="${!check}">
        									<li class="breadcrumb-item active">Thêm mới</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${check}">
        							<h4 class="page-title">Cập nhật nguyên liệu</h4>
        						</c:if>
        						<c:if test="${!check}">
        							<h4 class="page-title">Thêm mới nguyên liệu</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div class="row">
        							<c:url var="action" value="/admin/input/save" />
        							<form:form action="${action}" modelAttribute="input" cssClass="col-lg-12" 
        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Tên nguyên liệu<span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="inputDate" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningInputName" class="parsley-required"></li>
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
        	<script type="text/javascript">
	        	
        	
    			
    			var checkValidated = function() {
        			var inputDate = $('#inputDate').val();

        			
        			var checkinputDate = false;

        			
					if (inputDate.trim().length > 0) {
						$('#warningInputName').text('');
						$('#inputDate').removeClass('parsley-error');
						checkinputDate = true;
					} else {
						$('#inputDate').addClass('parsley-error');
						$('#warningInputName').text('Không được bỏ trống TÊN ĐƠN VỊ');
					}
					
					

					
					
					if (checkinputDate ) {
						return true;
					} else {
						return false;
					}
        		}
        	</script>
        		
        </div>
	</body>
</html>