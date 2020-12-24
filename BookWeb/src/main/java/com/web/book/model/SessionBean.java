package com.web.book.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="Session")
public class SessionBean {
	@Id
	@Column(columnDefinition="nvarchar(256)")
	private String sessionKey;
	@Column(columnDefinition="int not null")
	private Integer sessionValue;
	
	public String getSessionKey() {
		return sessionKey;
	}
	public void setSessionKey(String sessionKey) {
		this.sessionKey = sessionKey;
	}
	public Integer getSessionValue() {
		return sessionValue;
	}
	public void setSessionValue(Integer sessionValue) {
		this.sessionValue = sessionValue;
	}
	
}
