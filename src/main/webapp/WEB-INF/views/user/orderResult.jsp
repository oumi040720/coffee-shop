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
								<span>Kết quả</span>
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
    					<br>
      				</c:if>
				</div>
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<div class="cart-list">
							<table class="table">
								<thead class="thead-primary">
									<tr class="text-center">
										<th>Sản Phẩm</th>
										<th>Giá</th>
										<th style="width: 15%;">Số Lượng</th>
										<th>Tổng</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${orderDetails}">
										<tr class="text-center">
											<td class="product-name">${ item.product }</td>
											<td class="price"> ${ item.price } </td>
											<td> ${ item.quantity } </td>
											<td class="total"> ${ item.totalMoney } </td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row justify-content-end">
					<div class="col col-lg-4 col-md-7 mt-5 cart-wrap ftco-animate">
						<div class="cart-total mb-3">
							<h3>Cart Totals</h3>
							<p class="d-flex">
								<span>Tổng cộng</span>
								<span id="subtotal">${order.totalPrice}</span>
							</p>
							<p class="d-flex">
								<span>Delivery</span>
								<span>$0.00</span>
							</p>
							<p class="d-flex">
								<span>Mã giảm giá</span>
								<span></span>
							</p>
							<p class="d-flex">
								<span>Discount</span>
								<span>$3.00</span>
							</p>
							<hr>
							<p class="d-flex total-price">
								<span>Total</span>
								<span>$17.60</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</section>		
        
        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script type="text/javascript">
	        $(document).ready(function() {
	        	localStorage.removeItem("items");
	        });
        </script>
	</body>
</html>