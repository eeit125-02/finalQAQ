package com.web.book.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="NestedCommand")
public class NestedCommandBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer nested_command_id;	
	String nested_command_content;
	String nested_command_time;
	
	@ManyToOne
	@JoinColumn(name="FK_mb_id")
	private MemberBean memberbean;

	@ManyToOne
	@JoinColumn(name="FK_CommandBean_command_id") 	
    private CommandBean commandBean;	

	public NestedCommandBean() {}

	public NestedCommandBean(Integer nested_command_id, String nested_command_content, String nested_command_time,
			MemberBean memberbean, CommandBean commandBean) {
		super();
		this.nested_command_id = nested_command_id;
		this.nested_command_content = nested_command_content;
		this.nested_command_time = nested_command_time;
		this.memberbean = memberbean;
		this.commandBean = commandBean;
	}

	public Integer getNested_command_id() {
		return nested_command_id;
	}

	public void setNested_command_id(Integer nested_command_id) {
		this.nested_command_id = nested_command_id;
	}

	public String getNested_command_content() {
		return nested_command_content;
	}

	public void setNested_command_content(String nested_command_content) {
		this.nested_command_content = nested_command_content;
	}

	public String getNested_command_time() {
		return nested_command_time;
	}

	public void setNested_command_time(String nested_command_time) {
		this.nested_command_time = nested_command_time;
	}

	public MemberBean getMemberbean() {
		return memberbean;
	}

	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;
	}

	public CommandBean getCommandBean() {
		return commandBean;
	}

	public void setCommandBean(CommandBean commandBean) {
		this.commandBean = commandBean;
	}

}
