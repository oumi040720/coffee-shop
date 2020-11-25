<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Cart</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
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
							<form id="form-submit" action="<c:url value='/order_list' />" method="get">
								<table class="table">
									<thead class="thead-primary">
										<tr class="text-center">
											<th>Mã hóa đơn</th>
											<th>Ngày đặt</th>
											<th>Tổng tiền</th>
											<th>Trạng thái</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${orders}">
											<tr class="text-center">
												<td>${ item.orderCode }</td>
												<td> ${ item.orderDate } </td>
												<td class="total"> <fmt:formatNumber value="${ item.totalPrice }" type="currency"/> </td>
												<td>
													<c:if test="${item.status == -1}">
														Đã hủy
													</c:if>
													<c:if test="${item.status == 0}">
														Đã đặt hàng
													</c:if>
													<c:if test="${item.status == 1}">
														Đã tiếp nhận
													</c:if>
													<c:if test="${item.status == 2}">
														Đang chế biến
													</c:if>
													<c:if test="${item.status == 3}">
														Đang giao
													</c:if>
													<c:if test="${item.status == 4}">
														Giao hàng thành công
													</c:if>
												</td>
												<td>
													<c:url var="editURL" value="/order_detail">
       													<c:param name="order_code" value="${ item.orderCode }" />
       												</c:url>
       												<a href="${editURL}" class="btn btn-primary btn-outline-primary">
       													Xem
       												</a> 
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
       							<nav aria-label="Page navigation">
									<ul class="pagination justify-content-end" id="pagination"></ul>
									<input type="hidden" id="page" name="page" value=""> 
									<br><br>
								</nav>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>		
        
        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script src='<c:url value="/template/paging/jquery.twbsPagination.js" />'></script>
        <script type="text/javascript">
        	$(document).ready(() => {
        		$('ul#pagination li.page-item a.page-link').addClass('btn btn-primary btn-outline-primary');		
        		$('ul#pagination li.page-item a.page-link').removeClass('page-link');
        	});
        </script>
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
	</body>
</html>