<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | InputDetail</title>
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Nhập Nguyên Liệu</a></li>
        								<c:if test="${check}">
        									<li class="breadcrumb-item active">Cập nhật</li>
        								</c:if>
        								<c:if test="${!check}">
        									<li class="breadcrumb-item active">Thêm mới</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${check}">
        							<h4 class="page-title">Cập nhật chi tiết nguyên Liệu</h4>
        						</c:if>
        						<c:if test="${!check}">
        							<h4 class="page-title">Thêm mới chi tiết nguyên liệu</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div class="row">
        						
        							<c:url var="action" value="/admin/inputDetail/save" />
        							<form:form action="${action}" modelAttribute="inputdetail" cssClass="col-lg-12" 
        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
        									<input id="inputID" name="inputID" value="${inputID}" type="hidden">
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Số Lượng <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="quantity" cssClass="form-control" type="number"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningQuantity" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Giá <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:input path="price" cssClass="form-control" type="number"/>
        										<ul class="parsley-errors-list filled">
        											<li id="warningPrice" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Đơn Vị  <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:select path="unitName" cssClass="form-control">
        											<form:option value="">-- Lựa chọn đơn vị --</form:option>
        											<c:forEach items="${unit}" var="units">
        												<form:option value="${units.unitName}">${units.unitName}</form:option>
        											</c:forEach>
        										</form:select>
        										<ul class="parsley-errors-list filled">
        											<li id="warningUnitName" class="parsley-required"></li>
        										</ul>
        									</div>
        								</div>
        								<div class="form-group row">
        									<label class="col-lg-2 col-form-label">
        										Nguyên Liệu <span class="text-danger"> (*) </span>
        									</label>
        									<div class="col-lg-10">
        										<form:select path="ingredientName" cssClass="form-control">
        											<form:option value="">-- Lựa chọn nguyên liệu --</form:option>
        											<c:forEach items="${ingredient}" var="ingredients">
        												<form:option value="${ingredients.name}">${ingredients.name}</form:option>
        											</c:forEach>
        										</form:select>
        										<ul class="parsley-errors-list filled">
        											<li id="warningIngredientName" class="parsley-required"></li>
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
        
        	<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
        	<script type="text/javascript">
        		var checkValidated = function() {
        			var quantity = $('#quantity').val();
        			var price = $('#price').val();
        			var unitName = $('#unitName').val();
        			var ingredientName = $('#ingredientName').val();
        			
        			var checkQuantity = false;
        			var checkPrice = false;
        			var checkUnitName = false;
        			var checkIngredientName = false;
        			
					if (quantity.trim().length > 0) {
						$('#warningQuantity').text('');
						$('#quantity').removeClass('parsley-error');
						checkQuantity = true;
					} else {
						$('#quantity').addClass('parsley-error');
						$('#warningQuantity').text('Không được bỏ trống SỐ LƯỢNG!');
					}
					
					if (price.trim().length > 0) {
						$('#warningPrice').text('');
						$('#price').removeClass('parsley-error');
						checkPrice = true;
					} else {
						$('#price').addClass('parsley-error');
						$('#warningPrice').text('Không được bỏ trống GIÁ');
					}
					
					if (unitName.trim().length > 0) {
						$('#warningUnitName').text('');
						$('#unitName').removeClass('parsley-error');
						checkUnitName = true;
					} else {
						$('#unitName').addClass('parsley-error');
						$('#warningUnitName').text('Không được bỏ trống ĐƠN VỊ!');
					}
					
					if (ingredientName.trim().length > 0) {
						$('#warningIngredientName').text('');
						$('#ingredientName').removeClass('parsley-error');
						checkIngredientName = true;
					} else {
						$('#ingredientName').addClass('parsley-error');
						$('#warningIngredientName').text('Không được bỏ trống NGUYÊN LIỆU!');
					}
					
					
					if (checkQuantity && checkPrice && checkUnitName && checkIngredientName) {
						return true;
					} else {
						return false;
					}
        		}
        	</script> 
        		
        </div>
	</body>
</html>