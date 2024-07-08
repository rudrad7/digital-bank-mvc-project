package com.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.db.entity.Account;
import com.db.entity.Customer;
import com.db.entity.Transaction;
import com.db.service.AccountService;
import com.db.service.CustomerService;
import com.db.service.TransactionService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private TransactionService transactionService;

	@RequestMapping("/onboard")
	public String onboardCustomer() {
		return "customer-onboarding";
	}

	@PostMapping("/save")
	public String saveCustomer(@RequestParam("address") String address, @RequestParam("email") String email,
			@RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName,
			@RequestParam("phone") String phone, @RequestParam("password") String password, Model model) {

		customerService.saveCustomer(address, email, firstName, lastName, phone, password);
		model.addAttribute("message", "Customer onboarded successfully!");
		return "customer-onboarding";
	}

	@RequestMapping("/getAll")
	public ModelAndView getAllCustomerDetails() {
		ModelAndView modelAndView = new ModelAndView("customer-details-list"); // assuming "customer-details.jsp" is the
																				// view
																				// name
		modelAndView.addObject("customers", customerService.getAllCustomerDetails());
		return modelAndView;
	}

	@RequestMapping("/editCustomer")
	public String editCustomer(@RequestParam("customerId") int customerId, Model model) {

		return "customer-edit";
	}

	@RequestMapping("/adminDashboard")
	public String adminDashboard() {
		return "admin-dashboard";
	}

	@RequestMapping("/customerDashboard")
	public String customerDashboard() {
		return "customer-dashboard";
	}

	@RequestMapping("/getCustomerDetails")
	public String getCustomerDetails(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("role", "customer");
			request.getSession().setAttribute("password", password);
			Customer customer = customerService.getCustomerDetails(username, password);
			Account accountDetails = accountService.getAccountDetailsByCustomerId(customer);
			model.addAttribute("customer", customer);
			model.addAttribute("accountDetails", accountDetails);
			return "customer-details";
		} else {
			return "index";
		}
	}

	@RequestMapping("/getBalance")
	public String getBalance(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("role", "customer");
			request.getSession().setAttribute("password", password);
			Customer customer = customerService.getCustomerDetails(username, password);
			Account accountDetails = accountService.getAccountDetailsByCustomerId(customer);
			model.addAttribute("balance", accountDetails.getBalance());
			return "customer-balance";
		} else {
			return "index";
		}
	}

	@RequestMapping("/withdrawMoneyViewPage")
	public String withdrawMoney(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			return "withdraw-money";
		} else {
			model.addAttribute("message", "Invalid username or password !").toString();
			return "index";
		}
	}

	@RequestMapping("/withdraw")
	public String withdrawMoney(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("amount") double amount, HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			Customer customer = customerService.getCustomerDetails(username, password);
			Account accountDetails = accountService.getAccountDetailsByCustomerId(customer);
			double balance = accountDetails.getBalance();
			if (balance >= amount) {
				accountDetails.setBalance(balance - amount);
				accountService.saveAccount(accountDetails);
				model.addAttribute("message", "Amount withdrawn successfully!");
				transactionService.saveTransaction("Withdraw", amount, accountDetails);
			} else {
				model.addAttribute("error", "Insufficient balance!");
				System.out.println("Insufficient balance!");
			}
			return "withdraw-money";
		} else {
			model.addAttribute("error", "Invalid username or password !").toString();
			return "index";
		}
	}

	@RequestMapping("/getTranHistory")
	public String getTransactionHistory(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			Customer customer = customerService.getCustomerDetails(username, password);
			Account accountDetails = accountService.getAccountDetailsByCustomerId(customer);
			List<Transaction> transactionHistory = transactionService.getTransactionHistory(accountDetails);
			System.out.println("Transaction History: " + transactionHistory.stream().count());
			transactionHistory.stream().forEach(w -> System.out.println(w.getTransactionDate()));
			model.addAttribute("transactions", transactionHistory);
			return "transaction-history";
		} else {
			return "index";
		}
	}

	@RequestMapping("/depositMoneyViewPage")
	public String depositMoney(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			return "deposit-money";
		} else {
			model.addAttribute("message", "Invalid username or password !").toString();
			return "index";
		}
	}

	@RequestMapping("/deposit")
	public String depositMoney(@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("amount") double amount, HttpServletRequest request, Model model) {
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			Customer customer = customerService.getCustomerDetails(username, password);
			Account accountDetails = accountService.getAccountDetailsByCustomerId(customer);
			double balance = accountDetails.getBalance();
			accountDetails.setBalance(balance + amount);
			accountService.saveAccount(accountDetails);
			model.addAttribute("message", "Amount deposited successfully!");
			transactionService.saveTransaction("Deposit", amount, accountDetails);
			return "deposit-money";
		} else {
			model.addAttribute("message", "Invalid username or password !").toString();
			return "index";
		}
	}

	@RequestMapping("/createCustomerBankView")
	public String createCustomerBankView(@RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request, Model model) {
		Account accountDetails = null;
		if (customerService.getCustomer(username, password)) {
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("password", password);
			Customer customer = customerService.getCustomerDetails(username, password);
			accountDetails = accountService.getAccountDetailsByCustomerId(customer);
		} else {
			model.addAttribute("message", "Customer Not Found !").toString();
			return "index";
		}
		if (accountDetails != null) {
			System.out.println(accountDetails.toString());
			model.addAttribute("message", "Account is already created !").toString();
			return "customer-dashboard";
		} else {
			return "create-customer-bank";
		}
	}
}
