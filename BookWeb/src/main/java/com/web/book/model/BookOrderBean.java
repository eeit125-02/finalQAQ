package com.web.book.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Book_Order")
public class BookOrderBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bo_ID;
	private Date bo_Date;
	private Integer bo_Total;
	private String bo_Name;
	private String bo_Add;
	private Integer bo_Cel;
	@ManyToOne
	@JoinColumn(name = "bb_ID")
	private MemberBean member;
	private String bo_Status;
	
	
	public BookOrderBean(Integer bo_ID, Date bo_Date, Integer bo_Total, String bo_Name, String bo_Add, Integer bo_Cel,
			MemberBean member, String bo_Status) {
		super();
		this.bo_ID = bo_ID;
		this.bo_Date = bo_Date;
		this.bo_Total = bo_Total;
		this.bo_Name = bo_Name;
		this.bo_Add = bo_Add;
		this.bo_Cel = bo_Cel;
		this.member = member;
		this.bo_Status = bo_Status;
	}

	public BookOrderBean() {
		super();
	}
	
	public String getBo_Status() {
		return bo_Status;
	}

	public void setBo_Status(String bo_Status) {
		this.bo_Status = bo_Status;
	}

	public Integer getBo_ID() {
		return bo_ID;
	}

	public void setBo_ID(Integer bo_ID) {
		this.bo_ID = bo_ID;
	}

	public Date getBo_Date() {
		return bo_Date;
	}

	public void setBo_Date(Date bo_Date) {
		this.bo_Date = bo_Date;
	}

	public Integer getBo_Total() {
		return bo_Total;
	}

	public void setBo_Total(Integer bo_Total) {
		this.bo_Total = bo_Total;
	}

	public String getBo_Name() {
		return bo_Name;
	}

	public void setBo_Name(String bo_Name) {
		this.bo_Name = bo_Name;
	}

	public String getBo_Add() {
		return bo_Add;
	}

	public void setBo_Add(String bo_Add) {
		this.bo_Add = bo_Add;
	}

	public Integer getBo_Cel() {
		return bo_Cel;
	}

	public void setBo_Cel(Integer bo_Cel) {
		this.bo_Cel = bo_Cel;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BookOrderBean [bo_ID=");
		builder.append(bo_ID);
		builder.append(", bo_Date=");
		builder.append(bo_Date);
		builder.append(", bo_Total=");
		builder.append(bo_Total);
		builder.append(", bo_Name=");
		builder.append(bo_Name);
		builder.append(", bo_Add=");
		builder.append(bo_Add);
		builder.append(", bo_Cel=");
		builder.append(bo_Cel);
		builder.append(", member=");
		builder.append(member);
		builder.append(", bo_Status=");
		builder.append(bo_Status);
		builder.append("]");
		return builder.toString();
	}
	
}
