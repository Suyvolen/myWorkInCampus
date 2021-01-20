package shopping.service;
import java.util.List;

import shopping.po.Customer;
import shopping.po.Feedback;

public interface ICustomerService {
	boolean save(Customer instance);//保存用户
	boolean login(Customer instance);//用户登录
	boolean delete(Customer instance);//删除用户
	public boolean feed(Feedback instance);//用户进行反馈
	public boolean deleteFeedback(Feedback instance);//删除一条反馈信息
	boolean update(Customer isntance);//更新用户信息
	public List findAll();//找到所有用户
	public List findByAccount(Customer customer);//根据用户名查找用户
	public List findLikeName(String account);//根据用户名模糊查找用户
	public List getFeedbacks();//得到所有反馈信息
	public List getCart();//获取当前登录者的购物车
}
