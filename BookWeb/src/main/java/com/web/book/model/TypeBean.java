package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Types")
public class TypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer ty_ID;
	String ty_Name;
	
	public TypeBean() {
		super();
	}

	public TypeBean(Integer ty_ID, String ty_Name) {
		super();
		this.ty_ID = ty_ID;
		this.ty_Name = ty_Name;
	}

	public Integer getTy_ID() {
		return ty_ID;
	}

	public void setTy_ID(Integer ty_ID) {
		this.ty_ID = ty_ID;
	}

	public String getTy_Name() {
		return ty_Name;
	}

	public void setTy_Name(String ty_Name) {
		this.ty_Name = ty_Name;
	}


}
