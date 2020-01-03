package action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import enity.TConstumer;
import enity.TOrder;
import enity.TRoominfo;
import enity.TUser;
import service.ConstumerService;
import service.OrderService;
import service.RoomService;
import service.UserService;
public class PurchaseOrdersAction extends SuperAction implements ModelDriven<TOrder>{
private TOrder order = new TOrder();
private TConstumer constumer;
private OrderService orderService;
private RoomService roomService;
private UserService userService;
private ConstumerService constumerService;
private UtilsAction ua = new UtilsAction();

	//显示房间
	public String serviceShowRoom(){
		List<TRoominfo> lists = orderService.serviceShowRoom();
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
		List<Object> listtype = orderService.findByPage("TRoominfo", pages);
		List<TRoominfo> list = new ArrayList<TRoominfo>();
		for(int i=0;i<listtype.size();i++){
			TRoominfo n =  new TRoominfo();
			Object  obj =  listtype.get(i);
			n = (TRoominfo) obj;
			list.add(n);
		}
		if(list !=null &&  list.size() > 0){
			session.setAttribute("serviceShowRoom_list", list);
			return "success";
		}else {
			session.setAttribute("serviceShowRoom_list", null);
			return "error";
		}
	}
	
	//订房
	public String readyBookRoom(){
		String roomId = request.getParameter("roomId");
		TRoominfo room = roomService.findById(roomId);
		if(room.getRoomState() == 0 ){
			session.setAttribute("BookRoomInfo", room);
			return "success";
		}else{
			session.setAttribute("BookRoomInfo", null);
			addActionError("该房间已入住，不能重复订房");
		  return "error";
		}
	}
	public String bookRoom(){
		TOrder orders = new TOrder();
		//获取时间
		LocalDateTime localDateTime = LocalDateTime.of(2018,12,21,12,00,00);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
//		String localDateTimes = LocalDateTime.now().format(dtf);  当前时间获取
		String localTime =dtf.format(localDateTime);
		Timestamp ts = Timestamp.valueOf(localDateTime);
		//自动生成id
		int i1 =2;
		int i2 =1;
		String corId_old ="000"+String.valueOf(i1);
		String corId_new = corId_old + String.valueOf(i2);
		if(corId_old == corId_new){
		corId_new = corId_old + String.valueOf(i2);
		}
		corId_old = corId_new;
		//用户是否已经存在
		if(constumerService.findConstumerById(constumer.getCorName()) == null ){
			constumer.setCorId(corId_new);
			constumerService.saveConstumer(constumer);
			constumer.setCorBooktime(ts);
		}else{
			String corId = constumerService.findConstumerById(constumer.getCorName()).getCorId();
			constumer.setCorId(corId);
			constumer.setCorBooktime(ts);
			constumerService.updateConstumer(constumer);
		}
		//房间信息是否为空
		TRoominfo room = (TRoominfo) session.getAttribute("BookRoomInfo");
			if(room != null ){
			room.setRoomState(1);
			room.setRoomBooktime(ts);
			roomService.updateById(room); 
			}else{
			addActionError("房间信息为空");
			return "error";
			}
		//操作员工信息获取
		String userId = (String) session.getAttribute("userId");
		TUser user = userService.findById(userId);
		
		//订单生成
		String ordIdStr ="";
		for(int i=0;i<10;i++){
			ordIdStr = ordIdStr + String.valueOf(new Random().nextInt(10));
		}
		System.out.println(ordIdStr);
		if(orderService.findOrder(ordIdStr) != null){
		ordIdStr = ordIdStr + String.valueOf(new Random().nextInt(10));
		}
		
		orders.setOrdId(ordIdStr);
		orders.setTRoominfo(room);
		orders.setTConstumer(constumer);
		orders.setTUser(user);
		orders.setRommDeposite(room.getRommDeposite());
		Double roomDiscount = Double.parseDouble(request.getParameter("order.discount"));
		orders.setDiscount(roomDiscount);
		//应收取金额  = 价格*折扣 -押金
		Double staySolt = (room.getRoomPrice() * roomDiscount) - room.getRommDeposite();
		orders.setStaySolt(staySolt);
		orders.setRoomBooktime(ts);
		session.setAttribute(room.getRoomId(), orders);
		orderService.saveOrder(orders);
		return "success";
	}
	
	//退房
	public String outRoom(){
		String roomId=request.getParameter("roomId");
		TRoominfo room = roomService.findById(roomId);
		if(room.getRoomState() == 0 ){
			addActionError("空闲状态房间不能退房，请先订房");
		}
		else{
			System.out.println("可以");
		}
		TOrder orders = (TOrder)session.getAttribute(roomId);
		session.setAttribute("outRoomId",orders);
		return "success";
	}
	public String outComplete(){
		LocalDateTime localDateTime = LocalDateTime.of(2018,12,22,12,00,00);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
//		String localDateTimes = LocalDateTime.now().format(dtf);  当前时间获取
		String localTime =dtf.format(localDateTime);
		Timestamp ts = Timestamp.valueOf(localDateTime);
		
		//从前台返回过来也是上个方法中的
		 
		TOrder orders  = new TOrder();
		orders = (TOrder) session.getAttribute("outRoomId");
		TConstumer constumers = orders.getTConstumer();
		constumers.setCorOuttime(ts);
		TRoominfo room = orders.getTRoominfo();
		room.setRoomState(0);
		room.setRoomOuttime(ts);
		
		Double CollectedMoney = Double.parseDouble(request.getParameter("order.collectedMoney"));
		Double ExpenditureMoney = Double.parseDouble(request.getParameter("order.expenditureMoney"));
		orders.setCollectedMoney(CollectedMoney);
		orders.setExpenditureMoney(ExpenditureMoney);
		orders.setRoomOuttime(ts);
		orderService.updateOrder(orders);
		roomService.updateById(room);
		constumerService.updateConstumer(constumers);
		
		room.setRoomBooktime(null);
		room.setRoomOuttime(null);
		roomService.updateById(room);
		return "success";
	}
	
	//历史记录查询
	public String serviceCheck(){
		String Constumerinfo = request.getParameter("checkinfo");
		List<TOrder> list = orderService.findhistoryOrder(Constumerinfo);
//		List<TConstumer> list = (List<TConstumer>) constumerService.findConstumer(Constumerinfo);
		if(list.size()>0 && list !=null){
			session.setAttribute("check_list", list);
			return "success";
		}else{
			session.setAttribute("check_list", null);
			addActionError("为找到相关记录");
			return "error";
		}
		
	}
	//单笔账单记录
	public String serviceStroke(){
		List<TOrder> order_copy = orderService.findALL();;
		int pages = 0;
		ActionContext context = ActionContext.getContext();
		Object value = context.get("page");
		if(value == null){
			pages = 1;
		}else{
			String pageStr = (String)value;
			pages = Integer.valueOf(pageStr.trim());
		}
		ua.pageShow(pages, order_copy.size());
		List<Object> listtype = orderService.findByPage("TOrderStroke", pages);
		List<TOrder> list = new ArrayList<TOrder>();
		for(int i=0;i<listtype.size();i++){
			TOrder n =  new TOrder();
			Object  obj =  listtype.get(i);
			n = (TOrder) obj;
			list.add(n);
		}
		if(list.size()>0 && list != null){
			System.out.println("z");
			session.setAttribute("order_copy",list);
			return "success";
		}else{
			session.setAttribute("order_copy", null);
			addActionError("暂未有记录");
			return "error";
		}
	}	
	//日营业额记录
	public String serviceAllday(){
		//单笔应收取金额 * 订单   计算账单日期
//		//获取当前时间日期
		LocalDate date = LocalDate.of(2018,12,20);
//		LocalDate date = LocalDate.now();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List<TOrder> lists=orderService.AllDay();
		
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
		List<Object> listtype = orderService.findByPage("TOrderAllday", pages);
		List<TOrder> list = new ArrayList<TOrder>();
		for(int i=0;i<listtype.size();i++){
			TOrder n =  new TOrder();
			Object  obj =  listtype.get(i);
			n = (TOrder) obj;
			list.add(n);
		}
		
		List<TOrder> allDay=null;
		double depositeAll = 0;
		double staySoltAll = 0;
		double collectedMoneyAll = 0;
		double expenditureMoneyAll =0;
		for(TOrder o : list){
			String dateStr = date.format(DateTimeFormatter.ISO_LOCAL_DATE).trim();
			String sqldate = sdf.format(o.getRoomBooktime()).trim();
			if(dateStr.equals(sqldate)){
				 allDay = list;
				 depositeAll = depositeAll += o.getRommDeposite();
				 staySoltAll = staySoltAll += o.getStaySolt();
				 collectedMoneyAll = collectedMoneyAll += o.getCollectedMoney();
				 expenditureMoneyAll = expenditureMoneyAll += o.getExpenditureMoney();
			}
			else{
				System.out.println("不等于");
			}
		}
		session.setAttribute("allDay", allDay);
		session.setAttribute("depositeAll", depositeAll);
		session.setAttribute("staySoltAll", staySoltAll);
		session.setAttribute("collectedMoneyAll", collectedMoneyAll);
		session.setAttribute("expenditureMoneyAll", expenditureMoneyAll);	
		return "success";
	}
	
	
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	public void setRoomService(RoomService roomService) {
		this.roomService = roomService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setConstumerService(ConstumerService constumerService) {
		this.constumerService = constumerService;
	}
	
	
	public TConstumer getConstumer() {
		return constumer;
	}
	
	public void setConstumer(TConstumer constumer) {
		this.constumer = constumer;
	}

	@Override
	public TOrder getModel() {
		return this.order;
	}
	
}
