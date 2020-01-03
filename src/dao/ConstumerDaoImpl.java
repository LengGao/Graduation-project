package dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import enity.TConstumer;

public class ConstumerDaoImpl extends BaseDao implements ConstumerDao{

	@Override
	public boolean saveConstumer(TConstumer cster) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.save(cster);
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
	public boolean updateConstumer(TConstumer cster) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.update(cster);
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
	public boolean deleteConstumer(TConstumer cster) {
		return false;
	}

	@Override
	public List<TConstumer> findALL() {
		return null;
	}

	@Override
	public List<TConstumer> findConstumer(String Constumerinfo) {
		Session session = getSession();
		String hql ="from TConstumer where corName =? or corIdcard = ?";
		Query query = session.createQuery(hql);
		query.setString(0,Constumerinfo);
		query.setString(1,Constumerinfo);
		List<TConstumer> list = query.list();
		if(list.size()>0 && list != null){
			session.close();
			return list;
		}
		session.close();
		return null;
	}
	@Override
	public TConstumer findConstumerById(String corName){
		Session session = getSession();
		String hql ="from TConstumer where corName = ?";
		Query query = session.createQuery(hql);
		query.setString(0,corName);
		List<TConstumer> list = query.list();
		if( list.size()>0 && list != null){
		TConstumer cor = list.get(0);
			session.close();
			return cor;
		}
		session.close();
		return null;
	}
}
