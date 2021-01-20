package shopping.service;

import java.util.List;

import shopping.dao.IBaseHibernateDAO;
import shopping.po.Customer;
import shopping.po.Item;

public interface IItemService{

	boolean add(Item instance);

	boolean delete(Item instance);

	boolean update(Item instance);

	List findAll();

	public List findLikeItem(String itemname);
}