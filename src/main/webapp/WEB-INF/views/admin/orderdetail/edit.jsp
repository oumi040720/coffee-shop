<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Shop | Admin | OrderDetail</title>

<%@ include file="/WEB-INF/views/admin/common/css.jsp"%>
<link rel="stylesheet" href='<c:url value= "https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />'s>
<link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>'>
<link rel="stylesheet" href='<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
<script src='<c:url value="https://code.jquery.com/jquery-3.5.1.min.js" />'></script>
<script src='<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" />'></script>
<style type="text/css">
.modal-confirm {		
	color: #434e65;
	width: 525px;
}
.modal-confirm .modal-content {
	padding: 20px;
	font-size: 16px;
	border-radius: 5px;
	border: none;
}
.modal-confirm .modal-header {
	background: #e85e6c;
	border-bottom: none;   
	position: relative;
	text-align: center;
	margin: -20px -20px 0;
	border-radius: 5px 5px 0 0;
	padding: 35px;
}
.modal-confirm h4 {
	text-align: center;
	font-size: 36px;
	margin: 10px 0;
}
.modal-confirm .form-control, .modal-confirm .btn {
	min-height: 40px;
	border-radius: 3px; 
}
.modal-confirm .close {
	position: absolute;
	top: 15px;
	right: 15px;
	color: #fff;
	text-shadow: none;
	opacity: 0.5;
}
.modal-confirm .close:hover {
	opacity: 0.8;
}
.modal-confirm .icon-box {
	color: #fff;		
	width: 95px;
	height: 95px;
	display: inline-block;
	border-radius: 50%;
	z-index: 9;
	border: 5px solid #fff;
	padding: 15px;
	text-align: center;
}
.modal-confirm .icon-box i {
	font-size: 58px;
	margin: -2px 0 0 -2px;
}
.modal-confirm.modal-dialog {
	margin-top: 80px;
}
.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #eeb711 !important;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	border-radius: 30px;
	margin-top: 10px;
	padding: 6px 20px;
	min-width: 150px;
	border: none;
}
.modal-confirm .btn:hover, .modal-confirm .btn:focus {
	background: #eda645 !important;
	outline: none;
}
.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
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
									<li class="breadcrumb-item"><a href="javascript: void(0);">Hóa
											Đơn Chi Tiết</a></li>
									<li class="breadcrumb-item active">Danh sách</li>
								</ol>
							</div>
							<h4 class="page-title">Danh sách hóa đơn chi tiết</h4>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card-box">
<!-- 							<table class="table table-bordered" id="my-table">
								<thead>
									<tr class="thead-dark">
										<th>Sản Phẩm</th>
										<th>Mã Hóa Đơn</th>
										<th>Số Lượng</th>
										<th>Giá Tiền</th>
										<th>Thành Tiền Sản Phẩm</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody id="dataList">
								</tbody>
							</table>
							<br>
							<div class="form-group row">
								<div class="col-lg-10" id="finishdata" style="display: none;">
									<button id="submit" type="button"
										class="btn btn-outline-success btn-rounded waves-effect waves-light"
										style="float: right;">
										<i class="ion ion-ios-save"></i> Hoàn Thành
									</button>
								</div>
							</div> -->
							<div class="row">
                            <div class="col-12">
                                <div class="card-box">
                                    <div class="panel-body">
                                        <!-- end row -->
                                        <div class="row mt-4">
                                            <div class="col-12">
                                                <div class="table-responsive">
                                                    <table class="table table-nowrap" id="my-table">
                                                        <thead>
                                                        <tr>
                                                        	<th>Sản Phẩm</th>
															<th>Mã Hóa Đơn</th>
															<th>Số Lượng</th>
															<th>Giá Tiền</th>
															<th>Thành Tiền Sản Phẩm</th>
															<th>#</th>															
                                                        </tr></thead>
                                                        <tbody id="dataList"> 
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
                                                    <h3 class="float-right">VNĐ</h3> <h3 id="sumMoneyy" class="float-right"> </h3>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="d-print-none">
                                            <div class="float-right">                                                
                                               <button id="submit" type="button"
												class="btn btn-outline-success btn-rounded waves-effect waves-light"
												style="float: right;">
												<i class="ion ion-ios-save"></i> Hoàn Thành
												</button>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <!-- end row -->
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<div class="row">
					 <%-- <div class="col-lg-12">
						<div class="card-box">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group row">
										<label class="col-lg-2 col-form-label"> Mã Hóa Đơn <span
											class="text-danger"> (*) </span>
										</label>
										<div class="col-lg-10">
											<input id="orderCode" Class="form-control"
												readonly="readonly" value="${orderCode}" />
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label"> Tổng Tiền <span
											class="text-danger"> (*) </span>
										</label>
										<div class="col-lg-10">
											<input id="totalMoney" Class="form-control"
												readonly="readonly" />
										</div>
									</div>
									<form:form modelAttribute="menus"
										onsubmit="return checkValidated()" data-parsley-validate=""
										novalidate="">
										<div class="form-group row">
											<label class="col-lg-2 col-form-label"> Sản Phẩm <span
												class="text-danger"> (*) </span>
											</label>
											<div class="col-lg-10">
												<form:select path="" cssClass="form-control"
													onchange="selected(this)" id="choise">
													<form:option value="" id="product">-- Lựa chọn sản phẩm --</form:option>
													<c:forEach items="${menus}" var="menu">
														<form:option value="${menu.productName}"
															data-price="${menu.price}">${menu.productName}</form:option>
													</c:forEach>
												</form:select>
												<ul class="parsley-errors-list filled">
													<li id="warnningproduct" class="parsley-required"
														style="display: none;">Vui lòng không để trống SẢN
														PHẨM !</li>
												</ul>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label"> Số Lượng <span
												class="text-danger"> (*) </span>
											</label>
											<div class="col-lg-3">
												<div class="input-group">
													<span class="input-group-btn">
														<button type="button" onclick="minus()"
															class="quantity-left-minus btn btn-danger btn-number"
															data-field="">
															<span class="mdi mdi-minus-circle"></span>
														</button>
													</span> <input type="number" id="quantity" name="quantity"
														style="border: inset; text-align: center;"
														class="form-control mb-3" min="1" max="100" value="1">
													<span class="input-group-btn">
														<button type="button" onclick="plus()"
															class="quantity-right-plus btn btn-success btn-number"
															data-type="plus" data-field="">
															<span class="mdi mdi-plus-circle"></span>
														</button>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label"></label>
											<div class="col-lg-10">
												<button id="btn_click" type="button" onclick="add()"
													class="btn btn-outline-success btn-rounded waves-effect waves-light">
													<i class="ion ion-md-add-circle"></i> Thêm
												</button>
												<button type="button" onclick="clearnull()"
													class="btn btn-outline-warning btn-rounded waves-effect waves-light">
													<i class="ion ion-md-refresh"></i> Nhập lại
												</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</div>
					</div>  --%>

					 <div class="port text-center mb-3">
						<div class="portfolioContainer row">
							<c:forEach items="${menus}" var="menu">
								<div class="col-md-6 col-xl-3 natural personal">
									<div class="gallery-box">
										<a
											href='<c:url value="/template/admin/images/small/img-1.jpg"/>'
											class="image-popup" title="Screenshot-1"> <img
											src='<c:url value="/template/admin/images/small/img-1.jpg"/>'
											class="thumb-img img-fluid" alt="work-thumbnail">
										</a>
										<div class="gal-detail p-3">
										<h4 class="font-16 mt-0">${menu.productName}</h4>
											<input id="orderCode" Class="form-control"
												readonly="readonly" value="${orderCode}" hidden=""/> 
											<input
												id="price-${menu.productName}" Class="form-control" readonly="readonly"
												value="${menu.price}" hidden=""/> 
											<input id="productName-${menu.productName}"  
												Class="form-control" readonly="readonly" 
												value="${menu.productName}" hidden="" />
											 <input id="totalMoney-${menu.productName}" Class="form-control"
												readonly="readonly" hidden=""/>
												<div class="input-group">
													<span class="input-group-btn">
														<button type="button" onclick="minus('${menu.productName}')"
															class="quantity-left-minus btn btn-danger btn-number"
															data-field="">
															<span class="mdi mdi-minus-circle"></span>
														</button>
													</span> <input type="text" id="quantity-${menu.productName}" name="quantity"
														style="border: inset; text-align: center;"
														class="form-control mb-3" min="1" max="100" value="1">
													<span class="input-group-btn">
														<button type="button" onclick="plus('${menu.productName}')"
															class="quantity-right-plus btn btn-success btn-number"
															data-type="plus" data-field="">
															<span class="mdi mdi-plus-circle"></span>
														</button>
													</span>
												</div>
										</div>
										<button id="btn_click" type="button" onclick="add('${menu.productName}')"
											class="btn btn-outline-success btn-rounded waves-effect waves-light">
											<i class="ion ion-md-add-circle"></i> Thêm sản phẩm
										</button>
									</div>
								</div>
							</c:forEach>
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
						<s:message code="message.orderdetail.addproduct.fail"/>
						<button class="btn btn-success" data-dismiss="modal">Xem Lại</button>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/admin/common/js.jsp"%>
		<script
			src='<c:url value="/template/paging/jquery.twbsPagination.js" />'></script>

		 <script type="text/javascript">
		function plus(id) {
			var price = document.getElementById("price-" +id).value
			var quantity  = document.getElementById("quantity-"+id).value;
			console.log(price)
			document.getElementById("quantity-"+id).value = parseInt(quantity)+1;
			document.getElementById("totalMoney-"+id).value = parseInt(quantity) * price;
		}
		function minus(id) {
			var quantity  = document.getElementById("quantity-"+id).value;
			var price = document.getElementById("price-" +id).value
			if (quantity > 1) {
				document.getElementById("quantity-"+id).value = parseInt(quantity)-1;
				document.getElementById("totalMoney-"+id).value = parseInt(quantity) * price;
			} else {
				document.getElementById("quantity-"+id).value = 1;				
			}
		}
			window.dataList = new Array();
			function add(id) {
				var quantity  = document.getElementById("quantity-"+id).value;
				var orderCode = document.getElementById("orderCode").value;
				var product = document.getElementById("productName-"+id).value;
				var totalMoney = document.getElementById("totalMoney-"+id).value;
				var price = document.getElementById("price-"+id).value;
				var orderDetail = {
					'quantity' : quantity,
					'order' : orderCode,
					'product' : product,
					'price' : parseInt(price),
					'totalMoney' : totalMoney,
					
				};
				console.log(orderDetail)
				if (currenIndex == -1 ) {
					addTag(orderDetail);
				}else {
					dataList[currenIndex] = orderDetail;
					currenIndex = -1
					document.getElementById("btn_click").innerHTML = "Thêm";
					displayAll();
				}
				document.getElementById("quantity-"+id).value = 1;
				document.getElementById("totalMoney-"+id).value = "";
			}
			var i=0 ;
			function addTag(orderDetail) {
					dataList.push(orderDetail);
					console.log(dataList)
					var table = document.getElementById("dataList");						
					i = i+parseInt(orderDetail.totalMoney);
					console.log(i);
					document.getElementById("sumMoneyy").innerHTML = i;
					table.innerHTML += "<tr>"
							+ "<td>"
							+ orderDetail.product
							+ "</td>"
							+ "<td>"
							+ orderDetail.order
							+ "</td>"
							+ "<td>"
							+ orderDetail.quantity
							+ "</td>"
							+ "<td>"
							+ orderDetail.price + " VNĐ"
							+ "</td>"
							+ "<td>"
							+ orderDetail.totalMoney + " VNĐ"
							+ "</td>"
							+ "<td><button onclick= 'edit("
							+ (dataList.length - 1)
							+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ ((dataList.length - 1))
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>";	
			}
			function displayAll() {
					var table = document.getElementById("dataList");
					table.innerHTML = "";
					for (i = 0; i < dataList.length; i++) {
						var orderDetail = dataList[i];
						i = i+parseInt(orderDetail.totalMoney);
						console.log(i);
						document.getElementById("sumMoney").innerHTML = i;
						table.innerHTML += "<tr>"
								+ "<td>"
								+ orderDetail.product
								+ "</td>"
								+ "<td>"
								+ orderDetail.order
								+ "</td>"
								+ "<td>"
								+ orderDetail.quantity
								+ "</td>"
								+ "<td>"
								+ orderDetail.price + " VNĐ"
								+ "</td>"
								+ "<td>"
								+ orderDetail.totalMoney + " VNĐ"
								+ "</td>"
								+ "<td><button onclick= 'edit("
								+ i
								+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
								+ i
								+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
								+ "</tr>";
					}

			}
			var currenIndex = -1;
			function edit(index) {
				currenIndex = index;
				var orderDetail = dataList[index];
				//console.log(orderDetail)
				 document.getElementById("quantity-"+orderDetail.product).value = orderDetail.quantity;
				document.getElementById("orderCode").value = orderDetail.order;
				document.getElementById("totalMoney-"+orderDetail.product).value = orderDetail.totalMoney;
				document.getElementById("btn_click").innerHTML = "Cập nhật sản phẩm"; 
			}
			function deleete(index) {
				//currenIndex = index;
				dataList.splice(index, 1);
				var quantity = document.getElementById("quantity-"+index);
				var orderCode = document.getElementById("orderCode-"+index);
				var product = document.getElementById("product-"+index);
				var totalMoney = document.getElementById("totalMoney-"+index);
				var price = document.getElementById("price-"+index);
				var orderDetail = {
					'quantity' : quantity,
					'orderCode' : orderCode,
					'product' : product,
					'price' : parseInt(price),
					'totalMoney' : totalMoney,
				};
				console.log(orderDetail);
				var table = document.getElementById("dataList");
				table.innerHTML = "";
				for (i = 0; i < dataList.length; i++) {
					var orderDetail = dataList[i];
					table.innerHTML += "<tr>"
							+ "<td>"
							+ orderDetail.product
							+ "</td>"
							+ "<td>"
							+ orderDetail.order
							+ "</td>"
							+ "<td>"
							+ orderDetail.quantity
							+ "</td>"
							+ "<td>"
							+ "<td>"
							+ orderDetail.totalMoney + " VNĐ"
							+ "</td>"
							+ orderDetail.price + " VNĐ"
							+ "<td><button onclick= 'edit("
							+ i
							+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ i
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>";
				}
			}
		</script> 

		<!--  <script type="text/javascript">
		var dem = 1;
		function clearnull() {
			dem = 1
			document.getElementById("quantity").value = dem;
			document.getElementById("choise").value = "";	
			document.getElementById("totalMoney").value = "";	
		}
		function plus() {
			dem++;

			document.getElementById("quantity").value = dem;
			document.getElementById("totalMoney").value = dem * totalmoney;
		}
		function minus() {
			if (dem > 1) {
				--dem;
				console.log(dem)
			} else {
				dem = 1
				
			}
			document.getElementById("quantity").value = dem;
			document.getElementById("totalMoney").value = dem * totalmoney;
		}
			function selected(obj) {
				var options = obj.children;
				dem = 1;
				for (var i = 0; i < options.length; i++) {
					if (options[i].selected) {
						products = options[i].value;
						totalmoney = options[i].dataset.price;	
						document.getElementById("quantity").value = dem;
					}
					document.getElementById("totalMoney").value = totalmoney;
					
				}
			}
			window.dataList = new Array();
			var products = '';
			var totalmoney = '';
			function add() {
				var t = document.getElementById("finishdata");
				if (t.style.display === "none") {
					t.style.display = "block";
				}
				var quantity = document.getElementById("quantity").value;
				var orderCode = document.getElementById("orderCode").value;
				var product = document.getElementById("product").value;
				var totalMoney = document.getElementById("totalMoney").value;
				console.log(products)
				var orderDetail = {
					'quantity' : quantity,
					'order' : orderCode,
					'product' : products,
					'totalMoney' : totalMoney,
				};
				if (currenIndex == -1) {
					addTag(orderDetail);					
				} else {
					dataList[currenIndex] = orderDetail;
					currenIndex = -1
					document.getElementById("btn_click").innerHTML = "Thêm";
					displayAll();
				}

			}
			function checkValidated() {
				var product = document.getElementById("choise").value;
				var warnningproduct = document
						.getElementById("warnningproduct");
				if (product == "") {
					warnningproduct.style.display = "block"
					return false;
				} else {
					warnningproduct.style.display = "none"
				}
				return true;
			}

			function displayAll() {
				if (checkValidated()) {
					var table = document.getElementById("dataList");
					table.innerHTML = "";
					for (i = 0; i < dataList.length; i++) {
						var orderDetail = dataList[i];
						table.innerHTML += "<tr>"
								+ "<td>"
								+ products
								+ "</td>"
								+ "<td>"
								+ orderDetail.order
								+ "</td>"
								+ "<td>"
								+ orderDetail.quantity
								+ "</td>"
								+ "<td>"
								+ orderDetail.totalMoney + " VNĐ"
								+ "</td>"
								+ "<td><button onclick= 'edit("
								+ i
								+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
								+ i
								+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
								+ "</tr>";
					}
					clearnull();
				}
			}

			function addTag(orderDetail) {
				if (checkValidated()) {
					dataList.push(orderDetail);
					console.log(dataList)
					var table = document.getElementById("dataList");
					table.innerHTML += "<tr>"
							+ "<td>"
							+ products
							+ "</td>"
							+ "<td>"
							+ orderDetail.order
							+ "</td>"
							+ "<td>"
							+ orderDetail.quantity
							+ "</td>"
							+ "<td>"
							+ orderDetail.totalMoney + " VNĐ"
							+ "</td>"
							+ "<td><button onclick= 'edit("
							+ (dataList.length - 1)
							+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ (dataList.length - 1)
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>";	
					clearnull();
				}
			}

			var currenIndex = -1;
			function edit(index) {
				currenIndex = index;
				var orderDetail = dataList[index];
				 document.getElementById("quantity").value = orderDetail.quantity;
				document.getElementById("orderCode").value = orderDetail.order;
				console.log(products)
				document.getElementById("choise").value  = products;
				document.getElementById("totalMoney").value  =  orderDetail.totalMoney;
				document.getElementById("btn_click").innerHTML = "Cập Nhật";
			}

			function deleete(index) {
				currenIndex = index;
				dataList.splice(index, 1);
				var quantity = document.getElementById("quantity").value;
				var orderCode = document.getElementById("orderCode").value;
				var product = document.getElementById("product").value;
				var totalMoney = document.getElementById("totalMoney").value;
				console.log(products)
				var orderDetail = {
					'quantity' : quantity,
					'orderCode' : orderCode,
					'product' : products,
					'totalMoney' : totalmoney,
				};
				console.log(orderDetail);
				var table = document.getElementById("dataList");
				table.innerHTML = "";
				for (i = 0; i < dataList.length; i++) {
					var orderDetail = dataList[i];
					table.innerHTML += "<tr>"
							+ "<td>"
							+ products
							+ "</td>"
							+ "<td>"
							+ orderDetail.order
							+ "</td>"
							+ "<td>"
							+ orderDetail.quantity
							+ "</td>"
							+ "<td>"
							+ orderDetail.totalmoney + " VNĐ"
							+ "</td>"
							+ "<td><button onclick= 'edit("
							+ i
							+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ i
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>";
				}
			}
		</script>  -->
		<script type="text/javascript">
		$('#submit').on('click', () => {
			if(window.dataList){
				$('#myModal').modal('show');
			}
			$.ajax({
				method: "POST",
				url: 'save',
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(window.dataList),
			}).done(result => window.location.href="http://localhost:8080/CoffeeShop/admin/order/list?page=1&message=message_orderdetail_insert_success&alert=success");
			
		})
		</script>
	</div>
</body>
</html>