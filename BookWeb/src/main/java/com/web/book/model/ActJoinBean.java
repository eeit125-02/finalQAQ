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
@Table(name = "ACT_Join1")
public class ActJoinBean {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer join_ID;
	private String join_Time;
	private Integer join_Pax;
	private Integer mb_ID;
	


	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="act_ID")
	private ActBean act;

	
	public ActJoinBean() {
		super();
	}	
	
	public ActJoinBean(Integer join_ID, String join_Time, Integer join_Pax, ActBean act) {
		super();
		this.join_ID = join_ID;
		this.join_Time = join_Time;
		this.join_Pax = join_Pax;
		this.act = act;

	}


	public Integer getMb_ID() {
		return mb_ID;
	}

	public void setMb_ID(Integer mb_ID) {
		this.mb_ID = mb_ID;
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
		builder.append("]");
		return builder.toString();
	}

	

}