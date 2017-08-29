package ec.gob.acess.esamyn.util;

import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import ec.gob.acess.esamyn.exception.GeneralException;

/**
 * 
 * Clase: CifradoUtil.java
 * 
 * @author Duval Barragan Fecha: Aug 25, 2017
 * @version 1.0
 *
 */
public class CifradoUtil {

    /**
     * 
     * @param texto
     * @param llave
     * 
     * @return
     */
    public static String encriptar(String texto, String llave) throws GeneralException {

	String base64EncryptedString = "";

	try {

	    MessageDigest md = MessageDigest.getInstance("MD5");
	    byte[] digestOfPassword = md.digest(llave.getBytes("utf-8"));
	    byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
	    SecretKey key = new SecretKeySpec(keyBytes, "DESede");
	    Cipher cipher = Cipher.getInstance("DESede");
	    cipher.init(Cipher.ENCRYPT_MODE, key);
	    byte[] plainTextBytes = texto.getBytes("utf-8");
	    byte[] buf = cipher.doFinal(plainTextBytes);
	    byte[] base64Bytes = Base64.encodeBase64(buf);
	    base64EncryptedString = new String(base64Bytes);

	} catch (IOException e) {
	    throw new GeneralException(e.getMessage());
	} catch (NoSuchAlgorithmException e) {
	    throw new GeneralException(e.getMessage());
	} catch (NoSuchPaddingException e) {
	    throw new GeneralException(e.getMessage());
	} catch (InvalidKeyException e) {
	    throw new GeneralException(e.getMessage());
	} catch (IllegalBlockSizeException e) {
	    throw new GeneralException(e.getMessage());
	} catch (BadPaddingException e) {
	    throw new GeneralException(e.getMessage());
	}

	return base64EncryptedString;
    }

    public static String desencriptar(String textoEncriptado, String llave) throws GeneralException {

	String base64EncryptedString = "";

	try {
	    // llave para encriptar datos

	    byte[] message = Base64.decodeBase64(textoEncriptado.getBytes("utf-8"));
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    byte[] digestOfPassword = md.digest(llave.getBytes("utf-8"));
	    byte[] keyBytes = Arrays.copyOf(digestOfPassword, 24);
	    SecretKey key = new SecretKeySpec(keyBytes, "DESede");

	    Cipher decipher = Cipher.getInstance("DESede");
	    decipher.init(Cipher.DECRYPT_MODE, key);

	    byte[] plainText = decipher.doFinal(message);

	    base64EncryptedString = new String(plainText, "UTF-8");

	} catch (IOException e) {
	    throw new GeneralException(e.getMessage());
	} catch (NoSuchAlgorithmException e) {
	    throw new GeneralException(e.getMessage());
	} catch (NoSuchPaddingException e) {
	    throw new GeneralException(e.getMessage());
	} catch (InvalidKeyException e) {
	    throw new GeneralException(e.getMessage());
	} catch (IllegalBlockSizeException e) {
	    throw new GeneralException(e.getMessage());
	} catch (BadPaddingException e) {
	    throw new GeneralException(e.getMessage());
	}

	return base64EncryptedString;
    }

}
