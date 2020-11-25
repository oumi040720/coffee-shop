<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Product</title>
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Sản phẩm</a></li>
        								<c:if test="${check}">
        									<li class="breadcrumb-item active">Cập nhật</li>
        								</c:if>
        								<c:if test="${!check}">
        									<li class="breadcrumb-item active">Thêm mới</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${check}">
        							<h4 class="page-title">Cập nhật sản phẩm</h4>
        						</c:if>
        						<c:if test="${!check}">
        							<h4 class="page-title">Thêm mới sản phẩm</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div class="row">
        							<c:url var="action" value="/admin/product/save" />
        							<form:form action="${action}" modelAttribute="product" cssClass="col-lg-12" 
        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Mã thể loại <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:select path="categoryCode" cssClass="form-control">
        											<form:option value="">-- Lựa chọn thể loại --</form:option>
        											<<c:forEach items="${category}" var="category">
        												<form:option value="${category.categoryCode}">${category.categoryName}</form:option>
        											</c:forEach>
        										</form:select>
        										<ul class="parsley-errors-list filled">
        											<li id="warningCategoryCode" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Tên sản phẩm <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="productName" cssClass="form-control" onfocusout="getProduct()"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningProductName" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Hình ảnh <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="photo" cssClass="form-control" />
        										<ul class="parsley-errors-list filled">
        											<li id="warningPhoto" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Giá <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="price" cssClass="form-control" />
        										<ul class="parsley-errors-list filled">
        											<li id="warningPrice" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label"></label>
        									<div class="col-lg-10">
        										<button id="submit" type="submit" class="btn btn-outline-success btn-rounded waves-effect waves-light"><i class="ion ion-ios-save"></i>
        											<c:if test="${check}"> Cập nhật </c:if>
        											<c:if test="${!check}"> Thêm </c:if>
        										</button>
        										<c:if test="${check}"> 
        											<form:hidden path="id"/>
        										</c:if>
        										<form:hidden path="flagDelete"/>
        										<button type="reset" class="btn btn-outline-warning btn-rounded waves-effect waves-light"><i class="ion ion-md-refresh"></i>
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
        			try{
        				var categoryCode = $('#categoryCode').val();
            			var productName = $('#productName').val();
            			var photo = $('#photo').val();
            			var price = $('#price').val();
            			
            			var checkCategoryCode = false;
            			var checkProductName = false;
            			var checkPhoto = false;
            			var checkPrice = false;
    					
    					if (categoryCode.trim().length > 0) {
    						$('#warningCategoryCode').text('');
    						$('#categoryCode').removeClass('parsley-error');
    						checkCategoryCode = true;
    					} else {
    						$('#categoryCode').addClass('parsley-error');
    						$('#warningCategoryCode').text('Không được bỏ trống MÃ THỂ LOẠI!');
    						
    					}
    					
    					if(productName.trim().length > 0){
    						$('#warningProductName').text('');
    						$('#productName').removeClass('parsley-error');
    						
    					} else {
    						$('#productName').addClass('parsley-error');
    						$('#warningProductName').text('Không được bỏ trống TÊN SẢN PHẨM!');
    						
    					}
    					
    					
    					if(photo.trim().length > 0){
    						$('#warningPhoto').text('');
    						$('#photo').removeClass('parsley-error');
    						checkPhoto = true;
    					} else {
    						$('#photo').addClass('parsley-error');
    						$('#warningPhoto').text('Không được bỏ trống HÌNH ẢNH!');
    						
    					}
    					var pattern = new RegExp('^[0-9]*$');
    					if(price.trim().length > 0 && price.match(pattern)){
    						$('#warningPrice').text('');
    						$('#price').removeClass('parsley-error');
    						checkPrice = true;
    					}
    					else if(price.trim().length > 0){
    						$('#price').addClass('parsley-error');
    						$('#warningPrice').text('GIÁ SẢN PHẨM là số!');
    						
    					}
    					else {
    						$('#price').addClass('parsley-error');
    						$('#warningPrice').text('Không được bỏ trống GIÁ SẢN PHẨM!');
    						
    					}
    					
    					if (checkproductName && checkCategoryCode && checkPhoto && checkPrice) {
    						return true;
    					} else {
    						return false;
    						}
        			}
        			catch (err) {
						// TODO: handle exception
						return false;
					}
        		}
        	</script>
        		
        </div>
	</body>
</html>