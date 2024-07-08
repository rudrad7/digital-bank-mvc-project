package com.db.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.entity.Account;
import com.db.entity.Customer;
import com.db.repository.AccountRepository;
import com.db.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
	@Autowired
	private AccountRepository accountRepository;

	@Override
	public void saveAccount(Account account) {
		if(account != null) {
			accountRepository.save(account);
		} else {
			System.out.println("Account object is null");
		}
		System.out.println("Account saved successfully");
		
	}

	@Override
	public List<Account> getAllAccounts() {
		return accountRepository.findAll();
	}

	@Override
	public Account getAccountDetailsByCustomerId(Customer customer) {
		if (customer != null) {
			Account accountDetails = accountRepository.findByCustomerId(customer.getCustomerId());
			if (accountDetails != null) {
				return accountDetails;
			} else {
				return new Account();
			}
		}
		return null;
	}

}
