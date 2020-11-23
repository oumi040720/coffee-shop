<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Input</title>
		
		<!-- Table datatable css -->
		<link href="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.css' />" rel="stylesheet" type="text/css">
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Đơn vi</a></li>
        								<li class="breadcrumb-item active">Danh sách</li>
        							</ol>
        						</div>
        						<h4 class="page-title">Danh sách nguyên liệu</h4>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div>
        							<a href="<c:url value='/admin/input/add'/>" class="btn btn-success">Thêm</a>
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
        										<th>Tên nguyên liệu</th>
        										<th>#</th>
        									</tr>
        								</thead>
        								<tbody>
        									<c:forEach items="${input}" var="input">
        										<tr>
        											<td>${input.inputDate}</td>
        											<td>
        												<c:url var="editURL" value="/admin/input/edit">
        													<c:param name="input_id" value="${input.id}" />
        												</c:url>
        												<a href="${editURL}" class="btn btn-outline-info">
        													<i class="mdi mdi-pencil-outline"></i>
        												</a>
        												
        												<c:url var="deleteURL" value="/admin/input/delete">
        													<c:param name="input_id" value="${input.id}" />
        												</c:url>
        												<a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirm-${input.id}">
        													<i class="mdi mdi-window-close"></i>
        												</a>
        												<div class="modal fade" id="confirm-${input.id}">
        													<div class="modal-dialog modal-dialog-centered">
        														<div class="modal-content">
	        														<div class="modal-header">
	        															<h4 class="modal-title">Xác nhận xóa</h4>
	        															<button type="button" class="close" data-dismiss="modal">&times;</button>
	        														</div>
	        														<div class="modal-body">
	        															Bạn có chắc muốn xóa nguyên liệu "${input.inputDate}" không?
	        														</div>
	        														<div class="modal-footer">
	        															<a href="${deleteURL}" class="btn btn-outline-success">Có</a>
	        															<button type="button" class="btn btn-danger" data-dismiss="modal">Không</button>
	        														</div>
        														</div>
        													</div>
        												</div>
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
        	
        	<!-- Table datatable js -->
        	<script src="<c:url value='/template/admin/libs/datatables/jquery.dataTables.min.js' />"></script>
        	<script src="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.js' />"></script>
        </div>
	</body>
</html>