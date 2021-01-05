package com.web.book.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="Command")
public class CommandBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer command_id;	
	String command_content;
	String command_time;
	
	@ManyToOne
	@JoinColumn(name="FK_PostBean_post_id") 	
    private PostBean postBean;
	
	@ManyToOne
	@JoinColumn(name="FK_mb_id")
	private MemberBean memberbean;
	
	public CommandBean() {}

	public CommandBean(Integer command_id, String command_content, String command_time, PostBean postBean,
			MemberBean memberbean) {
		super();
		this.command_id = command_id;
		this.command_content = command_content;
		this.command_time = command_time;
		this.postBean = postBean;
		this.memberbean = memberbean;
	}

	public Integer getCommand_id() {
		return command_id;
	}

	public void setCommand_id(Integer command_id) {
		this.command_id = command_id;
	}

	public String getCommand_content() {
		return command_content;
	}

	public void setCommand_content(String command_content) {
		this.command_content = command_content;
	}

	public String getCommand_time() {
		return command_time;
	}

	public void setCommand_time(String command_time) {
		this.command_time = command_time;
	}

	public PostBean getPostBean() {
		return postBean;
	}

	public void setPostBean(PostBean postBean) {
		this.postBean = postBean;
	}

	public MemberBean getMemberbean() {
		return memberbean;
	}

	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;
	}	

}
