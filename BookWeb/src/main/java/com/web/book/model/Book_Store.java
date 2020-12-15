package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "BooK_Store")
public class Book_Store {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bks_ID;
	
	private Integer bs_Num;
	private Integer bs_Price;
	
	@ManyToOne
	@JoinColumn(name = "bk_ID")
	private BookBean book;
	
	@ManyToOne
	@JoinColumn(name = "bs_ID")
	private MemberBean member;

	public Book_Store() {
		super();
	}

	public Book_Store(Integer bks_ID, Integer bs_Num, Integer bs_Price, BookBean book, MemberBean member) {
		super();
		this.bks_ID = bks_ID;
		this.bs_Num = bs_Num;
		this.bs_Price = bs_Price;
		this.book = book;
		this.member = member;
	}

	public Integer getBks_ID() {
		return bks_ID;
	}

	public void setBks_ID(Integer bks_ID) {
		this.bks_ID = bks_ID;
	}

	public Integer getBs_Num() {
		return bs_Num;
	}

	public void setBs_Num(Integer bs_Num) {
		this.bs_Num = bs_Num;
	}

	public Integer getBs_Price() {
		return bs_Price;
	}

	public void setBs_Price(Integer bs_Price) {
		this.bs_Price = bs_Price;
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
		builder.append("Book_Store [bks_ID=");
		builder.append(bks_ID);
		builder.append(", bs_Num=");
		builder.append(bs_Num);
		builder.append(", bs_Price=");
		builder.append(bs_Price);
		builder.append(", book=");
		builder.append(book);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
	
}
