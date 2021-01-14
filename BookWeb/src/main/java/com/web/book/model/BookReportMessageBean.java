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
@Table(name = "BookReport_Message")
public class BookReportMessageBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bm_ID;
	
	private Date bm_Date;
	
	private String bm_Content;
	
	@ManyToOne
	@JoinColumn(name = "br_ID")
	private BookReportBean bookReport;
	
	@ManyToOne
	@JoinColumn(name = "mb_ID")
	private MemberBean member;
	

	public BookReportMessageBean() {
		super();
	}

	public BookReportMessageBean(Integer bm_ID, Date bm_Date, String bm_Content, BookReportBean bookReport,
			MemberBean member) {
		super();
		this.bm_ID = bm_ID;
		this.bm_Date = bm_Date;
		this.bm_Content = bm_Content;
		this.bookReport = bookReport;
		this.member = member;
	}

	public Integer getBm_ID() {
		return bm_ID;
	}

	public void setBm_ID(Integer bm_ID) {
		this.bm_ID = bm_ID;
	}

	public Date getBm_Date() {
		return bm_Date;
	}

	public void setBm_Date(Date bm_Date) {
		this.bm_Date = bm_Date;
	}

	public String getBm_Content() {
		return bm_Content;
	}

	public void setBm_Content(String bm_Content) {
		this.bm_Content = bm_Content;
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

