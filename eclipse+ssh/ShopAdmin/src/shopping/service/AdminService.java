package shopping.service;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

import shopping.dao.AdminDAO;
import shopping.dao.IAdminDAO;
import shopping.po.Admin;

public class AdminService implements IAdminService {
	private Map<String, Object> request, session;
	private IAdminDAO adminDAO = null;

	public void setAdminDAO(IAdminDAO adminDao) {
		this.adminDAO = adminDao;
	}

	public IAdminDAO getAdminDAO() {
		return adminDAO;
	}

	@Override
	public boolean login(Admin admin) {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		request = (Map) ctx.get("request");
		String username = admin.getUsername();
		String password = admin.getPassword();
		String hql = "from Admin as ad where username='" + username + "' and password='" + password + "'";
		List list = adminDAO.findByHql(hql);
		String hql2 = "from Admin as ad where username='" + username + "'";
		List list2 = adminDAO.findByHql(hql2);
		adminDAO.getSession().close();
		if (list.isEmpty()) {
			if(!list2.isEmpty()) {
				request.put("tip","密码错误！");
			}
			return false;
		}
		else {
			session.put("adminUser",username);
			request.put("tip", "登录成功！");
			admin = (Admin)list.get(0);
			request.put("adminUser",admin);
			return true;		
		}
	}
}
