package com.web.book.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BookReport_Collect")
public class BookReportCollectBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer rc_ID;
	
	private Date addDate;
	
	private Integer br_ClickNumber;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "br_ID")
	private BookReportBean bookReport;
	
	@ManyToOne
	@JoinColumn(name = "mb_ID")
	private MemberBean member;
	

	public BookReportCollectBean() {
		super();
	}

	public BookReportCollectBean(Integer rc_ID, BookReportBean bookReport, MemberBean member, Date addDate) {
		super();
		this.rc_ID = rc_ID;
		this.bookReport = bookReport;
		this.member = member;
		this.addDate = addDate;
		this.br_ClickNumber = 0;
	}

	public Integer getRc_ID() {
		return rc_ID;
	}

	public void setRc_ID(Integer rc_ID) {
		this.rc_ID = rc_ID;
	}
	
	public Date getAddDate() {
		return addDate;
	}
	
	public Integer getBr_ClickNumber() {
		return br_ClickNumber;
	}

	public void setBr_ClickNumber(Integer br_ClickNumber) {
		this.br_ClickNumber = br_ClickNumber;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public BookReportBean getBookReport() {
		return bookReport;
	}

	public void setBookReport(BookReportBean bookReport) {
		this.bookReport = bookReport;
	}
	
	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}
	
	
}

