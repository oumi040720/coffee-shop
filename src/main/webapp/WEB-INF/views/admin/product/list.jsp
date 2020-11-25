<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Product</title>
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Sản phẩm</a></li>
        								<c:if test="${!isBin}">
	        								<li class="breadcrumb-item active">Danh sách</li>
        								</c:if>
        								<c:if test="${isBin}">
	        								<li class="breadcrumb-item active">Thùng rác</li>
        								</c:if>
        							</ol>
        						</div>
        						
        						<c:if test="${!isBin}">
	        						<h4 class="page-title">Danh sách sản phẩm</h4>
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
        							<div class="row">
        								<div class="col-sm-8">
        									<a href="<c:url value='/admin/product/add' />" 
        										class="btn btn-outline-success btn-rounded waves-effect waves-light">
        										<i class="ion ion-md-add-circle"></i> Thêm
        									</a>
        									<c:if test="${!isBin}">
				        						<a href="<c:url value='/admin/product/bin/list?page=1' />" class="btn btn-warning">Thùng rác</a>
			        						</c:if>
			      							<c:if test="${isBin}">
			       								<a href="<c:url value='/admin/product/list?page=1' />" class="btn btn-warning">Danh sách</a>
			      							</c:if>
        								</div>
        								<div class="col-sm-4">
        									<div class="d-none d-sm-block">
        										<form action="<c:url value='/admin/product/search' />" class="app-search" method="post">
        											<div class="app-search-box">
        												<div class="input-group">
        													<input type="text" name="key" class="form-control" placeholder="Search product...">
        													<input type="hidden" name="page" value="1" >
        													<c:if test="${isBin}">
        														<input type="hidden" name="is_deleted" value="true" >
        													</c:if>
        													<div class="input-group-append">
        														<button class="btn btn-dark" type="submit">
        															<i class="fas fa-search"></i>
        														</button>
        													</div>
        												</div>
        											</div>
        										</form>
        									</div>
        								</div>
        							</div>
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
        						<c:if test="${!isBin}">
	        						<div>
	        							<form id="form-submit" action="<c:url value='/admin/product/list' />" method="get">
		        							<table class="table table-bordered">
		        								<thead>
		        									<tr class="thead-dark">
		        										<th>Tên sản phẩm</th>
		        										<th width="10%">Hình ảnh</th>
		        										<th>Giá</th>
		        										<th>Danh mục</th>
		        										<th>#</th>
		        									</tr>
		        								</thead>
		        								<tbody>
		        									<c:forEach items="${product}" var="product">
		        										<tr>
		        											<td>${product.productName}</td>
		        											<td>
		        												<img width="100%" src="<c:url value='${product.photo}' />">
		        											</td>
		        											<td>${product.price}</td>
		        											<td>${product.categoryCode}</td>
		        											<td>
		        												<c:url var="editURL" value="/admin/product/edit">
		        													<c:param name="id" value="${product.id}" />
		        												</c:url>
		        												<a href="${editURL}" class="btn btn-outline-info">
		        													<i class="mdi mdi-pencil-outline"></i>
		        												</a>
		        												
		        												<c:url var="deleteURL" value="/admin/product/delete">
		        													<c:param name="id" value="${product.id}" />
		        												</c:url>
		        												<a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirm-${product.id}">
		        													<i class="mdi mdi-window-close"></i>
		        												</a>
		        												<div class="modal fade" id="confirm-${product.id}" data-backdrop="static" data-keyboard="false">
		        													<div class="modal-dialog modal-confirm modal-dialog-centered">
																		<div class="modal-content">
																			<div class="modal-header flex-column">
																				<div class="icon-box">
																					<i class="material-icons text-warning">&#xe645;</i>
																				</div>
																				<h4 class="modal-title w-100">Xác nhận Xóa</h4>
																			</div>
																			<div class="modal-body">
																				<p>Bạn có chắc muốn xóa sản phẩm "${product.productName}" không?</p>
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
		        							<br>
		        							<nav aria-label="Page navigation">
												<ul class="pagination" id="pagination"></ul>
												<input type="hidden" id="page" name="page" value="">
												<br><br>
											</nav>
										</form>
	        						</div>
        						</c:if>
        						
        						<c:if test="${isBin}">
        							<div>
	        							<form id="form-submit" action="<c:url value='/admin/product/bin/list' />" method="get">
		        							<table class="table table-bordered">
		        								<thead>
		        									<tr class="thead-dark">
		        										<th>Tên sản phẩm</th>
		        										<th width="10%">Hình ảnh</th>
		        										<th>Giá</th>
		        										<th>Danh mục</th>
		        										<th>#</th>
		        									</tr>
		        								</thead>
		        								<tbody>
		        									<c:forEach items="${product}" var="product">
		        										<tr>
		        											<td>${product.productName}</td>
		        											<td>
		        												<img width="100%" src="<c:url value='${product.photo}' />">
		        											</td>
		        											<td>${product.price}</td>
		        											<td>${product.categoryCode}</td>
		        											<td>
		        												<c:url var="restoreURL" value="/admin/product/restore">
		        													<c:param name="id" value="${product.id}" />
		        												</c:url>
		        												<a href="#" class="btn btn-outline-info" data-toggle="modal" data-target="#confirm-${product.id}">
		        													<i class="mdi mdi-replay"></i>
		        												</a>
		        												<div class="modal fade" id="confirm-${product.id}" data-backdrop="static" data-keyboard="false">
		        													<div class="modal-dialog modal-confirm modal-dialog-centered">
																		<div class="modal-content">
																			<div class="modal-header flex-column">
																				<div class="icon-box">
																					<i class="material-icons text-warning">&#xe645;</i>
																				</div>
																				<h4 class="modal-title w-100">Xác nhận Khôi phục</h4>
																			</div>
																			<div class="modal-body">
																				<p>Bạn có chắc muốn xóa thể loại "${product.productName}" không?</p>
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
		        							<br>
		        							<nav aria-label="Page navigation">
												<ul class="pagination" id="pagination"></ul>
												<input type="hidden" id="page" name="page" value="">
												<br><br>
											</nav>
										</form>
	        						</div>
        						</c:if>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        
        	<%@ include file="/WEB-INF/views/admin/common/js.jsp" %>
        	<script src='<c:url value="/template/paging/jquery.twbsPagination.js" />'></script>
        	<script type="text/javascript">
			var totalPages = ${totalPages};
			var currentPage = ${page};
			var limit = ${limit};
		
			$(function() {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages : totalPages,
					visiblePages : 5,
					startPage : currentPage,
					onPageClick : function(event, page) {
						if (currentPage != page) {
							$('#page').val(page);
							$('#form-submit').submit();
						}
					}
				});
			});
		</script>
		
        </div>
	</body>
</html>