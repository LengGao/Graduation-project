package service;

import java.util.List;

import enity.TConstumer;

public interface ConstumerService {
	//添加客户
	public boolean saveConstumer(TConstumer cster);
	//修改客户
	public boolean updateConstumer(TConstumer cster);
	//删除客户
	public boolean deleteConstumer(TConstumer cster);
	//查询所有客户
	public List<TConstumer> findALL();
	//查询某个客户
	public List<TConstumer> findConstumer(String Constumerinfo);
	//根据ID查客户
	public TConstumer findConstumerById(String corName);
}
