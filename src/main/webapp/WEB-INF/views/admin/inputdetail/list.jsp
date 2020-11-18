<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Shop | Admin | InputDetail</title>

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
									<li class="breadcrumb-item"><a href="javascript: void(0);">Nguyên Liệu</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">Nguyên Liệu Chi Tiết</a></li>
									<li class="breadcrumb-item active">Danh sách</li>
								</ol>
							</div>
							<h4 class="page-title">Danh sách nguyên liệu chi tiết</h4>
						</div>
					</div>
				</div>
<%-- 				 <div class="row">
					<div class="col-lg-12">
						<div class="card-box">
							<table class="table table-bordered" id="my-table">
								<thead>
									<tr class="thead-dark">
										<th>Nguyên Liệu</th>
										<th>Mã Nguyên Liệu</th>
										<th>Số Lượng</th>
										<th>Giá Tiền</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach var="inputDetail" items="${inputDetails}">
										<tr>
											<td>${inputDetail.product}</td>
											<td id="nameCode" accesskey="${inputDetail.input}">${inputDetail.input}</td>
											<td>${inputDetail.quantity}</td>
											<td>${inputDetail.price} VNĐ</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>  --%>
				      <!-- Start Page Content here -->
            <!-- ============================================================== -->
                        <div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                    <div class="panel-body">
                                        <div class="clearfix">
                                            <div class="float-sm-right mt-4 mt-sm-0">
                                                <h5>Mã Nguyên Liệu<br>
                                                    <small>${input.inputCode}</small>
                                                </h5>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="mt-4 text-sm-right">
                                                    <p><strong>Input Date: </strong>${input.inputDate}</p>
                                                </div>
                                            </div><!-- end col -->
                                        </div>
                                        <!-- end row -->

                                        <div class="row mt-4">
                                            <div class="col-12">
                                                <div class="table-responsive">
                                                    <table class="table table-nowrap">
                                                        <thead>
                                                        <tr>
                                                        	<th>Nguyên Liệu</th>
															<th>Mã Nguyên Liệu</th>
															<th>Số Lượng</th>
															<th>Giá Tiền</th>
															<th>Thành Tiền Nguyên Liệu</th>
															
                                                        </tr></thead>
                                                        <tbody> 
                                                        <c:forEach var="inputDetail" items="${inputDetails}">
															<tr>
																<td>${inputDetail.product}</td>
																<td id="nameCode" accesskey="${inputDetail.input}">${inputDetail.input}</td>
																<td>${inputDetail.quantity}</td>
																<td>${inputDetail.price} VNĐ</td>
																<td>${inputDetail.totalMoney} VNĐ</td>
															</tr>
														</c:forEach> 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6">
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="text-right mt-4">
                                                    <h2>Tổng Tiền </h2>
                                                    <hr>
                                                    <h3 class="float-right">VNĐ</h3><h3 class="float-right">${input.totalPrice}</h3>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="d-print-none">
                                            <div class="float-right">
                                                <a href="javascript:window.print()" class="btn btn-dark waves-effect waves-light"><i class="fa fa-print"></i></a>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!-- end row -->
                <!-- Footer Start -->
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                2016 - 2019 &copy; Uplon theme by <a href="">Coderthemes</a>
                            </div>
                        </div>
                    </div>
                </footer>
                <!-- end Footer -->
            <!-- ============================================================== -->
            <!-- End Page content -->
            <!-- ============================================================== -->
			</div>
		</div>
</div>
		<%@ include file="/WEB-INF/views/admin/common/js.jsp"%>
		<script
			src='<c:url value="/template/paging/jquery.twbsPagination.js" />'></script>
</body>
</html>