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
	Integer mb_id;
	Timestamp command_time;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="FK_PostBean_post_id") 	
    private PostBean postBean;
	
	public CommandBean() {}

	public CommandBean(Integer command_id, String command_content, Integer mb_id,
			Timestamp command_time, PostBean postBean) {
		super();
		this.command_id = command_id;
		this.command_content = command_content;
		this.mb_id = mb_id;
		this.command_time = command_time;
		this.postBean = postBean;
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

	public Integer getMb_id() {
		return mb_id;
	}

	public void setMb_id(Integer mb_id) {
		this.mb_id = mb_id;
	}

	public Timestamp getCommand_time() {
		return command_time;
	}

	public void setCommand_time(Timestamp command_time) {
		this.command_time = command_time;
	}

	public PostBean getPostBean() {
		return postBean;
	}

	public void setPostBean(PostBean postBean) {
		this.postBean = postBean;
	}
	

}
