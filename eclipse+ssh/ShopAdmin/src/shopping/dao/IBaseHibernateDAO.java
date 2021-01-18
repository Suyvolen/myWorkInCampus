package shopping.dao;

import org.hibernate.Session;

public interface IBaseHibernateDAO {

	Session getSession();

}