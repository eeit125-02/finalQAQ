package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

//@Entity
//@Table(name = "BookReport_Collect")
public class BookReportCollectBean {
	
//	@ManyToOne
//	@JoinColumn(name = "br_ID")
	private BookReportBean bookReport;
	
//	@ManyToOne
//	@JoinColumn(name = "mb_ID")
	private MemberBean member;

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

