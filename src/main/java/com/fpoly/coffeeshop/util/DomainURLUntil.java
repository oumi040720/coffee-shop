package com.fpoly.coffeeshop.util;

import java.util.ResourceBundle;

public class DomainURLUntil {

	public static String getDomainURLUntil() {
		ResourceBundle resourceBundle = ResourceBundle.getBundle("url");
		
		String result = resourceBundle.getString("domain.url");
		
		return result;
	}
}
