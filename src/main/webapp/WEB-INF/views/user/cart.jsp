<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Cart</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
		
		<style type="text/css">
			.table tbody tr td.product-name {
			    font-size: 16px;
			    text-transform: uppercase;
			    line-height: 1.4;
			    color: #fff;
			    font-family: "Josefin Sans", Arial, sans-serif;
			    padding: 0;
			    margin: 0;
			}
			
			.table tbody tr td span {
				text-align: center !important;
    			vertical-align: middle;
    			color: #c49b63 !important;
			}
			
			.left {
				width: 25%;
				float: left;
			}
			
			.right {
				width: 25%;
				float: right;
			}
			
			.cart-total .form-control {
				text-align: left;
				height: 40px !important;
				border-left: none !important;
				border-right: none !important;
				border-top: none !important;
			}
		</style>
	</head>
	
	<body>
        <%@ include file="/WEB-INF/views/user/common/menu.jsp" %>
        
        <section class="home-slider owl-carousel">
        	<div class="slider-item" style="background-image: url(template/user/images/bg_3.jpg);">
        		<div class="overlay"></div>
        		<div class="container">
        			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
        				<div class="col-md-7 col-sm-12 text-center ftco-animate">
							<h1 class="mb-3 mt-5 bread">Cart</h1>
							<p class="breadcrumbs">
								<span class="mr-2"><a href="<c:url value='/home' />">Home</a></span>
								<span>Cart</span>
							</p>
						</div>
        			</div>
        		</div>
        	</div>
        </section>

		<section class="ftco-section ftco-cart">
			<div class="container">
				<div>
					<c:if test="${not empty message}">
       					<div>
      						<div class="alert alert-${alert} alert-dismissible fade show mb-0" role="alert">
      							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
      								<span aria-hidden="true">&times;</span>
      							</button>
      							<s:message code="${message}" />
       						</div>
    					</div>
      				</c:if>
      				<div id="warningUpdatePrice">
   						<div class="alert alert-warning alert-dismissible fade show mb-0" role="alert">
   							<button type="button" class="close" data-dismiss="alert" aria-label="Close">
   								<span aria-hidden="true">&times;</span>
   							</button>
   							Vui lòng tải lại trang để cập nhật giá mới!
    					</div>
   					</div>
   					<br>
				</div>
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>&nbsp;</th>
										<th>&nbsp;</th>
										<th>Sản Phẩm</th>
										<th>Giá</th>
										<th style="width: 15%;">Số Lượng</th>
										<th>Tổng</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row justify-content-end">
					<div class="col col-lg-4 col-md-7 mt-5 cart-wrap ftco-animate">
						<div class="cart-total mb-3">
							<h3></h3>
							<p class="d-flex">
								<span>Tạm tính</span>
								<span id="subtotal"></span>
							</p>
							<p class="d-flex">
								<span>Giao hàng</span>
								<span id="delivery" data-price="22000">22.000 đ</span>
							</p>
							<hr>
							<p class="d-flex total-price">
								<span>Tổng Cộng</span>
								<span id="t"></span>
							</p>
						</div>
						<p id="checkOutButton" class="text-center">
							<a href="<c:url value='/checkout' />" class="btn btn-primary py-3 px-4">
								Tiến hành thanh toán
							</a>
						</p>
					</div>
				</div>
			</div>
		</section>		
        
        <p id="priceDiscount" data-price="0" style="display: none;"></p>
        
        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script type="text/javascript">
	        $(document).ready(function() {
	        	renderItems();
	        	
	        	$('#warningUpdatePrice').hide();
	        });
        </script>
        <script type="text/javascript">
        	function renderItems() {
	 	        var items = JSON.parse(localStorage.getItem("items"));
	 	        if (items === null) {
	 	        	var items = [];
	 	        }
	 	        
	 	       	var showItemsPlace = $('.cart-list tbody');
	 	       	showItemsPlace.html('');
	 	       
	 	       	items.map((item, index) => {
	 	        	showItemsPlace.append(
	 	        		'<tr class="text-center">' +
	 	        			'<td class="product-remove">' + 
								'<a onclick="remove(' + item.id + ')"><span class="icon-close"></span></a>' +
							'</td>' + 
							'<td class="image-prod">' +
								'<div class="img" style="background-image:url( ' + item.photo + ' );"></div>' +
							'</td>' +
							'<td class="product-name">' + item.productName + '</td>' +
							'<td class="price"> ' + formatVNDCurrency(item.price) + '</td>' + 
							'<td>' + 
								'<div>' +
									'<span class="left">'  +
										'<a class="btn btn-primary btn-outline-primary" onclick="minus(' + item.id + ')"> - </a>' +
									'</span>' + 
									'<span>' + item.quantity + '</span>' +
									'<span class="right">'  +
										'<a class="btn btn-primary btn-outline-primary" onclick="plus(' + item.id + ')"> + </a>' +
									'</span>' + 
								'</div>' +
							'</td>' + 
							'<td class="total">' + formatVNDCurrency(item.price * item.quantity) + '</td>' + 
	 	        		'</tr>'
	 	        	);
	 	        });	
	 	      
	 	      getTotalItems();
	 	      calculateSubtotal();
	 	      calculateTotal();
	 	      isShowCheckOutButton();
        	}
        
        	function remove(id) {
        		var items = JSON.parse(localStorage.getItem("items"));
 	 	      
        		for (var i = 0; i < items.length; i++) {
        			if (items[i].id === id) {
        				items.splice(i, 1);
        				break;
        			}
        		}
        		
        		localStorage.setItem("items", JSON.stringify(items));
        		
        		renderItems();
        	}
        	
        	function plus(id) {
        		var items = JSON.parse(localStorage.getItem("items"));
   	 	      
        		for (var i = 0; i < items.length; i++) {
        			if (items[i].id === id) {
        				items[i].quantity += 1; 
        				break;
        			}
        		}
        	
				localStorage.setItem("items", JSON.stringify(items));
        		
        		renderItems();
        	}
			
			function minus(id) {
				var items = JSON.parse(localStorage.getItem("items"));
   	 	      
        		for (var i = 0; i < items.length; i++) {
        			if (items[i].id === id) {
        				if (items[i].quantity > 1) {
        					items[i].quantity -= 1; 
            				break;
        				} else {
        					break;
        				}
        			}
        		}
        		
				localStorage.setItem("items", JSON.stringify(items));
        		
        		renderItems();
        	}
			
			function isShowCheckOutButton() {
				var items = JSON.parse(localStorage.getItem("items"));
				
				if (items.length === 0) {
					$('#checkOutButton').hide();
				}
			}
        </script>
	</body>
</html>