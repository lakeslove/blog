package com.lx.blog.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class Abstract implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7631564826501648289L;
	
	/**
	 * 
	 */
	@Column(name = "create_date", updatable = false)
	protected Timestamp createDate;

	/**
	 * 
	 */
	@Column(name = "update_date")
	protected Timestamp updateDate;
	
//	public void setUpdate(){
//		setUpdateDate(new Timestamp(System.currentTimeMillis()));
//	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Timestamp updateDate) {
		this.updateDate = updateDate;
	}
	
}
