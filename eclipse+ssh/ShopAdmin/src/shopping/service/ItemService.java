package shopping.service;

import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import shopping.dao.IItemDAO;
import shopping.po.Item;

public class ItemService implements IItemService {
	private IItemDAO itemDAO = null;
	private Map<String, Object> request;
	
	public ItemService() {}

	public IItemDAO getItemDAO() {
		return itemDAO;
	}

	public void setItemDAO(IItemDAO itemDAO) {
		this.itemDAO = itemDAO;
	}
	
	@Override
	public boolean add(Item instance) {
		Transaction tran = null;
		try {
			tran = itemDAO.getSession().beginTransaction();
			itemDAO.save(instance);
			tran.commit();
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			return false;
		}finally {
			itemDAO.getSession().close();
		}
	}
	
	@Override
	public boolean delete(Item instance) {
		Transaction tran = null;
		try {
			tran = itemDAO.getSession().beginTransaction();
			itemDAO.delete(instance);
			tran.commit();
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			return false;
		}finally {
			itemDAO.getSession().close();
		}
	}
	
	@Override
	public boolean update(Item instance) {
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		Transaction tran = null;
		try {
			tran = itemDAO.getSession().beginTransaction();
			itemDAO.update(instance);
			tran.commit();
			request.put("tip", "更新成功！");
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			request.put("tip", "更新失败！");
			return false;
		}finally {
			itemDAO.getSession().close();
		}
	}
	
	@Override
	public List findAll(){
		String hql = "from Item";
		List list = itemDAO.findByHql(hql);
		return list;
	}
	
	public List findLikeItem(String itemname) {
		String hql = "from Item where name like '%"+itemname+"%'";
		List list = itemDAO.findByHql(hql);
		return list;
	}
}
