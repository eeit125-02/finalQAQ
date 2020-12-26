package com.web.book.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Rules")
public class RuleBean {
	
	@Id
	Integer rule_id = 1;
	String rule_content;
	String rule_time;
	
	public RuleBean() {
		super();
	}

	public RuleBean(Integer rule_id, String rule_content,String rule_time) {
		super();
		this.rule_id = rule_id;
		this.rule_content = rule_content;
		this.rule_time = rule_time;
	}

	public Integer getRule_id() {
		return rule_id;
	}

	public void setRule_id(Integer rule_id) {
		this.rule_id = rule_id;
	}

	public String getRule_content() {
		return rule_content;
	}

	public void setRule_content(String rule_content) {
		this.rule_content = rule_content;
	}

	public String getRule_time() {
		return rule_time;
	}

	public void setRule_time(String rule_time) {
		this.rule_time = rule_time;
	}
	
}
