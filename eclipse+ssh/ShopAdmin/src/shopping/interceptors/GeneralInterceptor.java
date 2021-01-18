package shopping.interceptors;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class GeneralInterceptor extends AbstractInterceptor{
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("GeneralInterceptor executed!");
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		String adminUser = (String) session.get("adminUser");
		if (adminUser != null) {
			return invocation.invoke();
		} else {
			ctx.put("tip", "您还没有登录，请输入用户名和密码登录系统");
			/*
			 * ctx.getApplication().put("", "");//application 作用域 ctx.getSession().put("",
			 * "");//session 作用域 ctx.put("", ""); //request 作用域
			 */
			return Action.LOGIN;
		}
	}
}
