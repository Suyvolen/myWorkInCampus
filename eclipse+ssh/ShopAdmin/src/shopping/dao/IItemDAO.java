package shopping.dao;

import java.util.List;

import shopping.po.Item;

public interface IItemDAO extends IBaseHibernateDAO{

	void save(Item instance);

	void delete(Object instance);

	void update(Item instance);

	List findByHql(String hql);

}