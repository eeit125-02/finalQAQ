package com.web.book.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ACT_Join")
public class ActJoinBean {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer join_ID;
	private String join_Time;
	private Integer join_Pax;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	private ActBean act;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	private MemberBean member;

	
	public ActJoinBean() {
		super();
	}	
	
	public ActJoinBean(Integer join_ID, String join_Time, Integer join_Pax, ActBean act, MemberBean member) {
		super();
		this.join_ID = join_ID;
		this.join_Time = join_Time;
		this.join_Pax = join_Pax;
		this.act = act;
		this.member = member;
	}


	public Integer getjoin_ID() {
		return join_ID;
	}

	public void setjoin_ID(Integer join_ID) {
		this.join_ID = join_ID;
	}

	public String getjoin_Time() {
		return join_Time;
	}

	public void setjoin_Time(String join_Time) {
		this.join_Time = join_Time;
	}

	public Integer getjoin_Pax() {
		return join_Pax;
	}

	public void setjoin_Pax(Integer join_Pax) {
		this.join_Pax = join_Pax;
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
		builder.append("ActJoinBean [join_ID=");
		builder.append(join_ID);
		builder.append(", join_Time=");
		builder.append(join_Time);
		builder.append(", join_Pax=");
		builder.append(join_Pax);
		builder.append(", act=");
		builder.append(act);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}

	

}