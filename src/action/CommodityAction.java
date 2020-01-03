package action;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.metamodel.SetAttribute;

import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import enity.TRoominfo;
import enity.TUser;
import service.RoomService;
public class CommodityAction extends SuperAction implements ModelDriven<TRoominfo>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TRoominfo room = new TRoominfo();
	private RoomService roomService;
	private UtilsAction ua = new UtilsAction();
	/*
	 * ���ȫ����Ʒ��Ϣ
	 */
	public String queryCommodity()
	{
		List<TRoominfo> lists = roomService.findALL();
		
		int pages = 0;
		ActionContext context = ActionContext.getContext();
		Object value = context.get("page");
		if(value == null){
			pages = 1;
		}else{
			String pageStr = (String)value;
			pages = Integer.valueOf(pageStr.trim());
		}
		ua.pageShow(pages, lists.size());
		List<TRoominfo> list = roomService.findByPage(pages);
		
		if( list != null && list.size() != 0 ){
			session.setAttribute("commodity_list", list);
		}else{
			session.setAttribute("commodity_list", null);
		}
		return "commodity_information";
	}
	/*
	 * ����Ų�ѯ
	 */
	public String queryCommodityById() throws Exception{
		try{
		String info = request.getParameter("commodityId");
		TRoominfo room_find = roomService.findById(info);
		if(room_find != null){
			session.setAttribute("queryById_list", room_find);
			return "queryById_success";			
		}
		}catch (Exception e) {
			session.setAttribute("queryById_list", null);
			addActionError("δ�ҵ�����");
			return "queryById_error";
		}
		session.setAttribute("queryById_list", null);
		addActionError("δ�ҵ�����");
		return "queryById_error";
	}
//	/*
//	*	��ӷ���
//	*/	
	public String addCommodity() throws Exception{	
				roomService.saveById(getModel());
				this.room = null;
				boolean b = true;
				if(b == false){
					addActionError("���ʧ��");
					return "saveCommdity_error";
				}
				return "addCommodity_success";					
}
	/*
	 * �h������
	 */
	public String deleteCommodity()
	{
		String roomId = request.getParameter("roomId");
		if(roomService.findById(roomId) != null){
			roomService.deleteById(room);
			return "delete_success";
		}
		addActionError("ɾ��ʧ��");
		return "delrete_error";
	}
	
	/*
	 * �޸�
	 */
	public String modifyCommodity(){
		boolean b = roomService.updateById(getModel());
		if(b == false){
			addActionError("����ʧ��");
			return "error";
		}
		return "modify_success";
	}
	public String saveCommodity_info()
	{
		String roomId = request.getParameter("roomId");
		if(roomService.findById(roomId) != null){
			room = roomService.findById(roomId);
			session.setAttribute("modify_room", room);
			return "saveCommodity_success";
		}
		addActionError("�����޸Ĳ����ڵļ�¼");
		return "saveCommdity_error";
	}
	
	
	public TRoominfo getModel() {
		return this.room;
	}
	
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

}
