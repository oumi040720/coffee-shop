<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Unit</title>
		
		<!-- Table datatable css -->
		<link href="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.css' />" rel="stylesheet" type="text/css">
		
		<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
		
		<link rel="stylesheet" href='https://fonts.googleapis.com/css?family=Roboto|Varela+Round'>
		<link rel="stylesheet" href='https://fonts.googleapis.com/icon?family=Material+Icons'>
		<link rel="stylesheet" href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
		<link href="<c:url value='/template/admin/css/delete-warning.css' />" rel="stylesheet" type="text/css" id="bootstrap-stylesheet">
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Đơn vi</a></li>
        								<c:if test="${!isBin}">
	        								<li class="breadcrumb-item active">Danh sách</li>
        								</c:if>
        								<c:if test="${isBin}">
	        								<li class="breadcrumb-item active">Thùng rác</li>
        								</c:if>
        							</ol>
        						</div>
        						<h4 class="page-title">Danh sách đơn vị</h4>
        					</div>
        				</div>
        			</div>
        			
        			<c:if test="${!isBin}">
	        			<div class="row" id="form">
	        				<div class="col-lg-12">
	        					<div class="card-box">
	       							<div>
	        							<c:if test="${check}">
		        							<h5>Cập nhật đơn vị</h5>
		        						</c:if>
		        						<c:if test="${!check}">
		        							<h5>Thêm mới đơn vị</h5>
		        						</c:if>
		        						<br>
	       							</div>
	        						<div class="row">
	        							<c:url var="action" value="/admin/unit/save" />
	        							<form:form action="${action}" modelAttribute="unit" cssClass="col-lg-12" 
	        									onsubmit="return checkValidated()" data-parsley-validate="" novalidate="">
	        								<div class="form-group row">
	        									<label class="col-lg-2 col-form-label">
	        										Tên đơn vị<span class="text-danger"> (*) </span>
	        									</label>
	        									<div class="col-lg-10">
	        										<form:input path="unitName" cssClass="form-control"/>
	        										<ul class="parsley-errors-list filled">
	        											<li id="warningUnitName" class="parsley-required"></li>
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
        			</c:if>
        			
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div>
        							<c:if test="${!isBin}">
        								<button id="showForm" class="btn btn-success">Thêm</button>
		        						<a href="<c:url value='/admin/unit/bin/list' />" class="btn btn-warning">Thùng rác</a>
	        						</c:if>
	      							<c:if test="${isBin}">
	       								<a href="<c:url value='/admin/unit/list' />" class="btn btn-warning">Danh sách</a>
	      							</c:if>
	      							<br><br>
        						</div>
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
        						</c:if>
        						<div>
        							<c:if test="${!isBin}">
	        							<table class="table table-bordered dt-responsive nowrap" >
	        								<thead>
	        									<tr class="thead-dark">
	        										<th>Tên đơn vị</th>
	        										<th>#</th>
	        									</tr>
	        								</thead>
	        								<tbody>
	        									<c:forEach items="${units}" var="unit">
	        										<tr>
	        											<td>${unit.unitName}</td>
	        											<td>
	        												<c:url var="editURL" value="/admin/unit/list">
	        													<c:param name="unit_id" value="${unit.id}" />
	        												</c:url>
	        												<a href="${editURL}" class="btn btn-outline-info">
	        													<i class="mdi mdi-pencil-outline"></i>
	        												</a>
	        												
	        												<c:url var="deleteURL" value="/admin/unit/delete">
	        													<c:param name="unit_id" value="${unit.id}" />
	        												</c:url>
	        												<a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirm-${unit.id}">
	        													<i class="mdi mdi-window-close"></i>
	        												</a>
	        												<div class="modal fade" id="confirm-${unit.id}" data-backdrop="static" data-keyboard="false">
	        													<div class="modal-dialog modal-confirm modal-dialog-centered">
																	<div class="modal-content">
																		<div class="modal-header flex-column">
																			<div class="icon-box">
																				<i class="material-icons text-warning">&#xe645;</i>
																			</div>
																			<h4 class="modal-title w-100">Xác nhận Xóa</h4>
																		</div>
																		<div class="modal-body">
																			<p>Bạn Chắc Chắn Muốn Xóa đơn vị "${unit.unitName}" không?</p>
																		</div>
																		<div class="modal-footer justify-content-center">
																			<a id="alerts" href="${deleteURL}">
																				<button type="button" class="btnn">Đồng ý</button>
																			</a>
																			<button type="button" data-dismiss="modal" class="btnn btn-danger">Từ chối</button>
																		</div>
																	</div>
																</div>
	        												</div>
	        											</td>
	        										</tr>
	        									</c:forEach>
	        								</tbody>
	        							</table>
        							</c:if>
        							<c:if test="${isBin}">
	        							<table class="table table-bordered dt-responsive nowrap" 
	        								   style="border-collapse: collapse; border-spacing: 0; width: 100%;">
	        								<thead>
	        									<tr class="thead-dark">
	        										<th>Tên đơn vị</th>
	        										<th>#</th>
	        									</tr>
	        								</thead>
	        								<tbody>
	        									<c:forEach items="${units}" var="unit">
	        										<tr>
	        											<td>${unit.unitName}</td>
	        											<td>
	        												<c:url var="restoreURL" value="/admin/unit/restore">
	        													<c:param name="unit_id" value="${unit.id}" />
	        												</c:url>
	        												<a href="#" class="btn btn-outline-info" data-toggle="modal" data-target="#confirm-${unit.id}">
	        													<i class="mdi mdi-replay"></i>
	        												</a>
	        												<div class="modal fade" id="confirm-${unit.id}" data-backdrop="static" data-keyboard="false">
	        													<div class="modal-dialog modal-confirm modal-dialog-centered">
																	<div class="modal-content">
																		<div class="modal-header flex-column">
																			<div class="icon-box">
																				<i class="material-icons text-warning">&#xe645;</i>
																			</div>
																			<h4 class="modal-title w-100">Xác nhận Khôi Phục</h4>
																		</div>
																		<div class="modal-body">
																			<p>Bạn Chắc Chắn Muốn Khôi Phục đơn vị "${unit.unitName}" không?</p>
																		</div>
																		<div class="modal-footer justify-content-center">
																			<a id="alerts" href="${restoreURL}">
																				<button type="button" class="btnn">Đồng ý</button>
																			</a>
																			<button type="button" data-dismiss="modal" class="btnn btn-danger">Từ chối</button>
																		</div>
																	</div>
																</div>
	        												</div>
	        											</td>
	        										</tr>
	        									</c:forEach>
	        								</tbody>
	        							</table>
        							</c:if>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        
        	<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
        	
        	<!-- Table datatable js -->
        	<script src="<c:url value='/template/admin/libs/datatables/jquery.dataTables.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.js' />"></script>
        	<script type="text/javascript">
    			var checkValidated = function() {
        			var unitName = $('#unitName').val();
        			
        			var checkunitName = false;
        			
					if (unitName.trim().length > 0) {
						$('#warningUnitName').text('');
						$('#unitName').removeClass('parsley-error');
						checkunitName = true;
					} else {
						$('#unitName').addClass('parsley-error');
						$('#warningUnitName').text('Không được bỏ trống TÊN ĐƠN VỊ');
					}
					
					if (checkunitName ) {
						return true;
					} else {
						return false;
					}
        		}
        	</script>
        	<script type="text/javascript">
       			$(document).ready(function() {
       				$('.row#form').hide();
       			});
       		</script>
        	<c:if test="${!check}">
        		<script type="text/javascript">
	       			$('#showForm').on('click', function() {
	      				$('.row#form').show();
	      				$('#showForm').hide();
	      			});
        		</script>
        	</c:if>
        	<c:if test="${check}">
        		<script type="text/javascript">
	        		$(document).ready(function() {
	       				$('.row#form').show();
	       				$('#showForm').hide();
	       			});
        		</script>
        	</c:if>
        </div>
	</body>
</html>