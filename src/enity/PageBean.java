package enity;

import java.util.List;

public class PageBean {
    private int page;//当前页
    private int pagesize;//页面数据条数
    private int indexpage=1;//首页
    private int endpage;//尾页
    private int count;//总数据条数
    private int pagenumber;//总页面数
    
	public PageBean() {
		super();
	}
	public PageBean(int page, int pagesize, int indexpage, int endpage, int count, int pagenumber) {
		super();
		this.page = page;
		this.pagesize = pagesize;
		this.indexpage = indexpage;
		this.endpage = endpage;
		this.count = count;
		this.pagenumber = pagenumber;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getIndexpage() {
		return indexpage;
	}
	public void setIndexpage(int indexpage) {
		this.indexpage = indexpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = this.getPagenumber();
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(int pagenumber) {
		if( this.count % this.pagesize !=0){
			this.pagenumber = count / pagesize +1 ;			
		}else{
			this.pagenumber = count / pagesize ;
		}
	}
}
