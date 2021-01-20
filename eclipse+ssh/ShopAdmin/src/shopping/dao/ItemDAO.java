package shopping.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

import shopping.po.Item;

@SuppressWarnings("deprecation")
public class ItemDAO extends BaseHibernateDAO implements IItemDAO{
	private Log log=LogFactory.getLog(ItemDAO.class);
	
	@Override
	public void save(Item instance) {
		try {
		 getSession().save(instance);
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	@Override
	public void delete(Object instance) {
		log.debug("delete Object instance");
		try {
			getSession().delete(instance);
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		} 
	}

	@Override
	public void update(Item instance) {
		log.debug("update Customer instance");
		try {
			getSession().update(instance);
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		} 
	}

	@Override
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
