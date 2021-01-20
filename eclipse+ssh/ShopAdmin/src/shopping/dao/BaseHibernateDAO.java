package shopping.dao;

import org.hibernate.Session;

public class BaseHibernateDAO implements IBaseHibernateDAO {
	public Session getSession() {
		return HibernateUtil.getSession();
	}
}