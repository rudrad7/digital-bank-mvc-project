package com.db.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.db.entity.Account;
import com.db.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired
	AccountService accountService;
	@RequestMapping("/onboard")
	public String showCreateAccountForm() {
		return "create-bank-account";
	}
	
	
	@RequestMapping("/save")
    public String createAccount(@RequestParam("accountType") String accountType,
                                @RequestParam("balance") double balance,
                                @RequestParam("customerId") int customerId,
                                Model model) {
        try {
            Account account = new Account();
            account.setAccountNumber("4243243442");
            account.setAccountType(accountType);
            account.setBalance(balance);
            account.setCustomerId(customerId);
            accountService.saveAccount(account);
            model.addAttribute("message", "Account created successfully!");
        } catch (Exception e) {
            model.addAttribute("message", "Failed to create account. Please try again.");
        }
        return "create-bank-account"; // Redirect to the same form to show the message
    }
	
	@RequestMapping("/getAll")
	public String getAllAccounts(Model model) {
		model.addAttribute("accounts", accountService.getAllAccounts());
		return "account-details-list";
	}
}
