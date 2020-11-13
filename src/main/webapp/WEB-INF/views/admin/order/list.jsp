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
									<li class="breadcrumb-item active">Danh sách</li>
								</ol>
							</div>
							<h4 class="page-title">Danh sách hóa đơn</h4>
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
											class="btn btn-outline-success btn-rounded waves-effect waves-light" ><i  
											class="ion ion-md-add-circle"></i> Thêm</a>
									</div>
									<div class="col-sm-4">
										<div class="d-none d-sm-block">
											<form action="<c:url value='/admin/order/search' />"
												class="app-search" method="post">
												<div class="app-search-box">
													<div class="input-group">
														<input type="text" name="key" class="form-control"
															placeholder="Search..."> <input type="hidden"
															name="page" value="1">
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
											<th>Ngày Đặt</th>
											<th>Mã Hóa Đơn</th>
											<th>Trạng Thái</th>
											<th>Tổng Hóa Đơn</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>

										<c:forEach var="order" items="${orders}">
											<tr>
												<td id="orderDate${order.id}"><fmt:formatDate type = "both" value="${order.orderDate}"/></td>
												<td>${order.orderCode}</td>
												<td>
												<c:if test="${order.status == 0}">Đã đặt hàng</c:if>
												<c:if test="${order.status == 1}">Tiếp nhận đơn hàng</c:if>
												<c:if test="${order.status == 2}">Chế biến</c:if>
												<c:if test="${order.status == 3}">Vận chuyển</c:if>
												<c:if test="${order.status == 4}">Giao hàng hoàn thành</c:if>
												<c:if test="${order.status == -1}">Đã hủy đơn hàng</c:if>
												</td>
												<td>${order.totalPrice} VNĐ</td>
												<td class="text-center"><c:url var="editdetailURL"
														value="/admin/orderdetail/edit">
														<c:param name="orderCode" value="${order.orderCode}" />
													</c:url> <a href="${editdetailURL}" class="btn btn-outline-info">
														<i class="mdi mdi-pencil-box-multiple-outline"></i>
												</a> 
												<a href="#myModal-${order.orderCode}" class="btn btn-outline-danger" data-toggle="modal">
        													<i class=" mdi mdi-window-close"></i>
        												</a>
												<c:if test="${order.status != -1 && order.status != 4}">
        										<a href="#" class="btn btn-outline-info" data-id="${order.id}">
        													<i class="fas fa-truck"></i>
        												</a>
        										</c:if>			
 												<c:if test="${order.status != -1 && order.status != 4}">
        										<a href="#" class="btn btn-outline-primary" data-id="${order.id}">
        													<i class="fas fa-sad-tear"></i>
        												</a>
        										</c:if>						
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
									<input type="hidden" id="page" name="page" value=""> <br>
									<br>
								</nav>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal HTML -->
		<div id="myModal" class="modal fade" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-confirmm">
				<div class="modal-content">
					<div class="modal-header justify-content-center">
						<div class="icon-box">
							<i class="material-icons">&#xE5CD;</i>
						</div>
					</div>
					<div class="modal-body text-center">
						<h4>Thất Bại!</h4>	
						<s:message code="message.order.update.fail"/>
						<button class="btn btn-success" data-dismiss="modal" id="lick">Đồng ý</button>
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