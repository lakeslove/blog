package com.lx.blog.model;

import java.io.Serializable;

//@Entity
//@Table(name = "register")
public class EssayContent extends Abstract implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8151954470245602807L;

//	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@Column(name = "id", insertable = false, updatable = false)
	private Long id;
	
//	@Column(name = "essay_id")
	private Long essayId;
	
//	@Column(name = "chapter")
	private Integer chapter;
	
//	@Column(name = "chapter_name")
	private String chapterName;
	
//	@Column(name = "content")
	private String content;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getEssayId() {
		return essayId;
	}

	public void setEssayId(Long essayId) {
		this.essayId = essayId;
	}

	public Integer getChapter() {
		return chapter;
	}

	public void setChapter(Integer chapter) {
		this.chapter = chapter;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
