package com.lx.blog.model;

import java.io.Serializable;

//@Entity
//@Table(name = "user_message")
public class UserMessage extends Abstract implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7196121883319263983L;

//	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@Column(name = "id", insertable = false, updatable = false)
	private Long id;
	
//	@Column(name = "user_id")
	private Long userId;
	
//	@Column(name = "user_type_id")
	private Long user_type_id;
	
//	@Column(name = "interest")
	private String interest;

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

	public Long getUser_type_id() {
		return user_type_id;
	}

	public void setUser_type_id(Long user_type_id) {
		this.user_type_id = user_type_id;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}
}
