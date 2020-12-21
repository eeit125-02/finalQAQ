package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="Book_Type")
public class BookTypeBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer bt_ID;

	@ManyToOne
	@JoinColumn(name="bk_ID")
	private BookBean book;
	
	@ManyToOne
	@JoinColumn(name = "sty_ID")
	private SearchTypeBean searchtype;

	public BookTypeBean() {
		super();
	}

	public BookTypeBean(Integer bt_ID, BookBean book, SearchTypeBean searchtype) {
		super();
		this.bt_ID = bt_ID;
		this.book = book;
		this.searchtype = searchtype;
	}

	public Integer getBt_ID() {
		return bt_ID;
	}

	public void setBt_ID(Integer bt_ID) {
		this.bt_ID = bt_ID;
	}

	public BookBean getBook() {
		return book;
	}

	public void setBook(BookBean book) {
		this.book = book;
	}

	public SearchTypeBean getSearchtype() {
		return searchtype;
	}

	public void setSearchtype(SearchTypeBean searchtype) {
		this.searchtype = searchtype;
	}

}
