package shopping.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;
import shopping.po.Customer;
import shopping.po.Feedback;

@SuppressWarnings("deprecation")
public class CustomerDAO extends BaseHibernateDAO implements ICustomerDAO {
	private Log log=LogFactory.getLog(CustomerDAO.class);
	
	public void save(Customer instance) {
		try {
		 getSession().save(instance);
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(Object instance) {
		log.debug("delete Object instance");
		try {
			getSession().delete(instance);
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		} 
	}

	public void update(Customer instance) {
		log.debug("update Customer instance");
		try {
			getSession().update(instance);
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		} 
	}
	
	public void feed(Feedback instance) {
		try {
			 getSession().save(instance);
			} catch (RuntimeException re) {
				log.error("feed failed", re);
				throw re;
			}
	}
	public List findByHql(String hql) {
		log.debug("find instances by hql");
		try {
			String queryString = hql;
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by hql failed", re);
			throw re;
		}
	}
}
