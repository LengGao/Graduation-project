package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import enity.TOrder;
import enity.TRoominfo;
import enity.TUser;
import utils.ZhuanHuanUtils;

public class UserDaoImpl  extends BaseDao implements UserDao{

	@Override
	public boolean saveById(TUser user) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.save(user);
		transaction.commit();
		session.close();
		return true;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if(transaction != null){
				transaction = null;
			}
		}
	}

	@Override
	public boolean deleteById(TUser user) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.delete(user);
		transaction.commit();
		session.close();
		return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			if(transaction != null){
				transaction = null;
			}
		}
	}

	@Override
	public boolean updateById(TUser user) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.update(user);
		transaction.commit();
		session.close();
		return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally{
			if(transaction != null){
				transaction = null;
			}
		}
	}

	@Override
	public List<TUser> findALL() {
		Session session = getSession();
		String hql="from TUser";
		Query query = session.createQuery(hql);
		List<TUser> employees = query.list();
		if(employees!=null && employees.size()>0){
				session.close();
				return employees;			
			}
		session.close();
		return null;
	}
	
	@Override
	public List<TUser> findByPage(int page){
		Session session = getSession();
		String hql ="from TUser";
		Query query = session.createQuery(hql);
		query.setFirstResult((page-1)*25);
		query.setMaxResults(25);
		List<TUser> list = query.list();
		if(list.size()>0 && list!= null){
			session.close();
			return list;
		}
		session.close();
		return null;
	}

	@Override
	public TUser findById(String userId) {
		Session session = getSession();
		String hql="from TUser where userId = ?";
		Query query  =  session.createQuery(hql);
		query.setString(0,userId);
		List<TUser> listtype = query.list();
		TUser u = new TUser();
		for(int i=0;i<listtype.size();i++){
			Object  obj =  listtype.get(i);
			u = (TUser) obj;
		}
		if(listtype !=null && listtype.size()>0){
			session.close();
			return u;
		}
		session.close();
		return null;
	}

	@Override
	public boolean isLogin(String userId, String userPassword) {
		Session session = getSession();
		String hql="from TUser where userId = ? and userPassword = ?";
		Query query  = session.createQuery(hql);
		query.setString(0, userId);
		query.setString(1, userPassword);
		if(query.list().size()>0){
			session.close();
			return true;
		}
		session.close();
		return false;
	}
}