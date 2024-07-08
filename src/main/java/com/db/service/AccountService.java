package com.db.service;

import java.util.List;

import com.db.entity.Account;
import com.db.entity.Customer;

public interface AccountService {

	void saveAccount(Account account);

	List<Account> getAllAccounts();

	Account getAccountDetailsByCustomerId(Customer customer);

}
