package shopping.po;

public class Customer {
	private int customerID;
	private String account;
	private String password;
	private String name;
	private String sex;
	private String phone;
	private String email;
	private String address;

	public Customer() {}

	public Customer(int CustomerID) {
		this.customerID = CustomerID;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Customer(int CustomerID, String account, String Password, String Name, String Phone, String Address) {
		this.customerID = CustomerID;
		this.account = account;
		this.password = Password;
		this.name = Name;
		this.phone = Phone;
		this.address = Address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
}
