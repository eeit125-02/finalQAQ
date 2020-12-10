package com.web.book.model;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="NOVEL_ARTICLE")
public class ArticleBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int ID;
	@Column(name="Title")
	String article_title;
	@Column(name="Content")
	String article_content;
	
	
	public ArticleBean() {
	}
	
	public ArticleBean(String article_title, String article_content) {
		this.article_title = article_title;
		this.article_content = article_content;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	
	
}
