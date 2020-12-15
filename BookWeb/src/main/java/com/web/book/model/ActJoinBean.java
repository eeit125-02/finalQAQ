package com.web.book.model;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ACT_Join")
public class ActJoinBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer join_ID;
	private Date join_Time;
	
	@ManyToOne
	@JoinColumn(name="act_ID")
	private ActBean act;
	
	@ManyToOne
	@JoinColumn(name="mb_ID")
	private MemberBean member;

	public ActJoinBean() {
		super();
	}	
	
	public ActJoinBean(Integer join_ID, Date join_Time, ActBean act, MemberBean member) {
		super();
		this.join_ID = join_ID;
		this.join_Time = join_Time;
		this.act = act;
		this.member = member;
	}

	public Integer getjoin_ID() {
		return join_ID;
	}

	public void setjoin_ID(Integer join_ID) {
		this.join_ID = join_ID;
	}

	public Date getjoin_Time() {
		return join_Time;
	}

	public void setjoin_Time(Date join_Time) {
		this.join_Time = join_Time;
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
		builder.append(", act=");
		builder.append(act);
		builder.append(", member=");
		builder.append(member);
		builder.append("]");
		return builder.toString();
	}

}