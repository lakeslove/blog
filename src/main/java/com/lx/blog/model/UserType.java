package com.lx.blog.model;

import java.io.Serializable;

//@Entity
//@Table(name = "user_type")
public class UserType implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7654637344402912296L;

//	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	@Column(name = "id", insertable = false, updatable = false)
	private Long id;
	
//	@Column(name = "user_type")
	private int userType;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getUserType() {
		return userType;
	}

	public void setUserType(int userType) {
		this.userType = userType;
	}
	
}
