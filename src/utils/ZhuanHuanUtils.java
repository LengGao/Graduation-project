package utils;

import java.util.ArrayList;
import java.util.List;

public class ZhuanHuanUtils {
	public ArrayList<Object> zhuan(List<Object> listtype,Object obj){
		String typeNmae = obj.getClass().getTypeName();
		System.out.println(typeNmae);
		ArrayList<Object> lists = new ArrayList<Object>();
		for(int i=0;i<listtype.size();i++){
			Object obj_list =  listtype.get(i);
			obj = obj_list;
			lists.add(obj);
		}
		return lists ;
	}
}
