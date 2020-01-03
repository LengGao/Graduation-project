package action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.dojo.components.Tree;
import org.hibernate.ejb.criteria.predicate.IsEmptyPredicate;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import enity.PageBean;
import enity.TRoominfo;
import enity.TUser;
import service.UserService;


public class EmployeeAction extends SuperAction implements ModelDriven<TUser>{

	private static final long serialVersionUID = 1L;
	private TUser employee = new TUser();
	private UserService userService;
	private UtilsAction ua = new UtilsAction();
	
	//显示所有员工
	public String query()
	{
		List<TUser> lists = userService.findALL();
		int pages = 0;
		String value = request.getParameter("page");
		System.out.println(value);
		if(value == null){
			pages = 1;
		}else{
			String pageStr = (String)value;
			pages = Integer.valueOf(pageStr.trim());
//			pages = value;
		}
		ua.pageShow(pages, lists.size());
		List<TUser> list = userService.findByPage(pages);
		
		if( list != null && list.size() > 0){
			session.setAttribute("employee_list", list);
		}else{
			session.setAttribute("employee_list", null);
		}
		return "query_information";
	}
	/*
	 * 修改员工
	 */
	public String modifyEmployee(){
		boolean b = userService.updateById(getModel());
		if(b){
		return "modify_success";
		}
		addActionError("更新失败");
		return "modify_error";
	}
	public String saveUpdate(){
		String userId = request.getParameter("userId");
		if(userService.findById(userId) != null){
			employee = userService.findById(userId);
			session.setAttribute("modify_employee",employee);
			return "modify_Employee";
		}
		addActionError("不能修改不存在的记录");		
		return "modify_error";
	}
	
	/*
	 * 删除
	 */
	public String deleteEmployee()
	{
		String userId = request.getParameter("userId");
		if(userService.findById(userId) != null){
			userService.deleteById(employee);
			return "delete_success";
		}
		addActionError("删除失败");
		return "delete_error";
	}
	
	/*
	 * 添加员工
	 */
	public String addEmployee(){	
		 userService.saveById(getModel());
		 boolean u = true;
			if(u == false){
				addActionError("添加失败");
				return "add_error";
		}
			return "addEmployee_success";
	}
	
	//查找员工
	public String queryEmployeeById(){		
		try{
			String info = request.getParameter("employeeId");
			TUser u = userService.findById(info);
			if(!u.equals(null)){
				session.setAttribute("employeeInfo", u);
				return "queryById_success";
			}
			}catch (Exception e) {
				addActionError("未找到员工");
				System.out.println("asd");
				session.setAttribute("employeeInfo", null);
				e.printStackTrace();
				return "queryById_error";
			}
			session.setAttribute("employeeInfo", null);
			return "queryById_error";
	}

	public TUser getModel() {
		return this.employee;
	}
public void setUserService(UserService userService) {
	this.userService = userService;
}
}