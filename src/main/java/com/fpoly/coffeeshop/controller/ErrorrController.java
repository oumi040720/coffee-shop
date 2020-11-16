package com.fpoly.coffeeshop.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorrController implements ErrorController {

	@RequestMapping(value = "/403")
	public String show403Page() {
		return "403";
	}
	
	@RequestMapping(value = "/404")
	public String show404Page() {
		return "404";
	}
	
	@RequestMapping(value = "/500")
	public String show500Page() {
		return "500";
	}

	@RequestMapping("/error")
	public String handleError(HttpServletRequest request) {
	    Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	    
	    if (status != null) {
	        Integer statusCode = Integer.valueOf(status.toString());
	    
	        if(statusCode == HttpStatus.NOT_FOUND.value()) {
	            return "redirect:/404";
	        }
	        else if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	            return "redirect:/500";
	        }
	    }
	    return "redirect:/404";
	}
	
	@Override
	public String getErrorPath() {
		return null;
	}

}

