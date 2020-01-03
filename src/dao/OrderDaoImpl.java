package dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jgroups.tests.bla;

import enity.TConstumer;
import enity.TOrder;
import enity.TRoominfo;
import enity.TUser;

public class OrderDaoImpl extends BaseDao implements OrderDao{

	@Override
	public boolean saveOrder(TOrder ord) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.save(ord);
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
	public boolean updateOrder(TOrder ord) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		session.update(ord);
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
	public boolean deleteOrder(TOrder ord) {
		return false;
	}

	@Override
	public List<TOrder> findALL() {
		Session session = getSession();
		String hql ="from TOrder";
		Query query = session.createQuery(hql);
		List<TOrder> list = query.list();
		if(list.size()>0 && list!= null){
			System.out.println("not null");
			session.close();
			return list;
		}
		session.close();
		return null;
	}
	public List<TOrder> findByPage(int page){
		Session session = getSession();
		String hql ="from TOrder";
		Query query = session.createQuery(hql);
		query.setFirstResult((page-1)*25);
		query.setMaxResults(25);
		List<TOrder> list = query.list();
		if(list.size()>0 && list!= null){
			session.close();
			return list;
		}
		session.close();
		return null;
	}

	@Override
	public TOrder findOrder(String orderId) {
		Session session = getSession();
		try{
		String hql = "from TOrder where ordId = ?";
		Query query = session.createQuery(hql);
		query.setString(0, orderId);
		List<Object> listtype = query.list();
		TOrder o = new TOrder();
		for(int i =0;i<listtype.size();i++){
			Object obj = listtype.get(i);
			o = (TOrder) obj;
		}
		if(listtype.size()>0&&listtype != null){
			session.close();
			return  o;
		}
		}catch (Exception e) {
			session.close();
			return null;
		}
		session.close();
		return null;
	}
	
	@Override
	public List<TRoominfo> serviceShowRoom() {
		Session session = getSession();
		//做一空闲状态优先显示的查询
		String hql="from TRoominfo order by (roomState) asc";
		Query query = session.createQuery(hql);
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
//订退房
	@Override
	public boolean updateByRoomId(String roomId,String updateinfo) {
		Transaction transaction = null;
		try{
		Session session = getSession();
		transaction = session.beginTransaction();
		String hql ="update TRoominfo set "+updateinfo+"where roomId = ?";
		Query query = session.createQuery(hql);
		query.setString(0, roomId);
		int exeresult = query.executeUpdate();
		transaction.commit();
		if(exeresult > 0 ){
			return true;
		}
			session.close();
			return false;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			if(transaction != null){
				transaction = null;
			}
		}
	}
//历史记录查询
	@Override
	public List<TOrder> findhistoryOrder(String checkinfo) {
		Session session = getSession();
		String hql ="from TOrder o where o.TConstumer.corId = all(select corId from TConstumer where corName = ? or corIdcard = ?)";
		Query query = session.createQuery(hql);
		query.setString(0,checkinfo);
		query.setString(1,checkinfo);
		List<TOrder> list = query.list();
		return list;
	}
//日营业额记录
	@Override
	public List<TOrder> AllDay() {
		Session session = getSession();
		String hql ="from TOrder order by (roomBooktime) asc";
		Query query = session.createQuery(hql);
		List<TOrder> list =query.list();
		if(list.size()>0 && list !=null){
			session.close();
			return list;
		}
		session.close();
		return null ;
	}
//结算
	@Override
	public TOrder findByroomId(String roomId) {
		Session session = getSession();
		String hql= "from TOrder o where o.TRoominfo = (select * from TRoominfo r where r.roomId=?)";
		Query query = session.createQuery(hql);
		query.setString(0,roomId);
		return (TOrder) query.list();
	}

	@Override
	public List<Object> findByPage(String type, int page) {
		Session  session = getSession();
		String hql = new String();
		switch (type.trim()) {
		case ("TRoominfo"): 
			hql ="from TRoominfo order by (roomState) asc";
			break;
		case ("TOrderStroke"):
			hql ="from TOrder";
			break;
		case ("TOrderAllday"):
			hql="from TOrder order by (roomBooktime) asc";
			break;
		default:
			System.out.println("not found");
			break;
		}
		Query query = session.createQuery(hql);
		query.setFirstResult((page-1)*25);
		query.setMaxResults(25);
		List<Object> list  = query.list();
		return list;
	}
	
}
