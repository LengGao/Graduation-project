package service;

import java.util.List;

import enity.TRoominfo;

public interface RoomService {
	//��ӷ���
	public boolean saveById(TRoominfo room);
	//ɾ������
	public boolean deleteById(TRoominfo room);
	//�޸ķ���
	public boolean updateById(TRoominfo room);
	//��ѯ���з���,��ҳ
	public List<TRoominfo> findALL();
	public List<TRoominfo> findByPage(int page);
	//��ѯĳ������
	public TRoominfo findById(String roomId);
}
