package service;

import java.util.Date;
import java.util.List;

import enity.TOrder;
import enity.TRoominfo;

public interface OrderService {
	//��Ӷ���
	public boolean saveOrder(TOrder ord);
	//�޸Ķ���
	public boolean updateOrder(TOrder ord);
	//ɾ������
	public boolean deleteOrder(TOrder ord);
	//��ѯ���ж���
	public List<TOrder> findALL();
	//��ѯĳ������
	public TOrder findOrder(String orderId);
	//��ʾ����ҵ�񷿼�
	public List<TRoominfo> serviceShowRoom();
	//��ҳ��ѯ
	public List<Object> findByPage(String type,int page);
	//��ʷ��¼��ѯ
	public List<TOrder> findhistoryOrder(String checkinfo);
	//�޸ķ�����ĳһ��������ʵ�ֶ��˷�
	public boolean updateByRoomId(String roomId , String updateinfo);
	//����
	public TOrder findByroomId(String roomId);
	//��Ӫҵ���¼
	public List<TOrder> AllDay();
}
