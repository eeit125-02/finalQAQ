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
@Table(name = "Act_Collect")
public class ActCollectBean{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer collect_ID;
	private Date collect_Time;
	
	@ManyToOne
	@JoinColumn(name="act_ID")
	private ActBean act;
	
	@ManyToOne
	@JoinColumn(name="mb_ID")
	private MemberBean member;

	public ActCollectBean() {
		super();
	}

	public ActCollectBean(Integer collect_ID, Date collect_Time, ActBean act, MemberBean member) {
		super();
		this.collect_ID = collect_ID;
		this.collect_Time = collect_Time;
		this.act = act;
		this.member = member;
	}

	public Integer getCollect_ID() {
		return collect_ID;
	}

	public void setCollect_ID(Integer collect_ID) {
		this.collect_ID = collect_ID;
	}

	public Date getCollect_Time() {
		return collect_Time;
	}

	public void setCollect_Time(Date collect_Time) {
		this.collect_Time = collect_Time;
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
		builder.append("ActCollectBean [collect_ID=");
		builder.append(collect_ID);
		builder.append(", collect_Time=");
		builder.append(collect_Time);
		builder.append(", act=");
		builder.append(act);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}
	
}
