package shopping.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Query;

public class AdminDAO extends BaseHibernateDAO implements IAdminDAO{
	private Log log = LogFactory.getLog(AdminDAO.class);
	
	@Override
	public List findByHql(String hql) {
		log.debug("find AdminUser instance by hql");
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
