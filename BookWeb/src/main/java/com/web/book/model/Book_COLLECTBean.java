package com.web.book.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Book_Collect")
public class Book_COLLECTBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer bc_ID;
	Date bc_Time;
	String bc_Tag;
//	Integer bk_ID;
//	Integer mb_ID;

	@ManyToOne
	@JoinColumn(name="bk_ID")
	private BookBean book;
	
	@ManyToOne
	@JoinColumn(name = "mb_ID")
	private MemberBean member;

	public Book_COLLECTBean() {
		super();
	}

	public Book_COLLECTBean(Integer bc_ID, Date bc_Time, String bc_Tag, BookBean book, MemberBean member) {
		super();
		this.bc_ID = bc_ID;
		this.bc_Time = bc_Time;
		this.bc_Tag = bc_Tag;
		this.book = book;
		this.member = member;
	}

	public Integer getBc_ID() {
		return bc_ID;
	}

	public void setBc_ID(Integer bc_ID) {
		this.bc_ID = bc_ID;
	}

	public Date getBc_Time() {
		return bc_Time;
	}

	public void setBc_Time(Date bc_Time) {
		this.bc_Time = bc_Time;
	}

	public String getBc_Tag() {
		return bc_Tag;
	}

	public void setBc_Tag(String bc_Tag) {
		this.bc_Tag = bc_Tag;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Book_COLLECTBean [bc_ID=");
		builder.append(bc_ID);
		builder.append(", bc_Time=");
		builder.append(bc_Time);
		builder.append(", bc_Tag=");
		builder.append(bc_Tag);
		builder.append(", book=");
		builder.append(book);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}

}
