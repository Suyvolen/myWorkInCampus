package shopping.dao;

import java.util.List;

public interface IAdminDAO extends IBaseHibernateDAO{

	List findByHql(String hql);

}