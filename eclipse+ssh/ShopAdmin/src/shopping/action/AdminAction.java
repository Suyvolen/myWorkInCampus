package shopping.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import shopping.po.Admin;
import shopping.service.IAdminService;

public class AdminAction extends ActionSupport{
	private Admin adminUser;
	private IAdminService adminService = null;
	private Map session;

	public Admin getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(Admin adminUser) {
		this.adminUser = adminUser;
	}
	
	public IAdminService getAdminService() {
		return adminService;
	}

	public void setAdminService(IAdminService adminService) {
		this.adminService = adminService;
	}
	
	public String login() {
		ActionContext ctx = ActionContext.getContext();
		session = (Map) ctx.getSession();
		if(adminService.login(adminUser)) {
			session.put("adminUser",adminUser.getUsername());
			return "loginsuccess";
		}
		return "loginfail";
	}
	
	//进行管理员登录的验证
	@Override
	public void validate() {
		if(adminUser==null ||"".equals(adminUser.getUsername())) {
			this.addFieldError("adminusernameMsg", "用户名不能为空!");
		}
	}
}
