package com.web.book.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Book")
public class BookBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer bk_ID;
	private String bk_Name;
	private String bk_BookType;
	private String bk_Author;
	private String bk_Translator;
	private String bk_Publish;
	private String bk_ISBN;
	private Date bk_Date;
	private String bk_Pic;
	private String bk_Language;
	private Integer bk_Price;
	private Integer bk_Page;
	private String bk_Publisher_Place;
	private String bk_Content;
	

	public BookBean() {
		super();
	}

	public BookBean(Integer bk_ID, String bk_Name, String bk_BookType, String bk_Author, String bk_Translator,
			String bk_Publish, String bk_ISBN, Date bk_Date, String bk_Pic, String bk_Language, Integer bk_Price,
			Integer bk_Page, String bk_Publisher_Place, String bk_Content) {
		super();
		this.bk_ID = bk_ID;
		this.bk_Name = bk_Name;
		this.bk_BookType = bk_BookType;
		this.bk_Author = bk_Author;
		this.bk_Translator = bk_Translator;
		this.bk_Publish = bk_Publish;
		this.bk_ISBN = bk_ISBN;
		this.bk_Date = bk_Date;
		this.bk_Pic = bk_Pic;
		this.bk_Language = bk_Language;
		this.bk_Price = bk_Price;
		this.bk_Page = bk_Page;
		this.bk_Publisher_Place = bk_Publisher_Place;
		this.bk_Content = bk_Content;
	}

	public Integer getBk_ID() {
		return bk_ID;
	}

	public void setBk_ID(Integer bk_ID) {
		this.bk_ID = bk_ID;
	}

	public String getBk_Name() {
		return bk_Name;
	}

	public void setBk_Name(String bk_Name) {
		this.bk_Name = bk_Name;
	}

	public String getBk_BookType() {
		return bk_BookType;
	}

	public void setBk_BookType(String bk_BookType) {
		this.bk_BookType = bk_BookType;
	}

	public String getBk_Author() {
		return bk_Author;
	}

	public void setBk_Author(String bk_Author) {
		this.bk_Author = bk_Author;
	}

	public String getBk_Translator() {
		return bk_Translator;
	}

	public void setBk_Translator(String bk_Translator) {
		this.bk_Translator = bk_Translator;
	}

	public String getBk_Publish() {
		return bk_Publish;
	}

	public void setBk_Publish(String bk_Publish) {
		this.bk_Publish = bk_Publish;
	}

	public String getBk_ISBN() {
		return bk_ISBN;
	}

	public void setBk_ISBN(String bk_ISBN) {
		this.bk_ISBN = bk_ISBN;
	}

	public Date getBk_Date() {
		return bk_Date;
	}

	public void setBk_Date(Date bk_Date) {
		this.bk_Date = bk_Date;
	}

	public String getBk_Pic() {
		return bk_Pic;
	}

	public void setBk_Pic(String bk_Pic) {
		this.bk_Pic = bk_Pic;
	}

	public String getBk_Language() {
		return bk_Language;
	}

	public void setBk_Language(String bk_Language) {
		this.bk_Language = bk_Language;
	}

	public Integer getBk_Price() {
		return bk_Price;
	}

	public void setBk_Price(Integer bk_Price) {
		this.bk_Price = bk_Price;
	}

	public Integer getBk_Page() {
		return bk_Page;
	}

	public void setBk_Page(Integer bk_Page) {
		this.bk_Page = bk_Page;
	}

	public String getBk_Publisher_Place() {
		return bk_Publisher_Place;
	}

	public void setBk_Publisher_Place(String bk_Publisher_Place) {
		this.bk_Publisher_Place = bk_Publisher_Place;
	}

	public String getBk_Content() {
		return bk_Content;
	}

	public void setBk_Content(String bk_Content) {
		this.bk_Content = bk_Content;
	}
}