package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserDao;
import dao.UserDaoImpl;

@SuppressWarnings("serial")
public class CheckName extends ActionSupport{
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		String name = request.getParameter("name");
		String msg = "";
		UserDao dao = new UserDaoImpl();
//		if( dao.ValidateName(name) ){
//			response.getWriter().print("exists");
//		}else {
//			msg = "该用户名可以注册";
//			response.getWriter().print(msg);
//		}
		return null;
	}
}
	
