<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div class="left-side-menu">
	<div class="slimscroll-menu">
		<div id="sidebar-menu">
			<ul class="metismenu" id="side-menu">
				<c:if test="${USER.roleCode eq 'admin'}">
					<li class="menu-title mt-2">Trang chủ</li>
					<li>
						<a href="<c:url value="/admin/dashboard" />" >
							<i class="mdi mdi-view-dashboard"></i>
							<span> Dashboard </span>
						</a>
					</li>
					<li class="menu-title mt-2">Tài khoản</li>
					<li>
						<a href="<c:url value='/admin/role/list' />">
							<i class="mdi mdi-monitor-lock"></i>
							<span>Vai trò</span>
						</a>
					</li>
					<!-- 
					<li>
						<a href="<c:url value='/admin/user/list?page=1' />">
							<i class="mdi mdi-tooltip-account"></i>
							<span>Tài khoản</span>
						</a>
					</li>
					 -->
					<li>
						<a href="<c:url value='/admin/staff/list?page=1' />">
							<i class="mdi mdi-account-multiple"></i>
							<span> Nhân viên </span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/admin/customers/list?page=1' />">
							<i class="mdi mdi-account-cash"></i>
							<span> Khách hàng </span>
						</a>
					</li>
					<li class="menu-title mt-2">Thực đơn</li>
					<li>
						<a href="<c:url value='/admin/product/list?page=1' />">
							<i class="mdi mdi-coffee"></i>
							<span> Sản phẩm </span>
						</a>
					</li>
					<li>
						<a href="<c:url value='/admin/category/list' />">
							<!--  <i class="mdi mdi-menu"></i>-->
							<i class="mdi-arrange-bring-forward"></i>
							<span>Thể loại</span>
						</a>
					</li>				
				</c:if>
				
				<li class="menu-title mt-2">Đặt hàng</li>
				<c:if test="${USER.roleCode eq 'admin'}">
					<li>
						<a href="<c:url value='/admin/coupon/list?page=1' />">
							<i class="mdi mdi-content-copy"></i>
							<span> Phiếu mua hàng </span>
						</a>
					</li>
				</c:if>
				<li>
					<a href="<c:url value='/admin/order/list?page=1' />">
						<i class="mdi mdi-shopping"></i>
						<span> Hóa đơn </span>
					</a>
				</li>
				<li class="menu-title">Nguyên Liệu</li>
				<li>
					<a href="<c:url value='/admin/unit/list' />">
						<i class="mdi mdi-water"></i>
						<span> Đơn vị </span>
					</a>
				</li>
				<li>
					<a href="<c:url value='/admin/ingredient/list?page=1' />">
						<i class="mdi mdi-water"></i>
						<span> Thành phần </span>
					</a>
				</li>
				<li>
					<a href="">
						<i class="mdi mdi-water"></i>
						<span> Nguyên Liệu </span>
					</a>
				</li>
				<li>
					<a href="<c:url value='/admin/inputDetail/list?page=1' />">
						<i class="mdi mdi-water"></i>
						<span> Nhập Nguyên liệu </span>
					</a>
				</li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
