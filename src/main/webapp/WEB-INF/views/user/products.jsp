<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Menu</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
		<style type="text/css">
			#view {
				width: 100%;
				padding-top: 15px;
				padding-bottom: 15px;
				font-size: 17px;
    			text-transform: uppercase;
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
							<h1 class="mb-3 mt-5 bread">Menu</h1>
							<p class="breadcrumbs">
								<span class="mr-2"><a href="<c:url value='/home' />">Home</a></span>
								<span>Menu</span>
							</p>
						</div>
        			</div>
        		</div>
        	</div>
        </section>
		
		<section class="ftco-menu mb-5 pb-5">
	    	<div class="container">
		    	<div class="row justify-content-center mb-5">
		          	<div class="col-md-7 heading-section text-center ftco-animate">
		          		<span class="subheading">Discover</span>
		            	<h2 class="mb-4">Our Products</h2>
		            	<p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
		          	</div>
		        </div>
	    		<div class="row d-md-flex">
		    		<div class="col-lg-12 ftco-animate p-md-5">
			    		<div id='products' class="row">
			    			<c:forEach items="${PRODUCTS}" var="product">
			    				<div class="col-md-4 text-center">
			    					<div class="menu-wrap text-center">
										<a href="#" class="menu-img img mb-4"
											style="background-image: url(${product.photo}); background-size: 16.875rem;"></a>
										<div class="text">
											<h3><a href="#">${product.productName}</a></h3>
											<p class="price">
												<span>
													<fmt:formatNumber pattern="#,### đ" value="${product.price}" type="currency"/>
												</span>
											</p>
											<p>
												<a class="btn btn-primary btn-outline-primary" 
													onclick="add(${product.id},'${product.productName}', '${product.photo}', ${product.price})">
													Đặt hàng
												</a>
											</p>
										</div>
									</div>
			    				</div>
			    			</c:forEach>
			        	</div>
			      	</div>
			      	<div class="col-lg-12 ftco-animate p-md-5">
			      		<div class="row">
			      			<div class="col-md-5"></div>
			      			<div class="col-md-2 text-center">
			      				<a id='view' class="btn btn-primary btn-outline-primary" data-page='2'>Xem thêm</a>
			      			</div>
			      			<div class="col-md-5"></div>
			      		</div>
			      	</div>
			    </div>
	    	</div>
	    </section>
		        
        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script type="text/javascript">
        	$('#view').on('click', () => {
	        	var products = [];

	        	var showProducsPlace = $('#products');
        		var page = $('#view').attr('data-page');
        		var totalPages = ${PRODUCTS_TOTAL_PAGES};
				var url =  '${domain}' + '/product/flag_delete/list?flag_delete=false&page=' + page + '&limit=12';
				
				axios.get(url)
					.then((response) => {
						products = response.data;
						
						products.map((product, index) => {
							showProducsPlace.append(
								'<div class="col-md-4 text-center">' +
									'<div class="menu-wrap text-center">' + 
										'<a href="#" class="menu-img img mb-4" ' + 
											'style="background-image: url( ' + product.photo + ' ); background-size: 16.875rem;"></a>' + 
										'<div class="text">' + 
											'<h3><a href="#"> ' + product.productName + '</a></h3>' + 
											'<p class="price"><span> ' + formatVNDCurrency(product.price) + '</span></p>' +
											'<p>' + 
												'<a class="btn btn-primary btn-outline-primary" ' +
													'onclick="add(' + product.id + ', \'' + product.productName + '\', \'' + product.photo + '\', ' + product.price + ');">' + 
													'Đặt hàng' +
												'</a>' +
											'</p>' +
										'</div>' +
									'</div>' +
								'</div>' 
							);
						});
						
						if (Number(page) < Number(totalPages)) {
							$('#view').attr('data-page', Number(page) + 1);
						} else {
							$('#view').hide();
						}
					});
				});
        </script>
        <script type="text/javascript">
        	var items = JSON.parse(localStorage.getItem("items"));
        	if (items === null) {
	        	var items = [];
        	}
        	var item = {};
        	var check = false;
        	
        	function add(id, productName, photo, price) {
        		if (items.length === 0) {
       				items.push({
       					'id': id,
       					'productName': productName,
       					'photo': photo,
       					'price': price,
       					'quantity': 1
       				});
   				} else {
   					for (var i = 0; i < items.length; i++) {
   						if (items[i].id === id) {
   							items[i].quantity += 1;
   							check = false;
   							break;
   						} else {
   							check = true;
   						}
   					}
   					
   					if (check) {
   						items.push({
        					'id': id,
        					'productName': productName,
        					'photo': photo,
        					'price': price,
        					'quantity': 1
        				});
   					}
   				}

        		localStorage.setItem("items", JSON.stringify(items));
        		
        		getTotalItems();
        	}
        </script>
	</body>
</html>