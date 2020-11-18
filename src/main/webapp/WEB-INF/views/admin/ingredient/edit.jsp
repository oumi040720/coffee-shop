<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Shop | Admin | Ingredient</title>

<%@ include file="/WEB-INF/views/admin/common/css.jsp"%>
</head>

<body>
	<div id="wrapper">

		<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>

		<%@ include file="/WEB-INF/views/admin/common/menu.jsp"%>

		<div class="content-page">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="page-title-box">
							<div class="page-title-right">
								<ol class="breadcrumb m-0">
									<li class="breadcrumb-item"><a href="javascript: void(0);">Uplon</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">Thành
											phần</a></li>
									<c:if test="${check}">
										<li class="breadcrumb-item active">Cập nhật</li>
									</c:if>
									<c:if test="${!check}">
										<li class="breadcrumb-item active">Thêm mới</li>
									</c:if>
								</ol>
							</div>
							<c:if test="${check}">
								<h4 class="page-title">Cập nhật thành phần</h4>
							</c:if>
							<c:if test="${!check}">
								<h4 class="page-title">Thêm mới thành phần</h4>
							</c:if>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card-box">
							<div class="row">
								<c:url var="action" value="/admin/ingredient/save" />
								<form:form action="${action}" modelAttribute="ingredient"
									cssClass="col-lg-12" onsubmit="return checkValidated()"
									data-parsley-validate="" novalidate="">
									<div class="form-group row">
										<label class="col-lg-2 col-form-label"> Tên thành phần<span
											class="text-danger"> (*) </span>
										</label>
										<div class="col-lg-10">
											<form:input path="name" cssClass="form-control" />
											<ul class="parsley-errors-list filled">
												<li id="warningIngredientName" class="parsley-required"></li>
											</ul>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label"> Số lượng <span
											class="text-danger"> (*) </span>
										</label>
										<div class="col-lg-10">
											<form:input path="quantity" cssClass="form-control" />
											<ul class="parsley-errors-list filled">
												<li id="warningIngredientQuantity" class="parsley-required"></li>
											</ul>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label"> Đơn vị <span
											class="text-danger"> (*) </span>
										</label>
										<div class="col-lg-10">
											<form:select path="unitCode" cssClass="form-control">
												<form:option value="">-- Lựa chọn vai trò --</form:option>
        											<<c:forEach items="${units}" var="units">
													<form:option value="${units.id}">${units.unitName}</form:option>
												</c:forEach>
											</form:select>
											<ul class="parsley-errors-list filled">
												<li id="warningIngredientUnitCode" class="parsley-required"></li>
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
												<form:hidden path="id" />
											</c:if>
											<form:hidden path="flagDelete" />
											<button type="reset" class="btn btn-outline-warning">
												Nhập lại</button>
										</div>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<input id='flag' type="hidden" value=''>

		<%@ include file="/WEB-INF/views/admin/common/js.jsp"%>
		<script type="text/javascript">
			var checkValidated = function() {
				try {

					var name = $('#name').val();
					var quantity = $('#quantity').val();
					var unitCode = $('#unitCode').val();

					var checkName = false;
					var checkQuantity = false;
					var checkUnitCode = false;

					if (name.trim().length > 0) {
						$('#warningIngredientName').text('');
						$('name').removeClass('parsley-error');
						checkName = true;
					} else {
						$('name').addClass('parsley-error');
						$('#warningIngredientName').text(
								'KHÔNG ĐƯỢC BỎ TRỐNG TÊN THÀNH PHẦN!');
					}
					
					
					var pattern = new RegExp('^[0-9]*$');
					if (quantity.trim().length > 0  && quantity.match(pattern)) {
						$('#warningIngredientQuantity').text('');
						$('quantity').removeClass('parsley-error');
						checkQuantity = true;
					}

					else if (quantity.trim().length > 0) {
						$('#quantity').addClass('parsley-error');
						$('#warningIngredientQuantity').text('Vui Lòng Nhập Số Nguyên Dương!');

					} else {
						$('quantity').addClass('parsley-error');
						$('#warningIngredientQuantity').text(
								'KHÔNG ĐƯỢC BỎ TRỐNG SỐ LƯỢNG!');
					}

					if (unitCode.trim().length > 0) {
						$('#warningIngredientUnitCode').text('');
						$('unitCode').removeClass('parsley-error');
						checkUnitCode = true;
					} else {
						$('unitCode').addClass('parsley-error');
						$('#warningIngredientUnitCode').text(
								'KHÔNG ĐƯỢC BỎ TRỐNG ĐƠN VỊ!');
					}

					if (checkName && checkQuantity && checkUnitCode) {
						return true;
					} else {
						return false;
					}
				} catch (err) {
					return false;
				}
			}
		</script>

	</div>
</body>
</html>