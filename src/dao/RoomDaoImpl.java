package dao;

import java.util.ArrayList;
import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import enity.TRoominfo;
import enity.TUser;
public class RoomDaoImpl extends BaseDao implements RoomDao{
	
	@Override
	public boolean saveById(TRoominfo room) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.save(room);
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
	public boolean deleteById(TRoominfo room) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.delete(room);
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
	public boolean updateById(TRoominfo room) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.update(room);
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
	public List<TRoominfo> findALL() {
		Session session = getSession();
		String hql="from TRoominfo";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(20);
		List<TRoominfo> rooms = query.list();
		if(rooms!=null){
			if(rooms.size()>0){
				session.close();
				return rooms;			
			}
		}
		session.close();
		return null;
	}
	
	@Override
	public List<TRoominfo> findByPage(int page){
		Session session = getSession();
		String hql ="from TRoominfo";
		Query query = session.createQuery(hql);
		query.setFirstResult((page-1)*25);
		query.setMaxResults(25);
		List<TRoominfo> list = query.list();
		if(list.size()>0 && list!= null){
			session.close();
			return list;
		}
		session.close();
		return null;
	}

	@Override
	public TRoominfo findById(String roomId) {
		Session session = getSession();
		String hql="from TRoominfo where roomId = ?";
		Query query  = session.createQuery(hql);
		query.setString(0,roomId);
		TRoominfo r = new TRoominfo();
		List<Object> listtype = query.list();
		for(int i = 0; i<listtype.size();i++){
			Object obj = listtype.get(i);
			r = (TRoominfo) obj;
		}
		if(listtype != null&&listtype.size()>0){
			session.close();
			return r;
		}
		session.close();
		return null;
	}

}
