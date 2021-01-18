package shopping.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import shopping.dao.ICustomerDAO;
import shopping.po.Customer;

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
			request.put("loginUser", instance);
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
		customerDAO.getSession().close();
		if (list.isEmpty())
			return false;
		else {
			session.put("user", account);
			request.put("tip", "登录成功！");
			instance = (Customer) list.get(0);
			request.put("loginUser", instance);
			return true;
		}
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
}
