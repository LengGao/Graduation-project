package service;

import java.util.List;

import enity.TUser;

public interface UserService {
	//添加用户
	public boolean saveById(TUser user);
	//删除用户
	public boolean deleteById(TUser user);
	//修改用户
	public boolean updateById(TUser user);
	//查询所有用户,分页
	public List<TUser> findALL();
	public List<TUser> findByPage(int page);
	//查询某个用户
	public TUser findById(String userId);
	//检测用户是否登录
	public boolean isLogin(String userId,String userPassword);
}
