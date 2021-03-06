package com.web.book.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name = "ACT_Records")
public class ActBean {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer act_ID;

	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Image;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Name;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Theme;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Date;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Time;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Loc;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Intro;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Guest;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Pax;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Rule;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Tag;
	
	@Column(columnDefinition="nvarchar(MAX)")
	private String act_Place;
	
	
	private Integer mb_ID;
	private Integer act_Differentpax;



	public ActBean(Integer act_ID, String act_Image, String act_Name, String act_Theme, String act_Date,
			String act_Time, String act_Loc, String act_Intro, String act_Guest,
			String act_Pax, String act_Rule, String act_Tag, String act_Place, Integer mb_ID,
			Integer act_Differentpax) {
		super();
		this.act_ID = act_ID;
		this.act_Image = act_Image;
		this.act_Name = act_Name;
		this.act_Theme = act_Theme;
		this.act_Date = act_Date;
		this.act_Time = act_Time;
		this.act_Loc = act_Loc;
		this.act_Intro = act_Intro;
		this.act_Guest = act_Guest;
		this.act_Pax = act_Pax;
		this.act_Rule = act_Rule;
		this.act_Tag = act_Tag;
		this.act_Place = act_Place;
		this.mb_ID = mb_ID;
		this.act_Differentpax = act_Differentpax;
	}


	public Integer getMb_ID() {
		return mb_ID;
	}


	public void setMb_ID(Integer mb_ID) {
		this.mb_ID = mb_ID;
	}


	public ActBean() {
		super();
	}

	public Integer getact_ID() {
		return act_ID;
	}

	public void setact_ID(Integer act_ID) {
		this.act_ID = act_ID;
	}

	public String getact_Image() {
		return act_Image;
	}

	public void setact_Image(String act_Image) {
		this.act_Image = act_Image;
	}

	public String getact_Name() {
		return act_Name;
	}

	public void setact_Name(String act_Name) {
		this.act_Name = act_Name;
	}

	public String getact_Theme() {
		return act_Theme;
	}

	public void setact_Theme(String act_Theme) {
		this.act_Theme = act_Theme;
	}

	public String getact_Date() {
		return act_Date;
	}

	public void setact_Date(String act_Date) {
		this.act_Date = act_Date;
	}

	public String getact_Loc() {
		return act_Loc;
	}

	public void setact_Loc(String act_Loc) {
		this.act_Loc = act_Loc;
	}

	public String getact_Intro() {
		return act_Intro;
	}

	public void setact_Intro(String act_Intro) {
		this.act_Intro = act_Intro;
	}

	public String getact_Guest() {
		return act_Guest;
	}

	public void setact_Guest(String act_Guest) {
		this.act_Guest = act_Guest;
	}

	public String getact_Pax() {
		return act_Pax;
	}

	public void setact_Pax(String act_Pax) {
		this.act_Pax = act_Pax;
	}

	public String getact_Rule() {
		return act_Rule;
	}

	public void setact_Rule(String act_Rule) {
		this.act_Rule = act_Rule;
	}

	public String getact_Tag() {
		return act_Tag;
	}

	public void setact_Tag(String act_Tag) {
		this.act_Tag = act_Tag;
	}

	public String getact_Place() {
		return act_Place;
	}

	public void setact_Place(String act_Place) {
		this.act_Place = act_Place;
	}
	
	public Integer getAct_Differentpax() {
		return act_Differentpax;
	}


	public void setAct_Differentpax(Integer act_Differentpax) {
		this.act_Differentpax = act_Differentpax;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ActBean [act_ID=");
		builder.append(act_ID);
		builder.append(", act_Image=");
		builder.append(act_Image);
		builder.append(", act_Name=");
		builder.append(act_Name);
		builder.append(", act_Theme=");
		builder.append(act_Theme);
		builder.append(", act_Date=");
		builder.append(act_Date);
		builder.append(", act_Loc=");
		builder.append(act_Loc);
		builder.append(", act_Intro=");
		builder.append(act_Intro);
		builder.append(", act_Guest=");
		builder.append(act_Guest);
		builder.append(", act_Pax=");
		builder.append(act_Pax);
		builder.append(", act_Rule=");
		builder.append(act_Rule);
		builder.append(", act_Tag=");
		builder.append(act_Tag);
		builder.append(", act_Place=");
		builder.append(act_Place);
		builder.append("]");
		return builder.toString();
	}


	public String getact_Time() {
		return act_Time;
	}


	public void setact_Time(String act_Time) {
		this.act_Time = act_Time;
	}

	

}