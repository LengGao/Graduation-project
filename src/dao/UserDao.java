package dao;

import java.util.List;

import enity.TOrder;
import enity.TUser;

public interface UserDao {
		//�����û�
		public boolean saveById(TUser user);
		//ɾ���û�
		public boolean deleteById(TUser user);
		//�޸��û�
		public boolean updateById(TUser user);
		//��ѯ�����û�,��ҳ
		public List<TUser> findALL();
		public List<TUser> findByPage(int page);
		//��ѯĳ���û�
		public TUser findById(String userId);
		//����û��Ƿ��¼
		public boolean isLogin(String userId,String userPassword);
}