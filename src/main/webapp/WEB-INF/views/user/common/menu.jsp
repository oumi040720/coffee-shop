<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="<c:url value='/home' />">Coffee<small>Uplon</small></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" 
				data-target="#ftco-nav" aria-controls="ftco-nav" 
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a href="<c:url value='/home' />" class="nav-link">Trang Chủ</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<c:url value='/menu' />"  class="nav-link">
						Thực Đơn
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown04">
						<c:forEach items="${CATEGORIES}" var="category">
							<a class="dropdown-item" href="<c:url value='/menu/${category.categoryCode}' />">${category.categoryName}</a>
						</c:forEach>
					</div>
				</li>
				<li class="nav-item">
					<a href="<c:url value='/about' />" class="nav-link">Giới Thiệu</a>
				</li>
				<li class="nav-item">
					<a href="<c:url value='contact' />" class="nav-link">Liên Lạc</a>
				</li>
				<c:choose>
					<c:when test="${USER == null}">
						<li class="nav-item">
							<a href="<c:url value='/login' />" class="nav-link">Đăng Nhập</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="" 
								id="dropdown04" data-toggle="dropdown" 
								aria-haspopup="true" aria-expanded="false">
								Chào, ${USER.username}
							</a>
							<c:if test="${USER.roleCode eq 'admin'}">
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="<c:url value='/admin/dashboard' />">Quản Lý</a>
									<a class="dropdown-item" href="<c:url value='/logout' />">Đăng Xuất</a>
								</div>
							</c:if>
							<c:if test="${USER.roleCode eq 'cashier'}">
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="<c:url value='/admin/order/list?page=1' />">Tài Khoản</a>
									<a class="dropdown-item" href="<c:url value='/logout' />">Đăng Xuất</a>
								</div>
							</c:if>
							<c:if test="${USER.roleCode eq 'user'}">
								<div class="dropdown-menu" aria-labelledby="dropdown04">
									<a class="dropdown-item" href="<c:url value='/account' />">Tài Khoản</a>
									<a class="dropdown-item" href="<c:url value='/cart' />">Giỏ Hàng</a>
									<a class="dropdown-item" href="<c:url value='order_list?page=1' />">Quản Lý Đơn Hàng</a>
									<a class="dropdown-item" href="<c:url value='/logout' />">Đăng Xuất</a>
								</div>
							</c:if>
						</li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item cart">
					<a href="<c:url value='/cart' />" class="nav-link">
						<span class="icon icon-shopping_cart"></span>
						<span class="bag d-flex justify-content-center align-items-center">
							<small id='quantityItems'></small>
						</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
</nav>