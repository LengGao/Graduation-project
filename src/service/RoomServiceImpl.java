package service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.RoomDao;
import dao.RoomDaoImpl;
import enity.TRoominfo;
import enity.TUser;

public class RoomServiceImpl implements RoomService{
	
	private RoomDao roomDao;
	
	public void setRoomDao(RoomDao roomDao) {
		this.roomDao = roomDao;
	}

	@Override
	public boolean saveById(TRoominfo room) {
		return roomDao.saveById(room);
	}

	@Override
	public boolean deleteById(TRoominfo room) {
		return roomDao.deleteById(room);
	}

	@Override
	public boolean updateById(TRoominfo room) {
		return roomDao.updateById(room);
	}

	@Override
	public List<TRoominfo> findALL() {
		return roomDao.findALL();
	}

	@Override
	public TRoominfo findById(String roomId) {
		return roomDao.findById(roomId);
	}

	@Override
	public List<TRoominfo> findByPage(int page) {
		return roomDao.findByPage(page);
	}

}
