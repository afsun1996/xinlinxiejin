package com.bysj.dao;

import java.util.List;

import com.bysj.dto.Article;

public interface ArticleDao {

	Article selectArticleById(Integer uid);
	
	Article selectArticleByName(Article Article);
	
	List<Article> selectArticleByType(String type);
	
	List<Article> selectAllArticles();
	
	int insertArticle(Article Article);

	int removeArticle(Article Article);
	
	int updateArticle(Article Article);

}
