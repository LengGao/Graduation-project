package action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import enity.PageBean;

public class UtilsAction extends SuperAction{
	private PageBean pageBean = new PageBean();
	
	public void pageShow(int page,int count){
		pageBean.setPage(page);
		pageBean.setPagesize(25);
		pageBean.setCount(count);
		pageBean.setPagenumber(1);
		ActionContext actionContext = ActionContext.getContext();
		actionContext.put("page", pageBean.getPage());
		System.out.println(pageBean.getPage());
		actionContext.put("pagesize", pageBean.getPagesize());
		actionContext.put("endpage", pageBean.getPagenumber());
	}
}