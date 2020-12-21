package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Search_Type")
public class SearchTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer sty_ID;
	String sty_Name;
	
	public SearchTypeBean() {
		super();
	}

	public SearchTypeBean(Integer sty_ID, String sty_Name) {
		super();
		this.sty_ID = sty_ID;
		this.sty_Name = sty_Name;
	}

	public Integer getSty_ID() {
		return sty_ID;
	}

	public void setSty_ID(Integer sty_ID) {
		this.sty_ID = sty_ID;
	}

	public String getSty_Name() {
		return sty_Name;
	}

	public void setSty_Name(String sty_Name) {
		this.sty_Name = sty_Name;
	}


}
