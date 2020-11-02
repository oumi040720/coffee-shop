package com.fpoly.coffeeshop.util;

import java.io.InputStream;
import java.security.KeyFactory;
import java.security.PrivateKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

import javax.crypto.Cipher;

public class DecryptionUtil {

	public static String decryption(String encrypt) {
		try {
			InputStream inputStream = DecryptionUtil.class.getResourceAsStream("/key/privateKey.txt");
			byte [] bytes = new byte[inputStream.available()];
			inputStream.read(bytes);
			inputStream.close();
			
			PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(bytes);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
			
			Cipher cipher = Cipher.getInstance("RSA");
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			byte [] decryptOut = cipher.doFinal(Base64.getDecoder().decode(encrypt));
			String decrypt = new String(decryptOut);
			
			return decrypt;
		} catch (Exception e) {
			e.printStackTrace();
			
			return "";
		}
	}
	
}
