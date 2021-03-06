package es.fi.upm.gallego.auxiliar;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CryptoAES {

	public static String IV = "AAAAAAAAAAAAAAAA";
	public static String plaintext = ""; /*Note null padding*/
	public static String encryptionKey = "0123456789abcdef";

	public static byte[] encrypt(String plainText, String encryptionKey) throws Exception {
		    Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding", "SunJCE");
		    SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
		    cipher.init(Cipher.ENCRYPT_MODE, key,new IvParameterSpec(IV.getBytes("UTF-8")));
		    return cipher.doFinal(plainText.getBytes("UTF-8"));
		  }

	  public static String decrypt(byte[] cipherText, String encryptionKey) throws Exception{
		    Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding", "SunJCE");
		    SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
		    cipher.init(Cipher.DECRYPT_MODE, key,new IvParameterSpec(IV.getBytes("UTF-8")));
		    return new String(cipher.doFinal(cipherText),"UTF-8");
		  }
	  public static void main(String [] args) {
		    try {
		      
		      System.out.println("==Java==");
		      System.out.println("plain:   " + plaintext);

		      byte[] cipher = encrypt(plaintext, encryptionKey);

		      System.out.print("cipher:  ");
		      for (int i=0; i<cipher.length; i++)
		        System.out.print(new Integer(cipher[i])+" ");
		      System.out.println("");

		      String decrypted = decrypt(cipher, encryptionKey);

		      System.out.println("decrypt: " + decrypted);

		    } catch (Exception e) {
		      e.printStackTrace();
		    } 
		  }		
}
