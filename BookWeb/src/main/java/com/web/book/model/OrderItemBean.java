package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Order_Item")
public class OrderItemBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer oi_ID;
	@ManyToOne
	@JoinColumn(name = "bo_ID")
	BookOrderBean order;
	@ManyToOne
	@JoinColumn(name = "bs_ID")
	MemberBean member;
	@ManyToOne
	@JoinColumn(name = "bk_ID")
	BookBean book;
	Integer oi_Qty;
	Integer oi_Price;
	
	public OrderItemBean() {
		super();
	}

	public OrderItemBean(Integer oi_ID, BookOrderBean order, MemberBean member, BookBean book, Integer oi_Qty,
			Integer oi_Price) {
		super();
		this.oi_ID = oi_ID;
		this.order = order;
		this.member = member;
		this.book = book;
		this.oi_Qty = oi_Qty;
		this.oi_Price = oi_Price;
	}

	public Integer getOi_ID() {
		return oi_ID;
	}

	public void setOi_ID(Integer oi_ID) {
		this.oi_ID = oi_ID;
	}

	public BookOrderBean getOrder() {
		return order;
	}

	public void setOrder(BookOrderBean order) {
		this.order = order;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public BookBean getBook() {
		return book;
	}

	public void setBook(BookBean book) {
		this.book = book;
	}

	public Integer getOi_Qty() {
		return oi_Qty;
	}

	public void setOi_Qty(Integer oi_Qty) {
		this.oi_Qty = oi_Qty;
	}

	public Integer getOi_Price() {
		return oi_Price;
	}

	public void setOi_Price(Integer oi_Price) {
		this.oi_Price = oi_Price;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderItemBean [oi_ID=");
		builder.append(oi_ID);
		builder.append(", order=");
		builder.append(order);
		builder.append(", member=");
		builder.append(member);
		builder.append(", book=");
		builder.append(book);
		builder.append(", oi_Qty=");
		builder.append(oi_Qty);
		builder.append(", oi_Price=");
		builder.append(oi_Price);
		builder.append("]");
		return builder.toString();
	}
	
}
