package shopping.action;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.mysql.cj.Session;
import com.opensymphony.xwork2.ActionSupport;

import shopping.po.Customer;
import shopping.po.Feedback;
import shopping.service.ICustomerService;
import shopping.po.ShoppingCart;

public class CustomerAction extends ActionSupport {
	private Customer customer;
	private List customers = null;
	private String account;
	private Feedback feedback;
	private List feedbacks = null;
	private ShoppingCart shoppingCart;
	private List shoppingCarts = null;
	private ICustomerService customerService = null;
	private Map session;

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

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public List getFeedbacks() {
		return feedbacks;
	}

	public void setFeedbacks(List feedbacks) {
		this.feedbacks = feedbacks;
	}

	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}

	public List getShoppingCarts() {
		return shoppingCarts;
	}

	public void setShoppingCarts(List shoppingCarts) {
		this.shoppingCarts = shoppingCarts;
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

	public String feedback() {
		if (customerService.feed(feedback)) {
			return "feedsuccess";
		} else
			return "feedfail";
	}

	public String feedbackDelete() {
		if (customerService.deleteFeedback(feedback)) {
			return "deletesuccess";
		} else
			return "deletefail";
	}

	public String getCart() {
		shoppingCarts = customerService.getCart();
		return "success";
	}

	public String getAllCustomers() {
		customers = customerService.findAll();
		return "success";
	}

	public String inputValue() {
		return "success";
	}

	public String feedbackDetail() {
		return "success";
	}

	public String findByAccount() {
		customers = customerService.findByAccount(customer);
		if (customers == null) {
			return "fail";
		}
		return "success";
	}

	public String findLikeName() {
		customers = customerService.findLikeName(account);
		if (customers == null) {
			return "fail";
		}
		return "success";
	}

	public String getAllFeedbacks() {
		feedbacks = customerService.getFeedbacks();
		if (feedbacks == null) {
			return "fail";
		}
		return "success";
	}

	// 验证更新用户信息时的邮箱格式
	public void validateUpdate() {
		if (customer.getEmail() != null) {
			Pattern emailPattern = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
			Matcher matcher = emailPattern.matcher(customer.getEmail());
			if (!matcher.find()) {
				this.addFieldError("adminusernameMsg", "邮箱格式有误!");
			}
		}
	}
}
