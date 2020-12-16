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
	
	
	
}
