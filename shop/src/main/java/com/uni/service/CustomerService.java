package com.uni.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
	
@Service
public class CustomerService 
{
	@Autowired
	BCryptPasswordEncoder bcrypt;
	
	//Validate retype 
	public boolean validatePassword(String s1,String s2) {
		if(s1.equals(s2)) {
			return true;
		}else {
			return false;
		}
	}
	
	//Generate hash value of given string
	public String encryptPassword(String InputPass) {
		return bcrypt.encode(InputPass);
	}
	

//Generate hash value of given string	
//public String generateEncrypt(String InputPass) {
//	StringBuilder hash = new StringBuilder();	
//	try{
//		MessageDigest sha = MessageDigest.getInstance("SHA-1");
//		byte[] hashedBytes = sha.digest(InputPass.getBytes());
//		char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
//					'a', 'b', 'c', 'd', 'e', 'f' };
//		for (int idx = 0; idx < hashedBytes.length; ++idx) {
//			byte b = hashedBytes[idx];
//			hash.append(digits[(b & 0xf0) >> 4]);
//			hash.append(digits[b & 0x0f]);
//			}
//		}catch(NoSuchAlgorithmException ne){
//			//printStakeTrace();
//			ne.printStackTrace();
//		}
//	return hash.toString();
//	}

}
