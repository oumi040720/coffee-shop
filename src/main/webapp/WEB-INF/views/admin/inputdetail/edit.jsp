<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coffee Shop | Admin | InputDetail</title>

<%@ include file="/WEB-INF/views/admin/common/css.jsp"%>
<link rel="stylesheet" href='<c:url value= "https://fonts.googleapis.com/css?family=Roboto|Varela+Round" />'s>
<link rel="stylesheet" href='<c:url value="https://fonts.googleapis.com/icon?family=Material+Icons"/>'>
<link rel="stylesheet" href='<c:url value="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>'>
<script src='<c:url value="https://code.jquery.com/jquery-3.5.1.min.js" />'></script>
<script src='<c:url value="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" />'></script>
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
									<li class="breadcrumb-item"><a href="javascript: void(0);">Nguyên liệu</a></li>
									<li class="breadcrumb-item"><a href="javascript: void(0);">Nguyên liệu chi tiết</a></li>
									<li class="breadcrumb-item active">Danh sách</li>
								</ol>
							</div>
							<h4 class="page-title">Danh sách nguyên liệu chi tiết</h4>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card-box">
<!-- 							<table class="table table-bordered" id="my-table">
								<thead>
									<tr class="thead-dark">
										<th>Nguyên Liệu</th>
										<th>Mã Nguyên Liệu</th>
										<th>Số Lượng</th>
										<th>Giá Tiền</th>
										<th>Thành Tiền</th>
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
                                                        	<th>Nguyên</th>
															<th>Mã Nguyên Liệu</th>
															<th>Số Lượng</th>
															<th>Giá Tiền</th>
															<th>Thành Tiền Nguyên Liệu</th>
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
													<i class="  ion ion-md-checkmark-circle"></i> Xác nhận nguyên liệu
													</button>
                                                    <h2>Tổng Tiền </h2>
                                                    <hr>
                                                    <h3 class="float-right">VNĐ</h3> <h3 id="sumMoneyy"  class="float-right"></h3>
                                                    <input type="hidden" id="sumMoney">
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
												<i class=" ion ion-ios-refresh"></i> Thêm lại nguyên liệu
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
										<label class="col-lg-2 col-form-label"> Mã Nguyên Liệu <span
											class="text-danger"> (*) </span>
										</label>
										<div class="col-lg-10">
											<input id="inputCode" Class="form-control"
												readonly="readonly" value="${inputCode}" />
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
											<label class="col-lg-2 col-form-label"> Nguyên Liệu <span
												class="text-danger"> (*) </span>
											</label>
											<div class="col-lg-10">
												<form:select path="" cssClass="form-control"
													onchange="selected(this)" id="choise">
													<form:option value="" id="product">-- Lựa chọn Nguyên Liệu --</form:option>
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
											<input id="inputCode" Class="form-control"
												readonly="readonly" value="${inputCode}" hidden=""/> 
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
										<button id="btn_click-${menu.productName}" type="button" onclick="add('${menu.productName}')"
											class="btn btn-outline-success btn-rounded waves-effect waves-light">
											<i class="ion ion-md-add-circle"></i> Thêm nguyên liệu
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
						<s:message code="message.inputdetail.addproduct.fail"/>
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
				var inputCode = document.getElementById("inputCode").value;
				var product = document.getElementById("productName-"+id).value;
				var totalMoney = document.getElementById("totalMoney-"+id).value;				
				var price = document.getElementById("price-"+id).value;
				if(document.getElementById("totalMoney-"+id).value == ""){
					totalMoney = 1 * price
				}
				var inputDetail = {
					'quantity' : quantity,
					'input' : inputCode,
					'product' : product,
					'price' : parseInt(price),
					'totalMoney' : totalMoney,
					
				};
				console.log(inputDetail)
				if (currenIndex == -1 ) {
					addTag(inputDetail);
				}else {
					dataList[currenIndex] = inputDetail;					
					console.log(inputDetail)
					document.getElementById("btn_click-"+inputDetail.product).innerHTML = "Thêm Nguyên Liệu";
					displayAll();
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
			function addTag(inputDetail) {				
					dataList.push(inputDetail);
					console.log(dataList)
					var table = document.getElementById("dataList");						
					i = i+parseInt(inputDetail.totalMoney);
					document.getElementById("sumMoneyy").innerHTML = i;
					document.getElementById("sumMoney").setAttribute('value',i);
					table.innerHTML += "<tr>"
							+ "<td>"
							+ inputDetail.product
							+ "</td>"
							+ "<td>"
							+ inputDetail.input
							+ "</td>"
							+ "<td>"
							+ inputDetail.quantity
							+ "</td>"
							+ "<td>"
							+ inputDetail.price + " VNĐ"
							+ "</td>"
							+ "<td>"
							+ inputDetail.totalMoney + " VNĐ"
							+ "</td>"
							+ "<td name ='btnAll'><button onclick= 'edit("
							+ (dataList.length - 1)
							+ ")' class='btn btn-outline-info' ><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
							+ ((dataList.length - 1))
							+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
							+ "</tr>";	
						$('#submitCart').attr("disabled",false); 
						
						
		
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
							if(type == 'Giảm Giá Trực Tiếp' && Number(document.getElementById("sumMoney").value) >= minbill){
								if((Number(document.getElementById("sumMoney").value) - discount) > maxDiscount){
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("sumMoney").value) - maxDiscount
									document.getElementById("sumMoney").value = Number(document.getElementById("sumMoney").value) - maxDiscount
								} else{
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("sumMoney").value) - discount
									document.getElementById("sumMoney").value = Number(document.getElementById("sumMoney").value) - discount					
								}	
							} else {
								document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("sumMoney").value)
								document.getElementById("sumMoney").value = Number(document.getElementById("sumMoney").value)	
							}
							
							
							if(type == 'Giảm Giá Theo Phần Trăm' && Number(document.getElementById("sumMoney").value) >= minbill){
								console.log(Number(document.getElementById("sumMoney").value)*(discount.substring(0,res.discount.length - 1))/100)
								if((Number(document.getElementById("sumMoney").value)*(discount.substring(0,res.discount.length - 1))/100) > maxDiscount){
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("sumMoney").value) - maxDiscount
									document.getElementById("sumMoney").value = Number(document.getElementById("sumMoney").value) - maxDiscount
								}else{
									document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("sumMoney").value) - (Number(document.getElementById("sumMoney").value) * (discount.substring(0,res.discount.length - 1)/100));
									document.getElementById("sumMoney").value = Number(document.getElementById("sumMoney").value) - (Number(document.getElementById("sumMoney").value) * (discount.substring(0,res.discount.length - 1)/100));
								}								
							}else{
								document.getElementById("sumMoneyy").innerHTML = Number(document.getElementById("sumMoney").value)
								document.getElementById("sumMoney").value = Number(document.getElementById("sumMoney").value)
							}
						}
				})	
			}
			
			
			  $('#submit').on('click', () => {
				if(window.dataList.length == 0){
					$('#myModal').modal('show');
				}else{
				var id = ${input.id};
				var inputdate = new Date('${input.inputDate}');
				var inputcode = new String('${input.inputCode}');
				var status = ${input.status};
				var fullname =  new String('${input.fullname}'); 
				var address =  new String('${input.address}'); 
				var phone = new String('${input.phone}');
				var totalprice = new Number('${input.totalPrice}');
				var note = new String('${input.note}');
				var flag = ${input.flagDelete};

				  var settings = {
						  "url": "${domain}/input/update?id=" +id,
						  "method": "PUT",
						  "timeout": 0,
						  "headers": {
						    "Content-Type": "application/json"
						  },
						  "data": JSON.stringify({
							  "id":id,
							  "inputDate":inputdate,
							  "inputCode":inputcode,
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
				}).done(result => window.location.href="${domainURL}/input/list?page=1&message=message_inputdetail_insert_success&alert=success")
				 
				} 
			})  
			
			function displayAll() {
				var table = document.getElementById("dataList");
				table.innerHTML = "";					
					for (e = 0; e < dataList.length; e++) {		
						var inputDetail = dataList[e];						
						console.log(inputDetail);
						table.innerHTML += "<tr>"
								+ "<td>"
								+ inputDetail.product
								+ "</td>"
								+ "<td>"
								+ inputDetail.input
								+ "</td>"
								+ "<td>"
								+ inputDetail.quantity
								+ "</td>"
								+ "<td>"
								+ inputDetail.price + " VNĐ"
								+ "</td>"
								+ "<td>"
								+ inputDetail.totalMoney + " VNĐ"
								+ "</td>"
								+ "<td name ='btnAll'><button onclick= 'edit("
								+ e
								+ ")' class='btn btn-outline-info'><i class='mdi mdi-pencil-outline'></i></button> <button onclick= 'deleete("
								+ e
								+ ")' class='btn btn-outline-danger'><i class=' mdi mdi-window-close'></i></button></td>"
								+ "</tr>"
					 	i = i+parseInt(inputDetail.totalMoney);
						console.log(i);
						document.getElementById("sumMoneyy").innerHTML = i;	
						document.getElementById("sumMoney").setAttribute('value',i); 
					}
					
			}
			var currenIndex = -1;
			function edit(index) {
				currenIndex = index;
				var inputDetail = dataList[index];
				console.log(inputDetail)
				document.getElementById("quantity-" + inputDetail.product).value = inputDetail.quantity;
				document.getElementById("inputCode").value = inputDetail.input;
				document.getElementById("totalMoney-"+inputDetail.product).value = inputDetail.totalMoney;
				document.getElementById("btn_click-"+inputDetail.product).innerHTML = "Cập nhật nguyên liệu"; 				
			}
			function deleete(index) {
				//currenIndex = index;
				console.log(dataList[index].totalMoney)
				 i = i - Number(dataList[index].totalMoney);
				console.log(i);
				document.getElementById("sumMoneyy").innerHTML = i;	
				document.getElementById("sumMoney").setAttribute('value',"");
				document.getElementById("sumMoney").value = i;
				document.getElementById("sumMoney").setAttribute('value',i);  
				dataList.splice(index, 1);
				if(i < minbill){
					alert("a")
				}
				var quantity = document.getElementById("quantity-"+index);
				var inputCode = document.getElementById("inputCode-"+index);
				var product = document.getElementById("product-"+index);
				var totalMoney = document.getElementById("totalMoney-"+index);
				var price = document.getElementById("price");
				console.log(price)
				var inputDetail = {
					'quantity' : quantity,
					'inputCode' : inputCode,
					'product' : product,
					'totalMoney' : totalMoney,
					'price' : price,
				}
				console.log(inputDetail);
				var table = document.getElementById("dataList");
				table.innerHTML = "";
				for (e = 0; e < dataList.length; e++) {
					var inputDetail = dataList[e];
					console.log(inputDetail)
					table.innerHTML += "<tr>"
							+ "<td>"
							+ inputDetail.product
							+ "</td>"
							+ "<td>"
							+ inputDetail.input
							+ "</td>"
							+ "<td>"
							+ inputDetail.quantity
							+ "</td>"
							+ "<td>"
							+ inputDetail.price + " VNĐ"
							+ "</td>"
							+ "<td>"
							+ inputDetail.totalMoney + " VNĐ"
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
					window.location.href="${domainURL}/inputdetail/editDetail?inputCode=${inputCode}";
					});
				});
			
		</script> 
		
	</div>
</body>
</html>