package com.web.book.model;


import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table; 

@Entity
@Table(name="Members")
public class MemberBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mb_ID;
	private String mb_Account;
	private String mb_Password;
	private String mb_Sex;
	private Date mb_Birthday;
	private String mb_Name;
	private String mb_Mail;
	private String mb_Tel;
	private String mb_Address;
	private Timestamp mb_Date;
	private Integer mb_Lv;
	private String mb_type;
	private Blob mb_pic;
	
	public MemberBean() {
		super();
	}
	
	public MemberBean(Integer mb_ID, String mb_Account, String mb_Password, String mb_Sex, Date mb_Birthday,
			String mb_Name, String mb_Mail, String mb_Tel, String mb_Address, Timestamp mb_Date, Integer mb_Lv,
			String mb_type, Blob mb_pic) {
		super();
		this.mb_ID = mb_ID;
		this.mb_Account = mb_Account;
		this.mb_Password = mb_Password;
		this.mb_Sex = mb_Sex;
		this.mb_Birthday = mb_Birthday;
		this.mb_Name = mb_Name;
		this.mb_Mail = mb_Mail;
		this.mb_Tel = mb_Tel;
		this.mb_Address = mb_Address;
		this.mb_Date = mb_Date;
		this.mb_Lv = mb_Lv;
		this.mb_type = mb_type;
		this.mb_pic = mb_pic;
	}


	public Blob getMb_pic() {
		return mb_pic;
	}

	public void setMb_pic(Blob mB_pic) {
		this.mb_pic = mB_pic;
	}

	
	public int getMb_ID() {
		return mb_ID;
	}

	public void setMb_ID(Integer mB_ID) {
		this.mb_ID = mB_ID;
	}

	public String getMb_Account() {
		return mb_Account;
	}

	public void setMb_Account(String mB_Account) {
		this.mb_Account = mB_Account;
	}

	public String getMb_Password() {
		return mb_Password;
	}

	public void setMb_Password(String mB_Password) {
		this.mb_Password = mB_Password;
	}

	public String getMb_Sex() {
		return mb_Sex;
	}

	public void setMb_Sex(String mB_Sex) {
		this.mb_Sex = mB_Sex;
	}

	public Date getMb_Birthday() {
		return mb_Birthday;
	}

	public void setMb_Birthday(Date mB_Birthday) {
		this.mb_Birthday = mB_Birthday;
	}

	public String getMb_Name() {
		return mb_Name;
	}

	public void setMb_Name(String mB_Name) {
		this.mb_Name = mB_Name;
	}

	public String getMb_Mail() {
		return mb_Mail;
	}

	public void setMb_Mail(String mB_Mail) {
		this.mb_Mail = mB_Mail;
	}

	public String getMb_Tel() {
		return mb_Tel;
	}

	public void setMb_Tel(String mB_Tel) {
		this.mb_Tel = mB_Tel;
	}

	public String getMb_Address() {
		return mb_Address;
	}

	public void setMb_Address(String mB_Address) {
		this.mb_Address = mB_Address;
	}

	public Timestamp getMb_Date() {
		return mb_Date;
	}

	public void setMb_Date(Timestamp mB_Date) {
		this.mb_Date = mB_Date;
	}

	public Integer getMb_Lv() {
		return mb_Lv;
	}

	public void setMb_Lv(Integer mB_Lv) {
		this.mb_Lv = mB_Lv;
	}

	public String getMb_type() {
		return mb_type;
	}

	public void setMb_type(String mB_type) {
		this.mb_type = mB_type;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberBean [mb_ID=");
		builder.append(mb_ID);
		builder.append(", mb_Account=");
		builder.append(mb_Account);
		builder.append(", mb_Password=");
		builder.append(mb_Password);
		builder.append(", mb_Sex=");
		builder.append(mb_Sex);
		builder.append(", mb_Birthday=");
		builder.append(mb_Birthday);
		builder.append(", mb_Name=");
		builder.append(mb_Name);
		builder.append(", mb_Mail=");
		builder.append(mb_Mail);
		builder.append(", mb_Tel=");
		builder.append(mb_Tel);
		builder.append(", mb_Address=");
		builder.append(mb_Address);
		builder.append(", mb_Date=");
		builder.append(mb_Date);
		builder.append(", mb_Lv=");
		builder.append(mb_Lv);
		builder.append(", mb_type=");
		builder.append(mb_type);
		builder.append(", mb_pic=");
		builder.append(mb_pic);
		builder.append("]");
		return builder.toString();
	}
	
}
