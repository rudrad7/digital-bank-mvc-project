package com.db.serviceImpl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.commonUtils.CustomerValidation;
import com.db.entity.Customer;
import com.db.repository.CustomerRepository;
import com.db.service.CustomerService;


@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerRepository customerRepository;
	
	static Logger logger = LoggerFactory.getLogger(CustomerServiceImpl.class);
	


	@Override
	public void saveCustomer(String address, String email, String firstName, String lastName, String phone,
			String password) {
		logger.info("Customer details saved successfully!");
		logger.info("First Name: " + firstName);
		logger.info("Last Name: " + lastName);
		logger.info("User Name: " + phone);
	    if(CustomerValidation.validateCustomerDetails(firstName, lastName, phone, password)) {
        	logger.info("Customer details are valid");
        	Customer customer = new Customer();
        	customer.setFirstName(firstName);
        	customer.setLastName(lastName);
        	customer.setEmail(email);
        	customer.setAddress(address);
        	customer.setPhone(phone);
        	customer.setPassword(password);
        	customerRepository.save(customer);
		} else {
			logger.info("Customer details are invalid");
		}
		
	}



	@Override
	public List<Customer> getAllCustomerDetails() {
		return customerRepository.findAll();
	}



	@Override
	public boolean getCustomer(String username, String password) {
		if (username != null && password != null) {
			Customer customer = customerRepository.findByPhoneAndPassword(username, password);
			if (customer != null) {
				logger.info("Customer details are valid");
				return true;
			} else {
				logger.info("Customer details are invalid");
				return false;
			}
		}
		return false;
	}



	@Override
	public Customer getCustomerDetails(String username, String password) {
		if (username != null && password != null) {
			Customer customer = customerRepository.findByPhoneAndPassword(username, password);
			if (customer != null) {
				logger.info("Customer details are valid");
				return customer;
			} else {
				logger.info("Customer details are invalid");
				return null;
			}
		}
		return null;
	}


}
