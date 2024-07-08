package com.db.service;

import java.util.List;

import com.db.entity.Account;
import com.db.entity.Transaction;

public interface TransactionService {

	void saveTransaction(String string, double amount, Account accountDetails);

	List<Transaction> getTransactionHistory(Account accountDetails);

}
