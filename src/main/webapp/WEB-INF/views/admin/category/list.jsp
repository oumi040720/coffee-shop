<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Category</title>
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Thể loại</a></li>
        								<c:if test="${!isBin}">
	        								<li class="breadcrumb-item active">Danh sách</li>
        								</c:if>
        								<c:if test="${isBin}">
	        								<li class="breadcrumb-item active">Thùng rác</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${!isBin}">
	        						<h4 class="page-title">Danh sách thể loại</h4>
        						</c:if>
        						<c:if test="${isBin}">
	        						<h4 class="page-title">Danh sách đã xóa</h4>
        						</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div>
<<<<<<< HEAD
        							<a href="<c:url value='/admin/category/add' />" class="btn btn-success">Thêm</a>
        							<c:if test="${!isBin}">
		        						<a href="<c:url value='/admin/category/bin/list' />" class="btn btn-warning">Thùng rác</a>
	        						</c:if>
	        						<c:if test="${isBin}">
		        						<a href="<c:url value='/admin/category/list' />" class="btn btn-warning">Danh sách</a>
	        						</c:if>
=======
        							<a href="<c:url value='/admin/category/add' />" class="btn btn-success"><i class="ion ion-md-add-circle"></i> Thêm</a>
>>>>>>> 757ab391c9a5c46a24cea50717cf258e59798f2b
        						</div>
        						<br>
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
        							<table id="datatable" 
        								   class="table table-bordered dt-responsive nowrap" 
        								   style="border-collapse: collapse; border-spacing: 0; width: 100%;">
        								<thead>
        									<tr>
        										<th>Tên thể loại</th>
        										<th>Mã thể loại</th>
        										<th>#</th>
        									</tr>
        								</thead>
        								<tbody>
        									<c:forEach items="${categories}" var="category">
        										<tr>
        											<td>${category.categoryName}</td>
        											<td>${category.categoryCode}</td>
        											<td>
        												<c:if test="${!isBin}">
	        												<c:url var="editURL" value="/admin/category/edit">
	        													<c:param name="category_code" value="${category.categoryCode}" />
	        												</c:url>
	        												<a href="${editURL}" class="btn btn-outline-info">
	        													<i class="mdi mdi-pencil-outline"></i>
	        												</a>
	        												
	        												<c:url var="deleteURL" value="/admin/category/delete">
	        													<c:param name="category_code" value="${category.categoryCode}" />
	        												</c:url>
	        												<a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirm-${category.categoryCode}">
	        													<i class="mdi mdi-window-close"></i>
	        												</a>
	        												<div class="modal fade" id="confirm-${category.categoryCode}" data-backdrop="static" data-keyboard="false">
	        													<div class="modal-dialog modal-confirm modal-dialog-centered">
																	<div class="modal-content">
																		<div class="modal-header flex-column">
																			<div class="icon-box">
																				<i class="material-icons text-warning">&#xe645;</i>
																			</div>
																			<h4 class="modal-title w-100">Xác nhận xóa</h4>
																		</div>
																		<div class="modal-body">
																			<p>Bạn có chắc muốn xóa thể loại "${category.categoryName}" không?</p>
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
        												</c:if>
        												
        												<c:if test="${isBin}">
	        												<c:url var="restoreURL" value="/admin/category/restore">
	        													<c:param name="category_code" value="${category.categoryCode}" />
	        												</c:url>
	        												<a href="#" class="btn btn-outline-info" data-toggle="modal" data-target="#confirm-${category.categoryCode}">
	        													<i class="mdi mdi-replay"></i>
	        												</a>
	        												<div class="modal fade" id="confirm-${category.categoryCode}" data-backdrop="static" data-keyboard="false">
	        													<div class="modal-dialog modal-confirm modal-dialog-centered">
																	<div class="modal-content">
																		<div class="modal-header flex-column">
																			<div class="icon-box">
																				<i class="material-icons text-warning">&#xe645;</i>
																			</div>
																			<h4 class="modal-title w-100">Xác nhận khôi phục</h4>
																		</div>
																		<div class="modal-body">
																			<p>Bạn có chắc muốn khôi phục thể loại "${category.categoryName}" không?</p>
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
        												</c:if>
        											</td>
        										</tr>
        									</c:forEach>
        								</tbody>
        							</table>
        						</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        
        	<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
        	
        	<script src="<c:url value='/template/admin/libs/datatables/jquery.dataTables.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.js' />"></script>
        	
        	<script src='<c:url value="/template/admin/libs/sweetalert2/sweetalert2.min.js" />'></script>
        	<script src='<c:url value="/template/admin/js/pages/sweet-alerts.init.js" />'></script>
        	<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js'></script>
        </div>
	</body>
</html>