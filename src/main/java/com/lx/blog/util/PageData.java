package com.lx.blog.util;

import java.io.Serializable;
import java.util.List;

public class PageData<T> implements Serializable {

	private static final Long serialVersionUID = 6004807783441437877L;

	public double perPageNum = 10;

	private Long sizeOfAll;

	private Integer sumPage;

	private Integer sizeInCurrentPage;

	private Integer currentPage;

	private List<T> listInCurrentPage;
	
	public PageData(Integer currentPage){
		this.sizeOfAll = 0l;
		this.sumPage = 1;
		this.currentPage = currentPage;
		this.sizeInCurrentPage = 0;
	}
	
	public void setData(Long sizeOfAll, List<T> listInCurrentPage){
		this.sizeOfAll = sizeOfAll;
		this.sumPage = sumPage(sizeOfAll);
		this.listInCurrentPage = listInCurrentPage;
		if(listInCurrentPage!=null){
			this.sizeInCurrentPage = listInCurrentPage.size();
		}else{
			this.sizeInCurrentPage = 0;
		}
	}

	public Integer sumPage(Long sizeOfAll) {
		return (int) Math.ceil(sizeOfAll / perPageNum);
	}

	public Integer getOffset(Integer page) {
		return (int)((page - 1) * perPageNum);
	}

	public Integer getPerPageNum() {
		return (int)perPageNum;
	}

	public void setPerPageNum(Integer perPageNum) {
		this.perPageNum = perPageNum;
	}

	public Long getSizeOfAll() {
		return sizeOfAll;
	}

	public void setSizeOfAll(Long sizeOfAll) {
		this.sizeOfAll = sizeOfAll;
	}

	public Long getSumPage() {
		return (long)sumPage;
	}

	public void setSumPage(Integer sumPage) {
		this.sumPage = sumPage;
	}

	public Integer getSizeInCurrentPage() {
		return sizeInCurrentPage;
	}

	public void setSizeInCurrentPage(Integer sizeInCurrentPage) {
		this.sizeInCurrentPage = sizeInCurrentPage;
	}

	public Long getCurrentPage() {
		return (long)currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public List<?> getListInCurrentPage() {
		return listInCurrentPage;
	}

	public void setListInCurrentPage(List<T> listInCurrentPage) {
		this.listInCurrentPage = listInCurrentPage;
	}
}
