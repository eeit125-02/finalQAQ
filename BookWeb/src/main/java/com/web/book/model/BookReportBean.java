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
@Table(name = "Book_Report")

public class BookReportBean {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer br_ID;
	private Integer br_Name;
	private Integer br_Score;
	private String br_Content;
	private Date br_DateTime;
	private Integer br_ClickNumber;
	private Integer br_CollectionNumber;
	
	@ManyToOne
	@JoinColumn(name = "bk_ID")
	private BookBean book;
	
	@ManyToOne
	@JoinColumn(name = "mb_ID")
	private MemberBean member;
	
	public BookReportBean() {
		super();
	}

	public BookReportBean(Integer br_ID, Integer br_Name, Integer br_Score, String br_Content, Date br_DateTime,
			Integer br_ClickNumber, Integer br_CollectionNumber, BookBean book, MemberBean member) {
		super();
		this.br_ID = br_ID;
		this.br_Name = br_Name;
		this.br_Score = br_Score;
		this.br_Content = br_Content;
		this.br_DateTime = br_DateTime;
		this.br_ClickNumber = br_ClickNumber;
		this.br_CollectionNumber = br_CollectionNumber;
		this.book = book;
		this.member = member;
	}

	public Integer getBr_ID() {
		return br_ID;
	}

	public void setBr_ID(Integer br_ID) {
		this.br_ID = br_ID;
	}

	public Integer getBr_Name() {
		return br_Name;
	}

	public void setBr_Name(Integer br_Name) {
		this.br_Name = br_Name;
	}

	public Integer getBr_Score() {
		return br_Score;
	}

	public void setBr_Score(Integer br_Score) {
		this.br_Score = br_Score;
	}

	public String getBr_Content() {
		return br_Content;
	}

	public void setBr_Content(String br_Content) {
		this.br_Content = br_Content;
	}

	public Date getBr_DateTime() {
		return br_DateTime;
	}

	public void setBr_DateTime(Date br_DateTime) {
		this.br_DateTime = br_DateTime;
	}
	
	public Integer getBr_ClickNumber() {
		return br_ClickNumber;
	}

	public void setBr_ClickNumber(Integer br_ClickNumber) {
		this.br_ClickNumber = br_ClickNumber;
	}

	public Integer getBr_CollectionNumber() {
		return br_CollectionNumber;
	}

	public void setBr_CollectionNumber(Integer br_CollectionNumber) {
		this.br_CollectionNumber = br_CollectionNumber;
	}

	public BookBean getBook() {
		return book;
	}

	public void setBook(BookBean book) {
		this.book = book;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}


}
