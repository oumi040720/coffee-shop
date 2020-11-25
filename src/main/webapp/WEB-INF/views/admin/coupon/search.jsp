<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Cpupon</title>
		
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);">Phiếu mua hàng</a></li>
        								<c:if test="${!isBin}">
	        								<li class="breadcrumb-item active">Danh sách</li>
        								</c:if>
        								<c:if test="${isBin}">
	        								<li class="breadcrumb-item active">Thùng rác</li>
        								</c:if>
        							</ol>
        						</div>
        						
        						<c:if test="${!isBin}">
       								<h4 class="page-title">Danh sách phiếu mua hàng</h4>
      							</c:if>
      							<c:if test="${isBin}">
       								<h4 class="page-title">Danh sách phiếu mua hàng đã xóa</h4>
      							</c:if>
        					</div>
        				</div>
        			</div>
        			<div class="row">
        				<div class="col-lg-12">
        					<div class="card-box">
        						<div>
        							<div class="row">
        								<div class="col-lg-8">
        									<a href="<c:url value='/admin/coupon/add' />" 
        										class="btn btn-outline-success btn-rounded waves-effect waves-light">
        										<i class="ion ion-md-add-circle"></i> Thêm
        									</a>
        									<c:if test="${!isBin}">
				        						<a href="<c:url value='/admin/coupon/bin/list?page=1' />" class="btn btn-warning">Thùng rác</a>
			        						</c:if>
			      							<c:if test="${isBin}">
			       								<a href="<c:url value='/admin/coupon/list?page=1' />" class="btn btn-warning">Danh sách</a>
			      							</c:if>
        								</div>
        								<div class="col-lg-4">
        									<div class="d-none d-sm-block">
        										<form action="<c:url value='/admin/coupon/search' />" class="app-search" method="post">
        											<div class="app-search-box">
        												<div class="input-group">
        													<select name="type" class="form-control">
        														<option value="">-- Chọn loại phiếu mua hàng --</option>
			        											<option value="giam-gia-truc-tiep">Giảm giá trực tiếp</option>
			        											<option value="giam-gia-theo-phan-tram">Giảm giá theo phần trăm</option>
        													</select>
        													<c:if test="${isBin}">
        														<input type="hidden" name="is_deleted" value="true" >
        													</c:if>
        													<input type="hidden" name="page" value="1" >
        													<div class="input-group-append">
        														<button class="btn btn-dark" type="submit">
        															Xem
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
        						<c:if test="${!isBin}">
	        						<form id="form-submit" action="<c:url value='/admin/coupon/search' />" method="get">
	        							<table class="table table-bordered">
	        								<thead>
	        									<tr class="thead-dark">
	        										<th>Mã</th>
	        										<th>Loại</th>
	        										<th>Giảm giá</th>
	        										<th>Hóa đơn tối thiểu</th>
	        										<th>Giảm giá tối đa</th>
	        										<th>Ngày bắt đầu</th>
	        										<th>Ngày kết thúc</th>
	        										<th>#</th>
	        									</tr>
	        								</thead>
	        								<tbody>
	        									<c:forEach var="coupon" items="${coupons}">
	        										<tr>
	        											<td>${coupon.couponCode}</td>
	        											<td>${coupon.type}</td>
	        											<td>
	        												<c:if test="${coupon.type eq 'Giảm Giá Trực Tiếp'}">
		        												<fmt:formatNumber pattern="#,### đ" value="${coupon.discount}" type="currency"/>
	        												</c:if>
	        												<c:if test="${coupon.type eq 'Giảm Giá Theo Phần Trăm'}">
		        												${coupon.discount}%
	        												</c:if>
	        											</td>
	        											<td>
	        												<fmt:formatNumber pattern="#,### đ" value="${coupon.minTotalBill}" type="currency"/>
	        											</td>
	        											<td>
	        												<fmt:formatNumber pattern="#,### đ" value="${coupon.maxDiscount}" type="currency"/>
	        											</td>
	        											<td>${coupon.startTime}</td>
	        											<td>${coupon.endTime}</td>
	        											<td>
	        												<c:url var="editURL" value="/admin/coupon/edit">
	        													<c:param name="id" value="${coupon.id}" />
	        												</c:url>
	        												<a href="${editURL}" class="btn btn-outline-info">
	        													<i class="mdi mdi-pencil-outline"></i>
	        												</a>
	        												
	        												<c:url var="deleteURL" value="/admin/coupon/delete">
	        													<c:param name="id" value="${coupon.id}" />
	        												</c:url>
	        												<a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirm-${coupon.id}">
	        													<i class=" mdi mdi-window-close"></i>
	        												</a>
	        												<div class="modal fade" id="confirm-${coupon.id}" data-backdrop="static" data-keyboard="false">
	        													<div class="modal-dialog modal-confirm modal-dialog-centered">
	        														<div class="modal-content">
																		<div class="modal-header flex-column">
																			<div class="icon-box">
																				<i class="material-icons text-warning">&#xe645;</i>
																			</div>
																			<h4 class="modal-title w-100">Xác nhận Xóa</h4>
																		</div>
																		<div class="modal-body">
																			<p>Bán Chắc Chắn Muốn Xóa mã "${coupon.couponCode}" không?</p>
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
        						</c:if>
        						<c:if test="${isBin}">
	        						<form id="form-submit" action="<c:url value='/admin/coupon/search' />" method="get">
	        							<table class="table table-bordered">
	        								<thead>
	        									<tr class="thead-dark">
	        										<th>Mã</th>
	        										<th>Loại</th>
	        										<th>Giảm giá</th>
	        										<th>Hóa đơn tối thiểu</th>
	        										<th>Giảm giá tối đa</th>
	        										<th>Ngày bắt đầu</th>
	        										<th>Ngày kết thúc</th>
	        										<th>#</th>
	        									</tr>
	        								</thead>
	        								<tbody>
	        									<c:forEach var="coupon" items="${coupons}">
	        										<tr>
	        											<td>${coupon.couponCode}</td>
	        											<td>${coupon.type}</td>
	        											<td>
	        												<c:if test="${coupon.type eq 'Giảm Giá Trực Tiếp'}">
		        												<fmt:formatNumber pattern="#,### đ" value="${coupon.discount}" type="currency"/>
	        												</c:if>
	        												<c:if test="${coupon.type eq 'Giảm Giá Theo Phần Trăm'}">
		        												${coupon.discount}%
	        												</c:if>
	        											</td>
	        											<td>
	        												<fmt:formatNumber pattern="#,### đ" value="${coupon.minTotalBill}" type="currency"/>
	        											</td>
	        											<td>
	        												<fmt:formatNumber pattern="#,### đ" value="${coupon.maxDiscount}" type="currency"/>
	        											</td>
	        											<td>${coupon.startTime}</td>
	        											<td>${coupon.endTime}</td>
	        											<td>
	        												<c:url var="restoreURL" value="/admin/coupon/restore">
	        													<c:param name="id" value="${coupon.id}" />
	        												</c:url>
	        												<a href="#" class="btn btn-outline-danger" data-toggle="modal" data-target="#confirm-${coupon.id}">
	        													<i class=" mdi mdi-window-close"></i>
	        												</a>
	        												<div class="modal fade" id="confirm-${coupon.id}" data-backdrop="static" data-keyboard="false">
	        													<div class="modal-dialog modal-confirm modal-dialog-centered">
	        														<div class="modal-content">
																		<div class="modal-header flex-column">
																			<div class="icon-box">
																				<i class="material-icons text-warning">&#xe645;</i>
																			</div>
																			<h4 class="modal-title w-100">Xác nhận Khôi Phục</h4>
																		</div>
																		<div class="modal-body">
																			<p>Bán Chắc Chắn Muốn Khôi Phục mã "${coupon.couponCode}" không?</p>
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
			var type = '${type}';
		
			$(function() {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages : totalPages,
					visiblePages : 5,
					startPage : currentPage,
					onPageClick : function(event, page) {
						if (currentPage != page) {
							$('#key').val(key);
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