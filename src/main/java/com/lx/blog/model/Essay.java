package com.lx.blog.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "essay")
public class Essay extends Abstract implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -514581174913242868L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id", insertable = false, updatable = false)
	private Long id;
	
	@Column(name = "user_id")
	private Long userId;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "flag")
	private Integer flag;
	
	private EssayContent essayContent;

	public EssayContent getEssayContent() {
		return essayContent;
	}

	public void setEssayContent(EssayContent essayContent) {
		this.essayContent = essayContent;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getFlag() {
		return flag;
	}

	public void setFlag(Integer flag) {
		this.flag = flag;
	}
	
}
