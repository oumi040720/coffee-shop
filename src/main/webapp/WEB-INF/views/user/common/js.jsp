<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<script src="<c:url value='/template/user/js/jquery.min.js' />"></script>
<script src="<c:url value='/template/user/js/jquery-migrate-3.0.1.min.js' />"></script>
<script src="<c:url value='/template/user/js/popper.min.js' />"></script>
<script src="<c:url value='/template/user/js/bootstrap.min.js' />"></script>
<script src="<c:url value='/template/user/js/jquery.easing.1.3.js' />"></script>
<script src="<c:url value='/template/user/js/jquery.waypoints.min.js' />"></script>
<script src="<c:url value='/template/user/js/jquery.stellar.min.js' />"></script>
<script src="<c:url value='/template/user/js/owl.carousel.min.js' />"></script>
<script src="<c:url value='/template/user/js/jquery.magnific-popup.min.js' />"></script>
<script src="<c:url value='/template/user/js/aos.js' />"></script>
<script src="<c:url value='/template/user/js/jquery.animateNumber.min.js' />"></script>
<script src="<c:url value='/template/user/js/bootstrap-datepicker.js' />"></script>
<script src="<c:url value='/template/user/js/jquery.timepicker.min.js' />"></script>
<script src="<c:url value='/template/user/js/scrollax.min.js' />"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="<c:url value='/template/user/js/main.js' />"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script>
	$(document).ready(function() {
		getTotalItems();
	});
</script>
<script>
	function getTotalItems() {
		var items = JSON.parse(localStorage.getItem("items"));
		
		if (items === null) {
			$('#quantityItems').html('0');
		} else {
			var quantity = 0;
			items.map((item, index) => {
				quantity += item.quantity;
			});	
			
			$('#quantityItems').html(quantity);
		}
		
		if ($('#discount').val() != null && $('#discount').val().trim().length > 0) {
			getCoupon();
		}
	}
	
	function calculateSubtotal() {
		var items = JSON.parse(localStorage.getItem("items"));
		var total = 0;
		
		if (items.length === 0) {
			total = 0;	
		} else {
			items.map((item, index) => {
				total += (item.price * item.quantity);
			});
		}
		
		$('#subtotal').attr('data-price', total)
		$('#subtotal').html(total + ' VND');

		return total;
	}
	
	function calculateTotal() {
		var items = JSON.parse(localStorage.getItem("items"));
		var total = 0;
		
		if (items.length === 0) {
			total = 0;	
		} else {
			var subtotal = Number($('#subtotal').attr('data-price'));
			var delivery = Number($('#delivery').attr('data-price'));
			var priceDiscount = Number($('#priceDiscount').attr('data-price'));
			
			total = (subtotal + delivery) - priceDiscount;
		}
		
		$('#t').html(total + ' VND');
		
		return total;
	}
</script>

<script>
	$('#discount').on('focusout', () => {
		getCoupon();
	});
	$('#c').on('change', () => {
		console.log('a')
		calculateTotal();
	});
	
	function getCoupon() {
		var couponCode = $('#discount').val();
		var url = '${domain}' + '/coupon/coupon_code/' + couponCode;
		
		var subtotal = Number($('#subtotal').attr('data-price'));
		var delivery = Number($('#delivery').attr('data-price'));
		var priceDiscount = Number($('#priceDiscount').attr('data-price'));
		
		if (couponCode != null) {
			if (couponCode.trim().length > 0) {
				axios.get(url)
				.then((response) => {
					var coupon = response.data;
	
					var now = Date.now();
					if (coupon != null) {
						if (new Date(coupon.startTime) < now && new Date(coupon.endTime) > now && subtotal >= coupon.minTotalBill) {
							sessionStorage.setItem("coupon", JSON.stringify(coupon));
	
							if (coupon.type === 'Miễn Phí Vận Chuyển') {
								$('#c').val(coupon.discount);
								$('#priceDiscount').html('-' + coupon.discount);
								$('#priceDiscount').attr('data-price', coupon.discount);
							} else if (coupon.type === 'Giảm Giá Trực Tiếp') {
								$('#c').val(coupon.discount);
								$('#priceDiscount').html('-' + coupon.discount);
								$('#priceDiscount').attr('data-price', coupon.discount);
							} else if (coupon.type === 'Giảm Giá Theo Phần Trăm') {
								var percent = coupon.discount.substring(0, coupon.discount.length - 1) / 100;
								var discountPrice =  (subtotal * percent);
							
								if (discountPrice >= coupon.maxDiscount) {
									discountPrice = coupon.maxDiscount;
								}
								
								$('#c').val(discountPrice);
								$('#priceDiscount').attr('data-price', discountPrice);
								$('#priceDiscount').html('-' + discountPrice + ' VNĐ');
							}
							
							$('#discountWarning').hide();
							$('#discountWarning small.text-danger').html('');
							$('#submitButton').show();
						} else {
							$('#priceDiscount').attr('data-price', 0);
							$('#discountWarning').show();
							$('#discountWarning small.text-danger').html('Mã không hợp lệ!');
							$('#submitButton').hide();
						}
					}	
				}); 
			} else {
				$('#c').val(0);
				$('#priceDiscount').attr('data-price', 0);
				$('#checkOutButton').show();
				$('#discountWarning').hide();
				$('#discountWarning small.text-danger').html('');
			}
		} else {
			$('#priceDiscount').attr('data-price', 0);
			$('#checkOutButton').show();
			$('#discountWarning').hide();
			$('#discountWarning small.text-danger').html('');
		}
		
		calculateTotal();
	}
</script>