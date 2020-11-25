<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Admin | Input</title>
		
	<%@ include file="/WEB-INF/views/admin/common/css.jsp" %>
	<link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/css?family=Roboto|Varela+Round"/>'>
	<link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>'>
	<link rel="stylesheet" href='<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
	<script src='<c:url value="https://code.jquery.com/jquery-3.5.1.min.js"/>'></script>
	<script src='<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"/>'></script>
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
        								<li class="breadcrumb-item"><a href="javascript: void(0);"> Nhập Nguyên Liệu</a></li>
        								<c:if test="${!isBin}">
	        								<li class="breadcrumb-item active">Danh sách</li>
        								</c:if>
        								<c:if test="${isBin}">
	        								<li class="breadcrumb-item active">Thùng rác</li>
        								</c:if>
        							</ol>
        						</div>
        						<c:if test="${!isBin}">
	        						<h4 class="page-title">Danh sách nguyên liệu</h4>
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
        								<a href="<c:url value='/admin/input/save' />"
											class="btn btn-success" >
											<i class="ion ion-md-add-circle"></i> Thêm</a>
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
        						<form id="form-submit" action="<c:url value='/admin/inputDetail/list' />" method="get">
        							<table class="table table-bordered">
        								<thead>
        									<tr class="thead-dark">
        										<th>Mã Nhập Nguyên Liệu</th>
        										<th>Số Lượng</th> 
        										<th>Giá</th>      										
        										<th>Đơn Vị </th>
        										<th>Nguyên Liệu</th>
        									</tr>
        								</thead>
        								<tbody>
        									<c:if test="${!isBin}">
	        									<c:forEach var="inputdetails" items="${inputdetail}">
	        										<tr>
	        											<td>${inputdetails.inputID}</td>	        											
	        											<td>${inputdetails.quantity}</td>
	        											<td>${inputdetails.price}</td>
	        											<td>${inputdetails.unitName}</td>
	        											<td>${inputdetails.ingredientName}</td>
	        									</c:forEach>
        									</c:if>
        									<c:if test="${isBin}">
	        									<c:forEach var="customer" items="${customers}">
	        										<tr>
	        											<td>${customer.fullname}</td>
	        											<td>${customer.email}</td>
	        											<td>${customer.phone}</td>
	        											<td>${customer.address}</td>
	        											<td>${customer.username}</td>
	        											<td>
	        												<a href="#myModal-${customer.id}" class="btn btn-outline-danger" data-toggle="modal">
	        													<i class=" mdi mdi-replay"></i>
	        												</a>
	        											</td>
	        										</tr>
									        		<!-- Modal HTML -->
														<div id="myModal-${customer.id}" class="modal fade" data-backdrop="static" data-keyboard="false">
															<div class="modal-dialog modal-confirm">
																<div class="modal-content">
																	<div class="modal-header flex-column">
																		<div class="icon-box">
																			<i class="material-icons text-warning">&#xe645;</i>
																		</div>
																		<h4 class="modal-title w-100">Xác Nhận Khôi Phục</h4>
																	</div>
																	<div class="modal-body">
																		<p>Bạn Chắc Chắn Muốn Khôi Phục Khách Hàng ${customer.fullname}</p>
																	</div>
																	<div class="modal-footer justify-content-center">
																		<c:url var="restoreURL" value="/admin/customers/restore">
		        															<c:param name="id" value="${customer.id}" />
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
										<input type="hidden" id="page" name="page" value=""> <br>
										<br>
									</nav>
        						</form>
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