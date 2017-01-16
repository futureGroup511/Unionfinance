package com.future.utils;

import java.util.List;

public class Page {

	private Integer currentPage; //当前页
	private Integer pageSize;// 显示记录
	private Integer recordCount; //查询总记录数
	private List<?> recordlist;    //查询出来所需要的数据
	
	private Integer endPageIndex; //尾页
	private Integer beginPageIndex; //首页
	private Integer pageCount; //显示的页数
	// 开始显示的最大条数
	private Integer beginRecordIndex;

	public Page(Integer currentPage, Integer pageSize, Integer recordCount, List recordlist) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		this.recordlist = recordlist;
		//计算其他参数的函数
		calculatePageEndAndBeginIndex();
	}

	public static Page newInstance(){
		return new Page();
	}
	public Page() {
		super();
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(Integer recordCount) {
		this.recordCount = recordCount;
	}

	public List getRecordlist() {
		return recordlist;
	}

	public void setRecordlist(List recordlist) {
		this.recordlist = recordlist;
	}

	public Integer getEndPageIndex() {
		return endPageIndex;
	}

	public void setEndPageIndex(Integer endPageIndex) {
		this.endPageIndex = endPageIndex;
	}

	public Integer getBeginPageIndex() {
		return beginPageIndex;
	}

	public void setBeginPageIndex(Integer beginPageIndex) {
		this.beginPageIndex = beginPageIndex;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	@Override
	public String toString() {
		return "Page [endPageIndex=" + endPageIndex + ", beginPageIndex=" + beginPageIndex + ", pageCount="
				+ pageCount + "]";
	}
	
	/**
	 * 得到默认值当前页为第一页，一页显示十条的page
	 * @return
	 */
	public static Page getDefaultInstace(){
		Page page=Page.newInstance();
		page.setPageSize(8);
		return page;
	}
	
	public void calculatePageEndAndBeginIndex(){
		pageCount=(recordCount+pageSize-1)/pageSize;
		//如果总页数小于10
		if(pageCount<10){
			beginPageIndex=1;
			endPageIndex =pageCount;
		}else{
			beginPageIndex=currentPage-4;
			endPageIndex=currentPage+5;
			if(beginPageIndex<1){
				beginPageIndex=1;
				endPageIndex=10;
			}
			if(endPageIndex>pageCount){
				endPageIndex=pageCount;
				beginPageIndex=pageCount-9;
			}
		}
		beginRecordIndex = (currentPage-1)*pageSize;

	}
	
	
}
