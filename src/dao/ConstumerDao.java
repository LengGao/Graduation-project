package dao;

import java.util.List;

import enity.TConstumer;

/**
 * 
 * @author Administrator
 *	�ͻ��ӿ�
 */
public interface ConstumerDao {
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
