package com.db.commonUtils;

public class CustomerValidation {
	
	
	public static boolean validateCustomerDetails(String firstName, String lastName, String userName, String password) {
		if (firstName == null || lastName == null || userName == null || password == null) {
			return false;
		}
		return true;
	}

}
