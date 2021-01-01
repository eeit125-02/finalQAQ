package com.web.book.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BooK_Order")
public class Book_OrderBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bo_ID;
	private Date bo_Date;
	private Integer bo_Total;
	private String bko_Name;
	private String bko_Add;
	private String bko_Cel;
	@ManyToOne
	@JoinColumn(name = "bb_ID")
	private MemberBean member;
	
	public Book_OrderBean() {
		super();
	}
	
	public Book_OrderBean(Integer bo_ID, Date bo_Date, Integer bo_Total, String bko_Name, String bko_Add,
			String bko_Cel, MemberBean member) {
		super();
		this.bo_ID = bo_ID;
		this.bo_Date = bo_Date;
		this.bo_Total = bo_Total;
		this.bko_Name = bko_Name;
		this.bko_Add = bko_Add;
		this.bko_Cel = bko_Cel;
		this.member = member;
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

	public String getBko_Name() {
		return bko_Name;
	}

	public void setBko_Name(String bko_Name) {
		this.bko_Name = bko_Name;
	}

	public String getBko_Add() {
		return bko_Add;
	}

	public void setBko_Add(String bko_Add) {
		this.bko_Add = bko_Add;
	}

	public String getBko_Cel() {
		return bko_Cel;
	}

	public void setBko_Cel(String bko_Cel) {
		this.bko_Cel = bko_Cel;
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
		builder.append("Book_OrderBean [bo_ID=");
		builder.append(bo_ID);
		builder.append(", bo_Date=");
		builder.append(bo_Date);
		builder.append(", bo_Total=");
		builder.append(bo_Total);
		builder.append(", bko_Name=");
		builder.append(bko_Name);
		builder.append(", bko_Add=");
		builder.append(bko_Add);
		builder.append(", bko_Cel=");
		builder.append(bko_Cel);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
}
