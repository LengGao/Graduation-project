package service;

import java.util.Date;
import java.util.List;

import dao.OrderDao;
import enity.TOrder;
import enity.TRoominfo;

public class OrderServiceImpl implements OrderService{
private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
	this.orderDao = orderDao;
}

	@Override
	public boolean saveOrder(TOrder ord) {
		return orderDao.saveOrder(ord);
	}

	@Override
	public boolean updateOrder(TOrder ord) {
		return orderDao.updateOrder(ord);
	}

	@Override
	public boolean deleteOrder(TOrder ord) {
		return orderDao.deleteOrder(ord);
	}

	@Override
	public List<TOrder> findALL() {
		return orderDao.findALL();
	}

	@Override
	public TOrder findOrder(String orderId) {
		return orderDao.findOrder(orderId);
	}

	@Override
	public List<TRoominfo> serviceShowRoom() {
		return orderDao.serviceShowRoom();
	}

	@Override
	public List<TOrder> findhistoryOrder(String checkinfo) {
		return orderDao.findhistoryOrder(checkinfo);
	}

	@Override
	public boolean updateByRoomId(String roomId, String updateinfo) {
		return orderDao.updateByRoomId(roomId, updateinfo);
	}
	
	@Override
	public TOrder findByroomId(String roomId) {
		return orderDao.findByroomId(roomId);
	}

	@Override
	public List<TOrder> AllDay() {
		return orderDao.AllDay();
	}

	@Override
	public List<Object> findByPage(String type, int page) {
		return orderDao.findByPage(type, page);
	}

}
