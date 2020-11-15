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
		
		if (url.startsWith("/CoffeeShop/admin")) {
			if (user != null) {
				if (user.getRoleCode().equals("admin")) {
					filterChain.doFilter(servletRequest, servletResponse);
				} else if (user.getRoleCode().equals("cashier")) {
					if (url.startsWith("/CoffeeShop/admin/role") || url.startsWith("/CoffeeShop/admin/staff") 
							|| url.startsWith("/CoffeeShop/admin/role") || url.startsWith("/CoffeeShop/admin/dashboard") 
							|| url.startsWith("/CoffeeShop/admin/user") || url.startsWith("/CoffeeShop/admin/customer") ) {
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
		} else if (url.startsWith("/CoffeeShop/login")) {
			if (user != null) {
				if (user.getRoleCode().equals("admin") || user.getRoleCode().equals("cashier")) {
					response.sendRedirect(request.getContextPath() + "/admin/dashboard");
				} else if (user.getRoleCode().equals("user")) {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			} else {
				filterChain.doFilter(servletRequest, servletResponse);
			}
		} else if (url.startsWith("/CoffeeShop/checkout") || url.startsWith("/CoffeeShop/order") 
						|| url.startsWith("/CoffeeShop/account") || url.startsWith("/CoffeeShop/order_list")
						|| url.startsWith("/CoffeeShop/order_detail") || url.startsWith("/CoffeeShop/order_result")) {
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
