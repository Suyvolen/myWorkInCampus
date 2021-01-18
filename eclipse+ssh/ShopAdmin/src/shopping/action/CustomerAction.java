package shopping.action;

import java.util.List;

import shopping.po.Customer;
import shopping.service.ICustomerService;

public class CustomerAction {
	private Customer customer;
	private List customers= null ;
	private ICustomerService customerService = null;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public ICustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}
	
	public List getCustomers() {
		return customers;
	}

	public void setCustomers(List customers) {
		this.customers = customers;
	}

	public String login() {
		if (customerService.login(customer))
			return "loginsuccess";
		else
			return "loginfail";
	}

	public String register() { 
		if (customerService.save(customer))
			return "regsuccess";
		else
			return "regfail";
	}

	public String update() { 
		if (customerService.update(customer))
			return "updatesuccess";
		else
			return "updatefail";
	}

	public String delete() { 
		if (customerService.delete(customer)) {
			return "deletesuccess";
		} else
			return "deletefail";
	}	
	
	public String getAllCustomers() {
		customers = customerService.findAll();
		return "success";
	}
	
	public String inputValue() {
		return "success";
	}
	
	public String findByAccount() {
		customers=customerService.findByAccount(customer);
		if(customers==null) {
			return "fail";
		}
		return "success";
	}
}
