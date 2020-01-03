package dao;

import java.util.List;

import enity.TRoominfo;
import enity.TUser;

public interface RoomDao {
	//添加房间
	public boolean saveById(TRoominfo room);
	//删除房间
	public boolean deleteById(TRoominfo room);
	//修改房间
	public boolean updateById(TRoominfo room);
	//查询所有房间,分页
	public List<TRoominfo> findALL();
	public List<TRoominfo> findByPage(int page);
	//查询某个房间
	public TRoominfo findById(String roomId);
}
