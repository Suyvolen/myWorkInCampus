package shopping.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import shopping.dao.ICustomerDAO;
import shopping.po.Customer;
import shopping.po.Feedback;
import shopping.po.ShoppingCart;
public class CustomerService implements ICustomerService {
	private ICustomerDAO customerDAO = null;
	private Map<String, Object> request, session;

	public CustomerService() {	};
	
	public ICustomerDAO getCustomerDAO() {
		return customerDAO;
	}

	public void setCustomerDAO(ICustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	public boolean save(Customer instance) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		Transaction tran = null;
		try {
			tran = customerDAO.getSession().beginTransaction();
			customerDAO.save(instance);
			tran.commit();
			session.put("user", instance.getAccount());
			request.put("tip", "註冊成功！");
			request.put("loginUser", instance);
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			request.put("tip", "注册失败！");
			return false;
		}finally {
			customerDAO.getSession().close();
		}
	}

	public boolean delete(Customer instance) {
		ActionContext ctx = ActionContext.getContext();
		request = (Map) ctx.get("request");
		Transaction tran = null;
		try {
			tran = customerDAO.getSession().beginTransaction();
			customerDAO.delete(instance);
			tran.commit();
			request.put("tip", "删除成功！");
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			request.put("tip", "删除失败！");
			return false;
		}finally {
			customerDAO.getSession().close();
		}
	}
	public boolean feed(Feedback instance) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		Transaction tran = null;
		try {
			tran = customerDAO.getSession().beginTransaction();
			customerDAO.feed(instance);
			tran.commit();
			session.put("feedback", instance.getName());
			request.put("tip", "反馈成功！");
			request.put("feedback", instance);
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			request.put("tip", "反馈失败！");
			return false;
		}finally {
			customerDAO.getSession().close();
		}
	}
	public boolean deleteFeedback(Feedback instance) {
		ActionContext ctx = ActionContext.getContext();
		Transaction tran = null;
		try {
			tran = customerDAO.getSession().beginTransaction();
			customerDAO.delete(instance);
			tran.commit();
			ctx.put("tip", "删除成功！");
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			ctx.put("tip", "删除失败！");
			return false;
		}finally {
			customerDAO.getSession().close();
		}
	}

	public boolean update(Customer instance) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		Transaction tran = null;
		try {
			tran = customerDAO.getSession().beginTransaction();
			customerDAO.update(instance);
			tran.commit();
			session.put("user", instance.getAccount());
			request.put("tip", "更新成功！");
			return true;
		}catch(Exception re) {
			if (tran != null)
				tran.rollback();
			request.put("tip", "更新失败！");
			return false;
		}finally {
			customerDAO.getSession().close();
		}
	}

	public boolean login(Customer instance) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		String account = instance.getAccount();
		String password = instance.getPassword();
		String hql = "from customer as user where account='"+account+"' and"
				+ "password='"+password+"'";
		List list = customerDAO.findByHql(hql);
		if (list.isEmpty())
		{
			customerDAO.getSession().close();
			return false;
		}
		else {
			String hql1="select customerID from customer where account='"+account+"' and"
					+ "password='"+password+"'";
			List list1=customerDAO.findByHql(hql1);
			int customerID=(int) list1.get(0);
			session.put("customerID",customerID);
			session.put("customerAccount", account);
			customerDAO.getSession().close();
			return true;
		}
	}
	public List getCart() {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		ArrayList<ShoppingCart> array = new ArrayList<>();
		int customerID=(int) session.get("loginUserID");
		String hql = "from shoppingCart where customerID='"+customerID+"' ";
		List list = customerDAO.findByHql(hql);
		return list;
	}
	
	public List findAll(){
		ArrayList<Customer> array = new ArrayList<>();
		String hql = "from Customer";
		List list = customerDAO.findByHql(hql);
		return list;
	}
	
	public List findByAccount(Customer customer) {
		String account = customer.getAccount();
		List list =null;
		String hql = "from Customer where account='"+account+"'";
		list=customerDAO.findByHql(hql);
		return list;
	}
	
	public List findLikeName(String account) {
		List list = null;
		String hql = "from Customer where account like'%"+account+"%'";
		list=customerDAO.findByHql(hql);
		return list;
	}
	
	public List getFeedbacks() {
		List list = null;
		String hql = "from Feedback";
		list=customerDAO.findByHql(hql);
		return list;
	}
}
