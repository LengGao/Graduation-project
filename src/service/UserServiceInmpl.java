package service;

import java.util.List;

import dao.UserDao;
import enity.TUser;

public class UserServiceInmpl implements UserService{
private UserDao userDao;

	public void setUserDao(UserDao userDao) {
	this.userDao = userDao;
}

	@Override
	public boolean saveById(TUser user) {
		return userDao.saveById(user);
	}

	@Override
	public boolean deleteById(TUser user) {
		return userDao.deleteById(user);
	}

	@Override
	public boolean updateById(TUser user) {
		return userDao.updateById(user);
	}

	@Override
	public List<TUser> findALL() {
		return userDao.findALL();
	}

	@Override
	public TUser findById(String userId) {
		return userDao.findById(userId);
	}

	@Override
	public boolean isLogin(String userId, String userPassword) {
		return userDao.isLogin(userId, userPassword);
	}

	@Override
	public List<TUser> findByPage(int page) {
		return userDao.findByPage(page);
	}
	
}
