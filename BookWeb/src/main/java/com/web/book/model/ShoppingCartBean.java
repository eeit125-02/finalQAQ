package com.web.book.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Shopping_Cart")
public class ShoppingCartBean {
	//購物車編號
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cart_ID;
	//購買數量
	private Integer cart_Num;
	//購買價格
	private Integer cart_Price;
	
	//書本編號
	@ManyToOne
	@JoinColumn(name = "bk_ID")
	private BookBean book;
	
	//買家編號
	@ManyToOne
	@JoinColumn(name = "bb_ID")
	private MemberBean member;
	
	//賣家編號
	@ManyToOne
	@JoinColumn(name = "bs_ID")
	private MemberBean memberSel;

	public MemberBean getMemberSel() {
		return memberSel;
	}

	public ShoppingCartBean() {
		super();
	}

	public ShoppingCartBean(Integer cart_ID, Integer cart_Num, Integer cart_Price, BookBean book, MemberBean member, MemberBean memberSel) {
		super();
		this.cart_ID = cart_ID;
		this.cart_Num = cart_Num;
		this.cart_Price = cart_Price;
		this.book = book;
		this.member = member;
		this.memberSel = memberSel;
	}

	public Integer getCart_ID() {
		return cart_ID;
	}

	public void setCart_ID(Integer cart_ID) {
		this.cart_ID = cart_ID;
	}

	public Integer getCart_Num() {
		return cart_Num;
	}

	public void setCart_Num(Integer cart_Num) {
		this.cart_Num = cart_Num;
	}

	public Integer getCart_Price() {
		return cart_Price;
	}

	public void setCart_Price(Integer cart_Price) {
		this.cart_Price = cart_Price;
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
	
	public void setMemberSel(MemberBean memberSel) {
		this.memberSel = memberSel;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShoppingCartBean [cart_ID=");
		builder.append(cart_ID);
		builder.append(", cart_Num=");
		builder.append(cart_Num);
		builder.append(", cart_Price=");
		builder.append(cart_Price);
		builder.append(", book=");
		builder.append(book);
		builder.append(", member=");
		builder.append(member);
		builder.append(", memberSel=");
		builder.append(memberSel);
		builder.append("]");
		return builder.toString();
	}

}
