package service;

import java.util.List;

import enity.TConstumer;

public interface ConstumerService {
	//��ӿͻ�
	public boolean saveConstumer(TConstumer cster);
	//�޸Ŀͻ�
	public boolean updateConstumer(TConstumer cster);
	//ɾ���ͻ�
	public boolean deleteConstumer(TConstumer cster);
	//��ѯ���пͻ�
	public List<TConstumer> findALL();
	//��ѯĳ���ͻ�
	public List<TConstumer> findConstumer(String Constumerinfo);
	//����ID��ͻ�
	public TConstumer findConstumerById(String corName);
}
