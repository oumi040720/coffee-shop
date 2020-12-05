<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Category</title>
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Thể loại</a></li>
        								<c:if test="${check}">
        									<li class="breadcrumb-item active">Cập nhật</li>
        								</c:if>
        								<c:if test="${!check}">
        									<li class="breadcrumb-item active">Thêm mới</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${check}">
        							<h4 class="page-title">Cập nhật thể loại</h4>
        						</c:if>
        						<c:if test="${!check}">
        							<h4 class="page-title">Thêm mới thể loại</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div class="row">
        							<c:url var="action" value="/admin/category/save" />
        							<form:form action="${action}" modelAttribute="category" cssClass="col-lg-12" 
        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Tên thể loại<span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="categoryName" cssClass="form-control"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningCategoryName" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Mã thể loại <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<c:if test="${check}">
        											<span class="form-control">${category.categoryCode}</span>
        											<form:hidden path="categoryCode" />
        										</c:if>
        										<c:if test="${!check}">
        											<form:input path="categoryCode" cssClass="form-control" onfocusout="getCategory()" />
        											<ul class="parsley-errors-list filled">
	        											<li id="warningCategoryCode" class="parsley-required"></li>
	        										</ul>
        										</c:if>
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
        	
        	<c:if test="${check}">
        		<script type="text/javascript">
	        		$(document).ready(function() {
	        			$('#flag').val('true');
	        		})
        		</script>
        	</c:if>
        	
        	<c:if test="${!check}">
        		<script type="text/javascript">
	        		var getCategory =  function() {
		        		var url = '${domain}' + '/category/category_code/' + $('#categoryCode').val();
		
		        		$.ajax({
							 url: url,
							 type : "get",
							 success: function(result) {
								 if (!result) {
									 $('#flag').val('true');
									 $('#warningCategoryCode').text('');
									 $('#categoryCode').removeClass('parsley-error');
								 } else {
									 $('#flag').val('false');
									 $('#categoryCode').addClass('parsley-error');
									 $('#warningCategoryCode').text('MÃ DANH MỤC đã tồn tại!');
								 }
							 }
						});
		        	}
        		</script>
        	</c:if>
        	
        	<script type="text/javascript">
        		var checkValidated = function() {
        			var categoryName = $('#categoryName').val();
        			var categoryCode = $('#categoryCode').val();
        			
        			var flag = $('#flag').val();
        			
        			var checkcategoryName = false;
        			var checkcategoryCode = false;
        			
					if (categoryName.trim().length > 0) {
						$('#warningCategoryName').text('');
						$('#categoryName').removeClass('parsley-error');
						checkcategoryName = true;
					} else {
						$('#categoryName').addClass('parsley-error');
						$('#warningCategoryName').text('Không được bỏ trống TÊN THỂ LOẠI!');
						checkcategoryName = false;
					}
					
					if (categoryCode.trim().length > 0) {
						$('#warningCategoryCode').text('');
						$('#categoryCode').removeClass('parsley-error');
						checkcategoryCode = true;
					} else {
						$('#categoryCode').addClass('parsley-error');
						$('#warningCategoryCode').text('Không được bỏ trống MÃ THỂ LOẠI!');
						checkcategoryCode = false;
					}

					if (checkcategoryCode) {
						if (flag === 'true') {
							$('#warningCategoryCode').text('');
							$('#categoryCode').removeClass('parsley-error');
							checkcategoryCode = true;
						} else {
							$('#warningCategoryCode').text('MÃ DANH MỤC đã tồn tại!');
							$('#categoryCode').removeClass('parsley-error');
							checkcategoryCode = false;
						}
					}
					
					if (checkcategoryName && checkcategoryCode) {
						return true;
					} else {
						return false;
					}
        		}
	        	
        	</script>
        		
        </div>
	</body>
</html>