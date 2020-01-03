package service;

import java.util.Date;
import java.util.List;

import enity.TOrder;
import enity.TRoominfo;

public interface OrderService {
	//添加订单
	public boolean saveOrder(TOrder ord);
	//修改订单
	public boolean updateOrder(TOrder ord);
	//删除订单
	public boolean deleteOrder(TOrder ord);
	//查询所有订单
	public List<TOrder> findALL();
	//查询某个订单
	public TOrder findOrder(String orderId);
	//显示所有业务房间
	public List<TRoominfo> serviceShowRoom();
	//分页查询
	public List<Object> findByPage(String type,int page);
	//历史记录查询
	public List<TOrder> findhistoryOrder(String checkinfo);
	//修改房间表的某一条数据以实现顶退房
	public boolean updateByRoomId(String roomId , String updateinfo);
	//结算
	public TOrder findByroomId(String roomId);
	//日营业额记录
	public List<TOrder> AllDay();
}
