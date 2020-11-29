<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Coffee Shop | Home</title>
		
		<%@ include file="/WEB-INF/views/user/common/css.jsp" %>
	</head>
	
	<body>
        <%@ include file="/WEB-INF/views/user/common/menu.jsp" %>
        
        <section class="home-slider owl-carousel">
        	<div class="slider-item" style="background-image: url(template/user/images/bg_1.jpg);">
        		<div class="overlay"></div>
        		<div class="container">
        			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
        				<div class="col-md-8 col-sm-12 text-center ftco-animate">
        					<span class="subheading">Welcome</span>
        					<h1 class="mb-4">
        						The Best Coffee Testing Experience
        					</h1>
        					<p class="mb-4 mb-md-5">
        						A small river named Duden flows by their place and supplies it with the necessary regelialia.
        					</p>
              				<p>
              					<a href="<c:url value="/cart" />" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt hàng</a> 
              					<a href="<c:url value="/menu" />" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Xem thực đơn</a>
              				</p>
        				</div>
        			</div>
        		</div>
        	</div>
        	<div class="slider-item" style="background-image: url(template/user/images/bg_2.jpg);">
        		<div class="overlay"></div>
        		<div class="container">
        			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
        				<div class="col-md-8 col-sm-12 text-center ftco-animate">
        					<span class="subheading">Welcome</span>
        					<h1 class="mb-4">
        						Amazing Taste &amp; Beautiful Place
        					</h1>
              				<p class="mb-4 mb-md-5">
              					A small river named Duden flows by their place and supplies it with the necessary regelialia.
              				</p>
              				<p>
              					<a href="<c:url value="/cart" />" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt hàng</a> 
              					<a href="<c:url value="/menu" />" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Xem thực đơn</a>
              				</p>
        				</div>
        			</div>
        		</div>
        	</div>
        	<div class="slider-item" style="background-image: url(template/user/images/bg_3.jpg);">
        		<div class="overlay"></div>
        		<div class="container">
        			<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">
        				<div class="col-md-8 col-sm-12 text-center ftco-animate">
        					<span class="subheading">Welcome</span>
        					<h1 class="mb-4">
        						Creamy Hot and Ready to Serve
        					</h1>
              				<p class="mb-4 mb-md-5">
              					A small river named Duden flows by their place and supplies it with the necessary regelialia.
              				</p>
              				<p>
              					<a href="<c:url value="/cart" />" class="btn btn-primary p-3 px-xl-4 py-xl-3">Đặt hàng</a> 
              					<a href="<c:url value="/menu" />" class="btn btn-white btn-outline-white p-3 px-xl-4 py-xl-3">Xem thực đơn</a>
              				</p>
        				</div>
        			</div>
        		</div>
        	</div>
        </section>
        
		<section class="ftco-about d-md-flex">
	    	<div class="one-half img" style="background-image: url(template/user/images/about.jpg);"></div>
	    	<div class="one-half ftco-animate">
	    		<div class="overlap">
			        <div class="heading-section ftco-animate ">
			        	<span class="subheading">Discover</span>
			          <h2 class="mb-4">Our Story</h2>
			        </div>
		        	<div>
		  				<p
		  					>On her way she met a copy. The copy warned the Little Blind Text, 
		  					that where it came from it would have been rewritten a thousand times 
		  					and everything that was left from its origin would be the word "and" 
		  					and the Little Blind Text should turn around and return to its own, safe country. 
		  					But nothing the copy said could convince her and so it didn’t take long until a few insidious 
		  					Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, 
		  					where they abused her for their.
		  				</p>
		  			</div>
	  			</div>
	    	</div>
	    </section>
        
        <section class="ftco-section ftco-services">
    		<div class="container">
    			<div class="row">
          			<div class="col-md-4 ftco-animate">
			            <div class="media d-block text-center block-6 services">
			             	<div class="icon d-flex justify-content-center align-items-center mb-5">
			              		<span class="flaticon-choices"></span>
			              	</div>
			              	<div class="media-body">
				                <h3 class="heading">Dễ dàng đặt hàng</h3>
			              	</div>
			            </div>      
          			</div>
          			<div class="col-md-4 ftco-animate">
			            <div class="media d-block text-center block-6 services">
			              	<div class="icon d-flex justify-content-center align-items-center mb-5">
			              		<span class="flaticon-delivery-truck"></span>
			             	 </div>
			              	<div class="media-body">
			                	<h3 class="heading">Giao hàng nhanh</h3>
			              	</div>
			            </div>      
          			</div>
          			<div class="col-md-4 ftco-animate">
          				<div class="media d-block text-center block-6 services">
            				<div class="icon d-flex justify-content-center align-items-center mb-5">
              					<span class="flaticon-coffee-bean"></span>
              				</div>
              				<div class="media-body">
                				<h3 class="heading">Chất lượng sản phẩm</h3>
              				</div>
            			</div>    
          			</div>
        		</div>
    		</div>
    	</section>
        
        <section class="ftco-section">
	    	<div class="container">
	    		<div class="row justify-content-center mb-5 pb-3">
	          		<div class="col-md-7 heading-section ftco-animate text-center">
			          	<span class="subheading">Khám phá</span>
			            <h2 class="mb-4">NHỮNG SẢN PHẨM BÁN CHẠY</h2>
	          		</div>
	        	</div>
		        <div class="row">
		        	<c:forEach items="${bestSeller}" var="item">
			        	<div class="col-md-3">
			        		<div class="menu-entry">
		    					<a class="img" style="background-image: url(${item[2]}); background-size: 10rem;"></a>
		    					<div class="text text-center pt-4">
		    						<h3><a>${item[1]}</a></h3>
		    						<p class="price">
		    							<span><fmt:formatNumber pattern="#,### đ" value="${item[3]}" type="currency"/></span>
		    						</p>
		    					</div>
		    				</div>
		        		</div>
		        	</c:forEach>
       			</div>
    		</div>
    	</section>
        
        <section class="ftco-gallery">
    		<div class="container-wrap">
    			<div class="row no-gutters">
					<div class="col-md-3 ftco-animate">
						<a href="gallery.html" class="gallery img d-flex align-items-center" 
							style="background-image: url(template/user/images/gallery-1.jpg);">
							<span class="icon mb-4 d-flex align-items-center justify-content-center">
    							<span class="icon-search"></span>
    						</span>
    					</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="gallery.html" class="gallery img d-flex align-items-center" 
							style="background-image: url(template/user/images/gallery-2.jpg);">
							<span class="icon mb-4 d-flex align-items-center justify-content-center">
    							<span class="icon-search"></span>
    						</span>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="gallery.html" class="gallery img d-flex align-items-center" 
							style="background-image: url(template/user/images/gallery-3.jpg);">
							<span class="icon mb-4 d-flex align-items-center justify-content-center">
    							<span class="icon-search"></span>
    						</span>
						</a>
					</div>
					<div class="col-md-3 ftco-animate">
						<a href="gallery.html" class="gallery img d-flex align-items-center" 
							style="background-image: url(template/user/images/gallery-4.jpg);">
							<span class="icon mb-4 d-flex align-items-center justify-content-center">
    							<span class="icon-search"></span>
    						</span>
						</a>
					</div>
        		</div>
    		</div>
    	</section>
        
        <%@ include file="/WEB-INF/views/user/common/footer.jsp" %>
        
        <%@ include file="/WEB-INF/views/user/common/js.jsp" %>
	</body>
</html>