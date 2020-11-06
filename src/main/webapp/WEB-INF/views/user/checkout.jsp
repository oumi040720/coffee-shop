<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Check out</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
		
		<style type="text/css">
			#discount {
				text-align: left;
				height: 40px !important;
				border-left: none !important;
				border-right: none !important;
				border-top: none !important;
			    color: #c49b63 !important;
			    padding: 0;
			   	background: transparent !important;
			   	font-size: 18px;
			    border-radius: 0px;
			    display: block;
			    width: 100%;
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
							<h1 class="mb-3 mt-5 bread">Thanh toán hóa đơn</h1>
							<p class="breadcrumbs">
								<span class="mr-2"><a href="<c:url value='/menu' />">Thực đơn</a></span>
								<span class="mr-2"><a href="<c:url value='/cart' />">Giỏ Hàng</a></span>
								<span>Thanh toán</span>
							</p>
						</div>
        			</div>
        		</div>
        	</div>
        </section>

		<section class="ftco-section">
			<div class="container">
				<form action="<c:url value='/order' />" >
					<div class="row">
						<div class="col-xl-8 ftco-animate">
							<div class="billing-form ftco-bg-dark p-3 p-md-5">
								<h3 class="mb-4 billing-heading">Billing Details</h3>
								<div class="row align-items-end">
									<div class="col-md-12">
										<div class="form-group">
											<label>Họ và Tên</label>
											<input type="text" name="fullname" class="form-control" placeholder="Họ và Tên">
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Địa chỉ giao hàng</label>
											<input type="text" name="address" class="form-control" placeholder="Địa chỉ">
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Số điện thoại</label>
											<input type="text" name="phone" class="form-control" placeholder="Số điện thoại">
										</div>
									</div>
									<div class="w-100"></div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>E-mail</label>
											<input type="text" name="phone" class="form-control" placeholder="Địa chỉ E-mail">
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group">
											<label>Ghi chú</label>
											<textarea rows="3" name="note" class="form-control" placeholder="Ghi chú"></textarea>
										</div>
									</div>
									<div class="w-100"></div>
									<div class="col-md-12">
										<div class="form-group mt-4">
											<div class="radio">
												<label class="mr-3"><input type="radio" name="optradio"> Create an Account?
												</label>
												<label><input type="radio" name="optradio"> Ship to different address</label>
											</div>
										</div>
									</div>
								</div>
								<input id="items" type="hidden" name="items" />
								<input id="totalPrice" type="hidden" name="totalPrice" />
							</div>
						</div> <!-- .col-md-8 -->
		
						<div class="col-xl-4 sidebar ftco-animate">
							<div class="col-md-12 d-flex">
								<div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
									<h3 class="billing-heading mb-4">Cart Total</h3>
									<p class="d-flex">
										<span>Tổng tiền</span>
										<span id="subtotal"></span>
									</p>
									<p class="d-flex">
										<span>Delivery</span>
										<span>$0.00</span>
									</p>
									<p class="d-flex">
										<span>Mã giảm giá</span>
										<span>
											<input id="discount" class="form-control" name='discount' placeholder="Mã Giảm Giá" />
										</span>
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
							<hr>
							<div class="col-md-12">
								<div class="cart-detail ftco-bg-dark p-3 p-md-4">
									<h3 class="billing-heading mb-4">Payment Method</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="optradio" class="mr-2"> Direct Bank
													Tranfer</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label>
													<input type="radio" name="optradio" class="mr-2"> 
													Check Payment
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label><input type="radio" name="optradio" class="mr-2"> Paypal</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="checkbox">
											
												<label><input type="checkbox" value="" class="mr-2"> I have read and accept
													the terms and
													conditions</label>
											</div>
										</div>
									</div>
									<p><button id="submitButton" type="submit" class="btn btn-primary py-3 px-4">Place an order</button></p>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>

        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script type="text/javascript">
	        $(document).ready(function() {
	        	calculateSubtotal();
	        	renderBillItems();
	    	});
        </script>
        <script type="text/javascript">
			function renderBillItems() {
				var items = JSON.parse(localStorage.getItem("items"));
				$('#items').val( JSON.stringify(items) );
				$('#totalPrice').val( calculateSubtotal() );
			}
        </script>
	</body>
</html>