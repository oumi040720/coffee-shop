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
		
		$('#subtotal').html(total + ' VND');
		
		return total;
	}
</script>