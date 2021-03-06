package com.fpoly.coffeeshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.fpoly.coffeeshop.dto.UserDTO;

@Component
public class AuthorizationFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession httpSession = request.getSession();
		
		String url = request.getRequestURI();
		
		UserDTO user = (UserDTO) httpSession.getAttribute("USER");
		
		if (url.startsWith("/admin")) {
			if (user != null) {
				if (user.getRoleCode().equals("admin")) {
					filterChain.doFilter(servletRequest, servletResponse);
				} else if (user.getRoleCode().equals("cashier")) {
					if (url.startsWith("/admin/role") || url.startsWith("/admin/staff") 
							|| url.startsWith("/admin/category") || url.startsWith("/admin/dashboard") 
							|| url.startsWith("/admin/product") || url.startsWith("/admin/customer")
							|| url.startsWith("/admin/coupon")) {
						response.sendRedirect(request.getContextPath() + "/403");
					} else {
						filterChain.doFilter(servletRequest, servletResponse);
					}
				} else {
					response.sendRedirect(request.getContextPath() + "/403");
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/403");
			}
		} else if (url.startsWith("/login")) {
			if (user != null) {
				if (user.getRoleCode().equals("admin") || user.getRoleCode().equals("cashier")) {
					response.sendRedirect(request.getContextPath() + "/admin/dashboard");
				} else if (user.getRoleCode().equals("user")) {
					response.sendRedirect(request.getContextPath() + "/home");
				} else {
					filterChain.doFilter(servletRequest, servletResponse);
				}
			} else {
				filterChain.doFilter(servletRequest, servletResponse);
			}
		} else if (url.startsWith("/checkout") || url.startsWith("/order") 
						|| url.startsWith("/account") || url.startsWith("/order_list")
						|| url.startsWith("/order_detail") || url.startsWith("/order_result")) {
			if (user != null) {
				if (user.getRoleCode().equals("user")) {
					filterChain.doFilter(servletRequest, servletResponse);
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/403");
			}
		} else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void destroy() {
	}

}
