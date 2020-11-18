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
.divStyle
{
	-webkit-box-shadow: 9px 9px 20px 0px rgba(125,120,122,1);
	-moz-box-shadow: 9px 9px 20px 0px rgba(125,120,122,1);
	box-shadow: 9px 9px 20px 0px rgba(125,120,122,1);
	border-radius: 8px 8px 8px 8px;
	-moz-border-radius: 8px 8px 8px 8px;
	-webkit-border-radius: 8px 8px 8px 8px;
	border: 0px solid #260b26;
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
				<div class="row" id="turnupTable">
					<div class="col-lg-12">
						<div class="card-box" >
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
							<div class="row" >
                            <div class="col-12">
                                <div class="card-box" >
                                    <div class="panel-body">
                                        <!-- end row -->
                                        <div class="row mt-4" id="turnupTable">
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
															<th id="action">#</th>															
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
                                                	<button id="submitCart" type="button"
														class="btn btn-outline-success btn-rounded waves-effect waves-light">
													<i class="  ion ion-md-checkmark-circle"></i> Xác nhận sản phẩm
													</button>
                                                    <h2>Tổng Tiền </h2>
                                                    <hr>
                                                    <h3 class="float-right">VNĐ</h3> <h3 id="sumMoneyy"  class="float-right"></h3>
                                                    <input type="hidden"  id="sumMoney">
                                                    <input type="hidden"   id="oldSumMoney">
                                                </div>
                                            </div>                                       
                                        </div>
                                        <div id="formevent">
                                         <form:form modelAttribute="coupon">
		                                         <div class="row">
		                                         	<div class="col-sm-6"></div>
		        									<label class="col-sm-2 col-form-label">
		        										Mã giảm giá
		        									</label>
		        									<div class="col-sm-4" id="products">
		        										 <form:select path="" cssClass="form-control" onchange="selected(this)" id="choose">
		        											<form:option value="0" id="titlecoupon">-- Lựa chọn mã giảm giá --</form:option>
		        											<c:forEach items="${coupon}" var="coupons">
		        											
		        												<form:option value="${coupons.couponCode}">${coupons.couponCode}</form:option>
		        											</c:forEach>
		        										</form:select> 
		        									</div>
		        								</div> 
        								</form:form>
        								</div>
                                        <hr>
                                        <div class="d-print-none">
                                            <div class="float-right">                                                
                                               <button id="submit" type="button"
												class="btn btn-outline-success btn-rounded waves-effect waves-light"
												style="float: right; margin-left: 10px">
												<i class="ion ion-ios-save"></i> Hoàn Thành
												</button>
												
												<button id="returnProduct" type="button"
												class="btn btn-outline-success btn-rounded waves-effect waves-light"
												style="float: right">
												<i class=" ion ion-ios-refresh"></i> Thêm lại sản phẩm
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
			<div class="container-fluid" id="listProduct">
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
								<div class="col-md-6 col-xl-3 natural personal" style="position: relative;">
									<div class="gallery-box" id= "divProduct-${menu.productName}">
										 <img
											src='<c:url value="${menu.photo}"/>'
											class="thumb-img img-fluid" alt="work-thumbnail">
										
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
												<div class="input-group" id="formQuantity-${menu.productName}">
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
										<button id="btn_click-${menu.productName}" type="button" onclick="add('${menu.productName}')"
											class="btn btn-outline-success btn-rounded waves-effect waves-light" style="margin-bottom: 5px;">
											<i class="ion ion-md-add-circle"></i> Thêm sản phẩm
										</button>
									</div>
									<div class="text-wrap" id="buyProduct-${menu.productName}" style="position: absolute; transform:translate(130%,-130%); width: 80px ;height:80px;font-size: 2.25rem; border-style: solid; border-width: 5px;border-color: red;border-radius: 50%;box-shadow:#00FFCC -3px 3px 0px;display: none;">
										<h1 style="color: red;text-shadow:#00FFCC -4px 3px 0px"><i class="fas fa-check"></i></h1>
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
						<button class="btn btn-success" data-dismiss="modal" id="lick">Xem Lại</button>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="/WEB-INF/views/admin/common/js.jsp"%>
		<script
			src='<c:url value="/template/paging/jquery.twbsPagination.js" />'></script>
		
		<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
		
		 <script type="text/javascript">
		function plus(id) {
			var price = document.getElementById("price-" +id).value
			var quantity  = document.getElementById("quantity-"+id).value;
			document.getElementById("quantity-"+id).value = parseInt(quantity)+1;
			document.getElementById("totalMoney-"+id).value = Number(document.getElementById("quantity-"+id).value) * price;
		}
		function minus(id) {
			var quantity  = document.getElementById("quantity-"+id).value;
			var price = document.getElementById("price-" +id).value
			if (quantity > 1) {
				document.getElementById("quantity-"+id).value = parseInt(quantity)-1;
				document.getElementById("totalMoney-"+id).value = Number(document.getElementById("quantity-"+id).value) * price;
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
				if(document.getElementById("totalMoney-"+id).value == ""){
					totalMoney = 1 * price
				}

				var orderDetail = {
					'quantity' : quantity,
					'order' : orderCode,
					'product' : product,
					'price' : parseInt(price),
					'totalMoney' : totalMoney,
					
				};
				
				 if(currenIndex == -1){
					 addTag(orderDetail);
					 document.getElementById("buyProduct-"+id).style.display = "block";
					 document.getElementById("formQuantity-"+id).style.visibility = "hidden"
					 document.getElementById("btn_click-"+id).style.visibility = "hidden"
					 
				 }else{
					dataList[currenIndex] = orderDetail;
					currenIndex = -1;
					document.getElementById("btn_click-"+orderDetail.product).innerHTML = "<i class='ion ion-md-add-circle'></i> Thêm Sản Phẩm";
					displayAll(); 
					document.getElementById("formQuantity-"+id).style.visibility = "hidden";
					document.getElementById("btn_click-"+id).style.visibility = "hidden";
					document.getElementById("buyProduct-"+id).style.display = "block";
				 }
				document.getElementById("quantity-"+id).value = 1;
				document.getElementById("totalMoney-"+id).value = ""; 
			}	
			
			$(document).ready(function(){
				  $('#choose').hover(function(){
					  if(window.dataList.length == 0){
						  $(this).attr('disabled',true);
					  }					  
				  });
				  
				  $('#submitCart').hover(function(){
					  if(window.dataList.length != 0){
						  $(this).attr('disabled',false);
					  }else{
						  $(this).attr('disabled',true); 						 
					  }	
				  });
				});
			
			var i= 0;
			function addTag(orderDetail) {				
					dataList.push(orderDetail);
					console.log(dataList)
					var table = document.getElementById("dataList");						
					i = i+parseInt(orderDetail.totalMoney);
					document.getElementById("sumMoneyy").innerHTML = i;
					document.getElementById("sumMoney").setAttribute('value',i);
					document.getElementById("oldSumMoney").setAttribute('value',i);
					table.innerHTML += "<tr>"
							+ "<td style='display:none;'>"
							+ dataList.length
							+ "</td>"
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
							+ "<td name ='btnAll'><button onclick= 'edit("
							+ (dataList.length - 1)
							+ ")' class='btn btn-outline-info' ><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ ((dataList.length - 1))
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>";	
						$('#submitCart').attr("disabled",false); 
						$('#choose').attr('disabled',true);						
										
			}
			var type = '';	
			var discount = '';
			var minbill = '';
			var incoupon = '';			
			//chọn combobox
			function selected(obj) {
				var options = obj.children;		
				for (var i = 0; i < options.length; i++) {
					if (options[i].selected) {
						coupon = options[i].value;						
					}					
				}
				incoupon = coupon;
				
				$.ajax({
						method: 'GET',
						url: '${domain}/coupon/coupon_code/' + incoupon,
						success: function(res){
							type = res.type
							discount = res.discount;
							minbill = res.minTotalBill
							maxDiscount = res.maxDiscount
							
							if(type == 'Giảm Giá Theo Phần Trăm' && Number(document.getElementById("oldSumMoney").value) >= minbill){
								if((Number(document.getElementById("oldSumMoney").value)*(discount/100)) > maxDiscount){
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("oldSumMoney").value) - maxDiscount
									document.getElementById("sumMoney").value = Number(document.getElementById("oldSumMoney").value) - maxDiscount
								}else{
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("oldSumMoney").value) - (Number(document.getElementById("oldSumMoney").value) * (discount.substring(0,res.discount.length - 1)/100))
									document.getElementById("sumMoney").value = Number(document.getElementById("oldSumMoney").value) - (Number(document.getElementById("oldSumMoney").value) * (discount.substring(0,res.discount.length - 1)/100))
								}								
							}else if(type == "Giảm Giá Trực Tiếp" && Number(document.getElementById("oldSumMoney").value) >= minbill){		
								if((Number(document.getElementById("oldSumMoney").value) - discount) > maxDiscount){
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("oldSumMoney").value) - maxDiscount							
									document.getElementById("sumMoney").value = Number(document.getElementById("oldSumMoney").value) - maxDiscount
									console.log(document.getElementById("sumMoneyy").innerHTML)
								} else{
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("oldSumMoney").value) - discount
									document.getElementById("sumMoney").value = Number(document.getElementById("oldSumMoney").value) - discount	
								}	
							} else {
								document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("oldSumMoney").value)
								document.getElementById("sumMoney").value = Number(document.getElementById("oldSumMoney").value)	
								//console.log(document.getElementById("sumMoneyy").innerHTML)
							}
						}
				})	
			}
			
			
			  $('#submit').on('click', () => {
				if(window.dataList.length == 0){
					$('#myModal').modal('show');
				}else{
				var id = ${order.id};
				var orderdate = new Date('${order.orderDate}');
				var ordercode = new String('${order.orderCode}');
				var status = ${order.status};
				var fullname =  new String('${order.fullname}'); 
				var address =  new String('${order.address}'); 
				var phone = new String('${order.phone}');
				var totalprice = new Number('${order.totalPrice}');
				var note = new String('${order.note}');
				var flag = ${order.flagDelete};

				  var settings = {
						  "url": "${domain}/order/update?id=" +id,
						  "method": "PUT",
						  "timeout": 0,
						  "headers": {
						    "Content-Type": "application/json"
						  },
						  "data": JSON.stringify({
							  "id":id,
							  "orderDate":orderdate,
							  "orderCode":ordercode,
							  "status":status,
							  "fullname":fullname,
							  "address":address,
							  "phone":phone,
							  "totalPrice":Number(document.getElementById("sumMoney").value),
							  "note":note,
							  "flagDelete":flag,
							  "couponCode":incoupon,
							  }),
				  			};
				  $.ajax(settings).done(function (response) {
					  console.log(response);
					}); 				  
				  $.ajax({
					method: "POST",
					url: 'save',
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(window.dataList),
				}).done(result => window.location.href="${domainURL}/order/list?page=1&message=message_orderdetail_insert_success&alert=success")				 
				} 
			})  
			
			function displayAll() {
				var table = document.getElementById("dataList");
				var  sum = 0;
				table.innerHTML = "";					
					for (e = 0; e < dataList.length; e++) {		
						var orderDetail = dataList[e];	
						sum  += Number(dataList[e].totalMoney);						
						table.innerHTML += "<tr>"
								+ "<td style='display:none;'>"
								+ (e+1)
								+ "</td>"
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
								+ "<td name ='btnAll'><button onclick= 'edit("
								+ e
								+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
								+ e
								+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
								+ "</tr>"	
								var moving = document.getElementById("divProduct-"+ orderDetail.product);	
								moving.classList.remove("divStyle");								
					}
					document.getElementById("sumMoneyy").innerHTML = sum;
					document.getElementById("sumMoney").setAttribute('value',sum);
					document.getElementById("oldSumMoney").setAttribute('value',sum); 
					var movingTable = document.getElementById("turnupTable");
					movingTable.scrollIntoView();
					
					
			}
			var currenIndex = -1;
			function edit(index) {
				currenIndex = index;
				var orderDetail = dataList[index];
				console.log(orderDetail)
				document.getElementById("productName-" + orderDetail.product).value = orderDetail.product;
				document.getElementById("quantity-" + orderDetail.product).value = orderDetail.quantity;
				document.getElementById("orderCode").value = orderDetail.order;
				document.getElementById("totalMoney-"+orderDetail.product).value = orderDetail.totalMoney;
				document.getElementById("btn_click-"+orderDetail.product).innerHTML = "Cập nhật sản phẩm";
				var moving = document.getElementById("divProduct-"+ orderDetail.product);
				moving.scrollIntoView();
				moving.classList.add("divStyle");
				document.getElementById("formQuantity-"+orderDetail.product).style.visibility = "visible";
				document.getElementById("btn_click-"+orderDetail.product).style.visibility = "visible";
				document.getElementById("buyProduct-"+orderDetail.product).style.display = "none";
			}
			function deleete(index) {
				//currenIndex = index;
				console.log(dataList[index].totalMoney)
				 i -=  Number(dataList[index].totalMoney);
				console.log(i);
				document.getElementById("sumMoneyy").innerHTML = i;	
				document.getElementById("sumMoney").setAttribute('value',"");
				document.getElementById("sumMoney").value = i;
				document.getElementById("sumMoney").setAttribute('value',i);  
				document.getElementById("oldSumMoney").setAttribute('value',i);
				dataList.splice(index, 1);
				var quantity = document.getElementById("quantity-"+index);
				var orderCode = document.getElementById("orderCode-"+index);
				var product = document.getElementById("product-"+index);
				var totalMoney = document.getElementById("totalMoney-"+index);
				var price = document.getElementById("price");
				console.log(price)
				var orderDetail = {
					'quantity' : quantity,
					'orderCode' : orderCode,
					'product' : product,
					'totalMoney' : totalMoney,
					'price' : price,
				}
				console.log(orderDetail);
				var table = document.getElementById("dataList");
				table.innerHTML = "";
				for (e = 0; e < dataList.length; e++) {
					var orderDetail = dataList[e];
					console.log(orderDetail)
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
							+ e
							+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ e
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>"
				}
			}
			
			$(document).ready(function(){
				$( "#submitCart" ).click(function() {
					$('#action').hide();
					$('[name="btnAll"]').hide();
					$('#listProduct').hide();
					$('#choose').attr("disabled", false);
					});
				});
						
			$(document).ready(function(){
				$( "#returnProduct" ).click(function() {
					window.location.href="${domainURL}/orderdetail/editDetail?orderCode=${orderCode}";
					});
				});
			
		</script> 
		
	</div>
</body>
</html>