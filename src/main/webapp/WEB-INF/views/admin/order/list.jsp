<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Shop | Admin | Order</title>

<%@ include file="/WEB-INF/views/admin/common/css.jsp"%>
<link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"/>'>
<link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>'>
<link rel="stylesheet" href='<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
<script src='<c:url value="https://code.jquery.com/jquery-3.5.1.min.js"/>'></script>
<script src='<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"/>'></script>
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
									<li class="breadcrumb-item"><a href="javascript: void(0);">Hóa
											Đơn</a></li>
									<c:if test="${!isBin}">
	        								<li class="breadcrumb-item active">Danh sách</li>
        							</c:if>
        							<c:if test="${isBin}">
	        								<li class="breadcrumb-item active">Thùng rác</li>
        							</c:if>
								</ol>
							</div>
							<c:if test="${!isBin}">
	        						<h4 class="page-title">Danh sách hóa đơn</h4>
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
										<a href="<c:url value='/admin/order/save' />"
											class="btn btn-success" >
											<i class="ion ion-md-add-circle"></i> Thêm</a>
										<c:if test="${!isBin}">
				        					<a href="<c:url value='/admin/order/bin/list?page=1' />" class="btn btn-warning"><i class="ion ion-md-trash"></i> Thùng rác</a>
			        					</c:if>
			      						<c:if test="${isBin}">
			       							<a href="<c:url value='/admin/order/list?page=1' />" class="btn btn-warning"><i class="ion ion-ios-albums"></i> Danh sách</a>
			      						</c:if>	
									</div>
									<div class="col-sm-4">
										<div class="d-none d-sm-block">
											<c:if test="${!isBin}">
													<c:url var="searchURL" value='/admin/order/search' />
				        					</c:if>
				      						<c:if test="${isBin}">
													<c:url var="searchURL" value='/admin/order/search' />
				      						</c:if>
											<form action="${searchURL}"
												class="app-search" method="post">
												<div class="app-search-box">
													<div class="input-group">
														<input type="text" name="key" class="form-control"
															placeholder="Search..."> 
															<input type="hidden" name="page" value="1">
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
									<div id="elertsuccess"
										class="alert alert-${alert} alert-dismissible fade show mb-0"
										role="alert">
										<button type="button" class="close" data-dismiss="alert"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									<s:message code="${message}" />
									</div>
								</div>
								<br>
							</c:if>
							<form id="form-submit"
								action="<c:url value='/admin/order/list' />" method="get">
								<table class="table table-bordered" id="my-table">
									<thead>
										<tr class="thead-dark">
											<th style="width: 15%">Ngày Đặt</th>
											<th style="width: 10%">Mã Hóa Đơn</th>
											<th style="width: 15%">Trạng Thái</th>
											<th>Ghi Chú</th>
											<th style="width: 10%">Tổng Hóa Đơn</th>
											<th class="text-center" style="width: 20%">#</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${!isBin}">
										<c:forEach var="order" items="${orders}">
											<tr>
												<td id="orderDate${order.id}"><fmt:formatDate type = "both" value="${order.orderDate}"/></td>
												<td>${order.orderCode}</td>
												<td>
												<c:if test="${order.status == 0}">Đã đặt hàng/Đã hoàn thành</c:if>
												<c:if test="${order.status == 1}">Tiếp nhận đơn hàng</c:if>
												<c:if test="${order.status == 2}"> Đang chế biến</c:if>
												<c:if test="${order.status == 3}">Đang giao hàng</c:if>
												<c:if test="${order.status == 4}">Giao hàng hoàn thành</c:if>
												<c:if test="${order.status == -1}">Đã hủy đơn hàng</c:if>
												<c:if test="${order.status == 10}">Đã đặt hàng/Đã hoàn thành</c:if>
												<c:if test="${order.status == 11}">Tiếp nhận đơn hàng</c:if>
												<c:if test="${order.status == 12}">Đang chế biến</c:if>
												<c:if test="${order.status == 13}">Đang giao hàng</c:if>
												<c:if test="${order.status == 14}">Giao hàng hoàn thành</c:if>
												</td>
												<td>${order.note}</td>
												<td>${order.totalPrice} VNĐ</td>
												<td class="text-center"><c:url var="editdetailURL"
														value="/admin/orderdetail/edit">
														<c:param name="orderCode" value="${order.orderCode}" />
													</c:url> <a href="${editdetailURL}" class="btn btn-outline-info">
														<i class="mdi mdi-pencil-box-multiple-outline"></i>
												</a> 
												<a href="#myModal-${order.id}" class="btn btn-outline-danger" data-toggle="modal">
	        													<i class=" mdi mdi-window-close"></i>
	        												</a>
												<c:if test="${order.status != -1 && order.status != 4 && order.status != 14}">
        										<a href="#" class="btn btn-outline-info" data-id="${order.id}">
        													<i class="fas fa-truck"></i>
        												</a>
        										</c:if>			
 												<c:if test="${order.status != -1 && order.status != 4 && order.status != 14 && order.status != 2 && order.status != 12 &&order.status != 3 &&order.status != 13}">
        										<a href="#" class="btn btn-outline-primary" data-id="${order.id}">
        													<i class="fas fa-sad-tear"></i>
        												</a>
        										</c:if>						
												</td>
											</tr>
											<!-- Modal HTML -->
														<div id="myModal-${order.id}" class="modal fade" data-backdrop="static" data-keyboard="false">
															<div class="modal-dialog modal-confirm">
																<div class="modal-content">
																	<div class="modal-header flex-column">
																		<div class="icon-box">
																			<i class="material-icons text-warning">&#xe645;</i>
																		</div>
																		<h4 class="modal-title w-100">Xác Nhận Xóa</h4>
																	</div>
																	<div class="modal-body">
																		<p>Bán Chắc Chắn Muốn Xóa Đơn Hàng ${order.orderCode}</p>
																	</div>
																	<div class="modal-footer justify-content-center">
																		<c:url var="deleteURL" value="/admin/order/delete">
		        															<c:param name="orderCode" value="${order.orderCode}" />
		        														</c:url>
																			<a id="alerts" href="${deleteURL}">
																				<button type="button" class="btnn">Đồng ý</button>
																			</a>
																		<button type="button" data-dismiss="modal"
																			class="btnn btn-danger">Từ chối</button>
									
																	</div>
																</div>
															</div>
														</div>
										</c:forEach>
										</c:if>
										<c:if test="${isBin}">
										<c:forEach var="order" items="${orders}">
											<tr>
												<td id="orderDate${order.id}"><fmt:formatDate type = "both" value="${order.orderDate}"/></td>
												<td>${order.orderCode}</td>
												<td>
												<c:if test="${order.status == 0}">Đã đặt hàng/Đã hoàn thành</c:if>
												<c:if test="${order.status == 1}">Tiếp nhận đơn hàng</c:if>
												<c:if test="${order.status == 2}"> Đang chế biến</c:if>
												<c:if test="${order.status == 3}">Đang giao hàng</c:if>
												<c:if test="${order.status == 4}">Giao hàng hoàn thành</c:if>
												
												<c:if test="${order.status == -1}">Đã hủy đơn hàng</c:if>
												
												<c:if test="${order.status == 10}">Đã đặt hàng/Đã hoàn thành</c:if>
												<c:if test="${order.status == 11}">Tiếp nhận đơn hàng</c:if>
												<c:if test="${order.status == 12}">Đang chế biến</c:if>
												<c:if test="${order.status == 13}">Đang giao hàng</c:if>
												<c:if test="${order.status == 14}">Giao hàng hoàn thành</c:if>
												</td>
												<td>${order.note}</td>
												<td>${order.totalPrice} VNĐ</td>
												<td class="text-center" style="width: 20%">
	        										<a href="#myModal-${order.id}" class="btn btn-outline-danger" data-toggle="modal">
	        											<i class=" mdi mdi-replay"></i>
	        										</a>
	        									</td>
											</tr>
											<!-- Modal HTML -->
														<div id="myModal-${order.id}" class="modal fade" data-backdrop="static" data-keyboard="false">
															<div class="modal-dialog modal-confirm">
																<div class="modal-content">
																	<div class="modal-header flex-column">
																		<div class="icon-box">
																			<i class="material-icons text-warning">&#xe645;</i>
																		</div>
																		<h4 class="modal-title w-100">Xác Nhận Khôi Phục</h4>
																	</div>
																	<div class="modal-body">
																		<p>Bạn Chắc Chắn Muốn Khôi Phục Đơn Hàng ${order.orderCode}</p>
																	</div>
																	<div class="modal-footer justify-content-center">
																		<c:url var="restoreURL" value="/admin/order/restore">
		        															<c:param name="id" value="${order.id}" />
		        														</c:url>
																			<a id="alerts" href="${restoreURL}">
																				<button type="button" class="btnn">Đồng ý</button>
																			</a>
																		<button type="button" data-dismiss="modal"
																			class="btnn btn-danger">Từ chối</button>
									
																	</div>
																</div>
															</div>
														</div>
										</c:forEach>
										</c:if>
									</tbody>
								</table>
								<br>
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
									<input type="hidden"  id="page" name="page" value=""> <br>
									<br>
								</nav>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%@ include file="/WEB-INF/views/admin/common/js.jsp"%>
		<script
			src='<c:url value="/template/paging/jquery.twbsPagination.js" />'></script>
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
		<script type="text/javascript">
		
		$(".btn-outline-info").click(function() {
			console.log($(this))
			var	id = $(this).data("id");
			 $.ajax({
				method: 'GET',
				url: '${domain}/order/id/' + id,
				success: function(res){		
				var	status = res.status + 1;				
				var settings = {
						  "url": "${domain}/order/update?id=" +id,
						  "method": "PUT",
						  "timeout": 0,
						  "headers": {
						    "Content-Type": "application/json"
						  },
						  "data": JSON.stringify({
							  "id":res.id,
							  "orderDate":res.orderDate,
							  "orderCode":res.orderCode,
							  "status":status,
							  "fullname":res.fullname,
							  "address":res.address,
							  "phone":res.phone,
							  "totalPrice":res.totalPrice,
							  "note":res.note,
							  "flagDelete":res.flagDelete,
							  "couponCode":res.couponCode,
							  }),
				  			};
				$.ajax(settings).done(function (response) {
					console.log(response);	
					location.reload();
						})
					}			
				})	
				 
			});
		
		$(".btn-outline-primary").click(function() {
			console.log($(this))
			var	id = $(this).data("id");
			 $.ajax({
				method: 'GET',
				url: '${domain}/order/id/' + id,
				success: function(res){		
				var	status = -1;				
				var settings = {
						  "url": "${domain}/order/update?id=" +id,
						  "method": "PUT",
						  "timeout": 0,
						  "headers": {
						    "Content-Type": "application/json"
						  },
						  "data": JSON.stringify({
							  "id":res.id,
							  "orderDate":res.orderDate,
							  "orderCode":res.orderCode,
							  "status":status,
							  "fullname":res.fullname,
							  "address":res.address,
							  "phone":res.phone,
							  "totalPrice":res.totalPrice,
							  "note":res.note,
							  "flagDelete":res.flagDelete,
							  "couponCode":res.couponCode,
							  }),
				  			};
				$.ajax(settings).done(function (response) {
					console.log(response);	
					location.reload();
						})
					}			
				})	
				 
			});
			
		</script>
	</div>
</body>
</html>