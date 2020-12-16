package com.web.book.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ACT_Registration")
public class ActRegBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer reg_ID;
	private Date reg_Time;
			
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="act_ID")
	private ActBean act;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="mb_ID")
	private MemberBean member;
			
	public ActRegBean(Integer reg_ID, Date reg_Time, ActBean act, MemberBean member) {
		super();
		this.reg_ID = reg_ID;
		this.reg_Time = reg_Time;
		this.act = act;
		this.member = member;
	}

	public ActRegBean() {
		super();

	}

	public Integer getReg_ID() {
		return reg_ID;
	}

	public void setReg_ID(Integer reg_ID) {
		this.reg_ID = reg_ID;
	}

	public Date getReg_Time() {
		return reg_Time;
	}

	public void setReg_Time(Date reg_Time) {
		this.reg_Time = reg_Time;
	}

	public ActBean getAct() {
		return act;
	}

	public void setAct(ActBean act) {
		this.act = act;
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
		builder.append("ActRegBean [reg_ID=");
		builder.append(reg_ID);
		builder.append(", reg_Time=");
		builder.append(reg_Time);
		builder.append(", act=");
		builder.append(act);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
	
}