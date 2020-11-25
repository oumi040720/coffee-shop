<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Shop | Admin | Ingredient</title>

<!-- Table datatable css -->
<link
	href="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.css' />"
	rel="stylesheet" type="text/css">

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
									<li class="breadcrumb-item active">Danh sách</li>
								</ol>
							</div>
							<h4 class="page-title">Danh sách thành phần</h4>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card-box">
							<div>
								<a href="<c:url value='/admin/ingredient/add'/>"
									class="btn btn-success"><i class="ion ion-md-add-circle"></i> Thêm</a>
							</div>
							<br>
							<c:if test="${not empty message}">
								<div>
									<div
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
							<div>
								<table id="datatable"
									class="table table-bordered dt-responsive nowrap"
									style="border-collapse: collapse; border-spacing: 0; width: 100%;">
									<thead>
										<tr>
											<th>Tên định lượng</th>
											<th>Số lượng</th>
											<th>Đơn vị</th>
											<th>#</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ingredients}" var="ingredient">
											<tr>
												<td>${ingredient.name}</td>
												<td>${ingredient.unitCode}</td>
												<td>${ingredient.quantity}</td>
												<td><c:url var="editURL" value="/admin/ingredient/edit">
														<c:param name="id" value="${ingredient.id}" />
													</c:url> 
													<a href="${editURL}" class="btn btn-outline-info"> <i
														class="mdi mdi-pencil-outline"></i>
													</a> 
													
													<c:url var="deleteURL" value="/admin/ingredient/delete">
														<c:param name="id" value="${ingredient.id}" />
													</c:url> <a href="#" class="btn btn-outline-danger"
													data-toggle="modal" data-target="#confirm-${ingredient.id}">
														<i class="mdi mdi-window-close"></i>
												</a>
													<div class="modal fade" id="confirm-${ingredient.id}">
														<div class="modal-dialog modal-dialog-centered">
															<div class="modal-content">
																<div class="modal-header">
																	<h4 class="modal-title">Xác nhận xóa</h4>
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																</div>
																<div class="modal-body">Bạn có chắc muốn xóa thể
																	loại "${ingredient.name}" không?</div>
																<div class="modal-footer">
																	<a href="${deleteURL}" class="btn btn-outline-success">Có</a>
																	<button type="button" class="btn btn-danger"
																		data-dismiss="modal">Không</button>
																</div>
															</div>
														</div>
													</div></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
								<nav aria-label="Page navigation">
									<ul class="pagination" id="pagination"></ul>
									<input type="hidden" id="page" name="page" value="${page}"> <br>
									<br>
								</nav>

							</div>
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
		<!-- Table datatable js -->
		<script
			src="<c:url value='/template/admin/libs/datatables/jquery.dataTables.min.js' />"></script>
		<script
			src="<c:url value='/template/admin/libs/datatables/dataTables.bootstrap4.min.js' />"></script>
	</div>
</body>
</html>