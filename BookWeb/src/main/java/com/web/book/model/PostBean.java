package com.web.book.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="Post")
public class PostBean implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer post_id;
	String post_title;
	String post_content;
	Integer mb_id;
	Timestamp post_time;
	
	@OneToMany(mappedBy="postBean", cascade=CascadeType.ALL)
	private Set<PostBean> posts=new LinkedHashSet<>( );

	public PostBean() {}
	
	public PostBean(Integer post_id, String post_title, String post_content, Integer mb_id, Timestamp post_time,
			Set<PostBean> posts) {
		super();
		this.post_id = post_id;
		this.post_title = post_title;
		this.post_content = post_content;
		this.mb_id = mb_id;
		this.post_time = post_time;
		this.posts = posts;
	}

	public Integer getPost_id() {
		return post_id;
	}

	public void setPost_id(Integer post_id) {
		this.post_id = post_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public Integer getMb_id() {
		return mb_id;
	}

	public void setMb_id(Integer mb_id) {
		this.mb_id = mb_id;
	}

	public Timestamp getPost_time() {
		return post_time;
	}

	public void setPost_time(Timestamp post_time) {
		this.post_time = post_time;
	}

	public Set<PostBean> getPosts() {
		return posts;
	}

	public void setPosts(Set<PostBean> posts) {
		this.posts = posts;
	}

	
	
}
