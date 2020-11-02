package com.fpoly.coffeeshop.util;

import java.io.InputStream;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;

public class EncrpytionUtil {

	public static String encrpytion(String text) {
		try {
			InputStream inputStream = DecryptionUtil.class.getResourceAsStream("/key/publicKey.txt");
			byte[] bytes = new byte[inputStream.available()];
			inputStream.read(bytes);
			inputStream.close();
			
			X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(bytes);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
			
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
			byte [] encryptOut = cipher.doFinal(text.getBytes());
			String encrypt = Base64.getEncoder().encodeToString(encryptOut);
			
			return encrypt;
		} catch (Exception e) {
			e.printStackTrace();
			
			return "";
		}
	}
	
}
