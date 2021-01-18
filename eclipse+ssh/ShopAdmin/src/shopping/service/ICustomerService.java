package shopping.service;
import java.util.List;

import shopping.po.Customer;

public interface ICustomerService {
	boolean save(Customer instance);
	boolean login(Customer instance);
	boolean delete(Customer instance);
	boolean update(Customer isntance);
	List findAll();
	public List findByAccount(Customer customer);
}
