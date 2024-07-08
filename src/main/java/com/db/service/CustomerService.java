package com.db.service;

import java.util.List;

import com.db.entity.Customer;

public interface CustomerService {


	void saveCustomer(String address, String email, String firstName, String lastName, String phone, String password);

	List<Customer>getAllCustomerDetails();

	boolean getCustomer(String username, String password);

	Customer getCustomerDetails(String username, String password);


}
