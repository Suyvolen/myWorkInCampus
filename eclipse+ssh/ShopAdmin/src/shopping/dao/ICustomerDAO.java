package shopping.dao;
import java.util.List;


import shopping.po.Customer;
import shopping.po.Feedback;
public interface ICustomerDAO extends IBaseHibernateDAO{
	public void save(Customer intstance);	
	public List findByHql(String hql);
	public void delete(Object instance);
	public void update(Customer instance);
	public void feed(Feedback instance);
}
