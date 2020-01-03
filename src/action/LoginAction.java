package action;


import service.UserService;

public class LoginAction extends SuperAction{
private String userId;
private String userPassword;
private UserService userService;
	
	
	public String execute(){
		if(userService.isLogin(userId, userPassword)){
			if(userService.findById(userId).getUserIsManager() == 0){
				session.setAttribute("userId", userId);
				return "login_service";
			}
			session.setAttribute("userId", userId);
			return "login_success";
		}
		session.setAttribute("userId", null);
		addActionError("登录失败,您输入的账号或密码有误，请确认无误后重新登录");
		return "login_error";
	}

public String getUserId() {
	return userId;
}


public void setUserId(String userId) {
	this.userId = userId;
}


public String getUserPassword() {
	return userPassword;
}


public void setUserPassword(String userPassword) {
	this.userPassword = userPassword;
}


public void setUserService(UserService userService) {
	this.userService = userService;
}
}