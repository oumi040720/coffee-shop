package com.fpoly.coffeeshop.util;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class EmailUtil {

	public static void sendSimpleMessage(String to, String subject, String text, JavaMailSender mailSender) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("uploncoffee@coffeeshop.com.vn");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);

		mailSender.send(message);
	}

}
