package service;

import java.util.List;

import dao.ConstumerDao;
import enity.TConstumer;

public class ConstumerServiceImpl implements ConstumerService{
private ConstumerDao constumerDao;

	public void setConstumerDao(ConstumerDao constumerDao) {
	this.constumerDao = constumerDao;
}

	@Override
	public boolean saveConstumer(TConstumer cster) {
		return constumerDao.saveConstumer(cster);
	}

	@Override
	public boolean updateConstumer(TConstumer cster) {
		return constumerDao.updateConstumer(cster);
	}

	@Override
	public boolean deleteConstumer(TConstumer cster) {
		return constumerDao.deleteConstumer(cster);
	}

	@Override
	public List<TConstumer> findALL() {
		return constumerDao.findALL();
	}

	@Override
	public List<TConstumer> findConstumer(String Constumerinfo) {
		return constumerDao.findConstumer(Constumerinfo);
	}

	@Override
	public TConstumer findConstumerById(String corName) {
		return constumerDao.findConstumerById(corName);
	}

}
