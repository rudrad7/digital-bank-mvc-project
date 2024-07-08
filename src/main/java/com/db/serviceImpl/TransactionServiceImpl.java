package com.db.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.entity.Account;
import com.db.entity.Transaction;
import com.db.repository.TransactionRepository;
import com.db.service.TransactionService;

@Service
public class TransactionServiceImpl implements TransactionService {
	@Autowired
	private TransactionRepository transactionRepository;

	@Override
	public void saveTransaction(String string, double amount, Account accountDetails) {
		if (accountDetails != null) {
			Transaction transaction = new Transaction();
			transaction.setType(string);
			transaction.setAccountId(accountDetails.getId());
			transaction.setAmount(amount);
			transaction.setDescription("nothing");
			transaction.setAvailableBalance(accountDetails.getBalance());
			transaction.setTransactionDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			transactionRepository.save(transaction);
			
			System.out.println("Transaction saved successfully");
		} else {
			System.out.println("Account object is null");
		}
		
	}

	@Override
	public List<Transaction> getTransactionHistory(Account accountDetails) {
		if (accountDetails != null) {
			return transactionRepository.findByAccountId(accountDetails.getId());
		} else {
			System.out.println("Account object is null");
		}
		return null;
	}

}
