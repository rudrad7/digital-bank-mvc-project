package com.db.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "transaction")
public class Transaction {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int transactionId;
	@Column(name = "account_id")
	private int accountId;
	@Column(name = "amount")
	private double amount;
	@Column(name = "available_balance")
	private double availableBalance;
	@Column(name = "type")
	private String type;
	@Column(name = "description")
	private String description;
	@Column(name = "transaction_date")	
	private String transactionDate;

	public Transaction() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Transaction(int transactionId, int accountId, double amount, String type, String description,
			String transactionDate, double availableBalance) {
		super();
		this.transactionId = transactionId;
		this.accountId = accountId;
		this.amount = amount;
		this.type = type;
		this.description = description;
		this.transactionDate = transactionDate;
		this.availableBalance = availableBalance;
	}

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public double getAvailableBalance() {
		return availableBalance;
	}
	
	public void setAvailableBalance(double availableBalance) {
		this.availableBalance = availableBalance;
	}

	
	@Override
	public String toString() {
		return "Transaction [transactionId=" + transactionId + ", accountId=" + accountId + ", amount=" + amount
				+ ", type=" + type + ", description=" + description + ", transactionDate=" + transactionDate + "]";
	}
	
	
	
	
	
	

}
