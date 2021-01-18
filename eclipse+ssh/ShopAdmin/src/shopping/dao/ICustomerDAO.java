package shopping.dao;
import java.util.List;

import shopping.po.Customer;
public interface ICustomerDAO extends IBaseHibernateDAO{
	public void save(Customer intstance);	
	public List findByHql(String hql);
	public void delete(Customer instance);
	public void update(Customer instance);
}
