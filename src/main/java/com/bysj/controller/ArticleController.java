package com.bysj.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.tomcat.util.http.fileupload.FileUploadBase;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.bysj.dao.ArticleDao;
import com.bysj.dto.Article;
import com.bysj.utils.UploadFileUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	@Resource
	private ArticleDao ArticleDao;
	
	@RequestMapping("/lists")
    public String list(Model model,Integer currentPage, HttpServletRequest request) {
		if(currentPage==null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 10);
		List<Article> Articles = ArticleDao.selectAllArticles();
		PageInfo<Article> pageInfo = new PageInfo<Article>(Articles);
		model.addAttribute("pageinfo",pageInfo);
		return "backend/ArticleTable";
    }
	
	@RequestMapping("/allpages")
	public String allPages(Model model,Integer currentPage) {
		if(currentPage==null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 10);
		List<Article> all = ArticleDao.selectAllArticles();
		PageInfo<Article> pageInfo = new PageInfo<Article>(all);
		model.addAttribute("pageinfo",pageInfo);
		return "frontEnd/articlePage";
	}
	@RequestMapping("/detail")
	public String ArticleDetail(Integer uid ,Model model, HttpServletRequest request) {
		Article Article = ArticleDao.selectArticleById(uid);
		if(Article != null) {
			model.addAttribute("Article", Article);
			return "backend/ArticleDetail";
		}
		return "error";
	}
	@RequestMapping("/article")
	public String showArticle(Integer uid, Model model) {
		Article Article = ArticleDao.selectArticleById(uid);
		model.addAttribute("article", Article);
		return "frontEnd/article";
	}
	@RequestMapping("/ArticleUpdate")
	public String ArticleUpdateSave(Article Article, HttpServletRequest request)
			throws IllegalStateException, IOException {
		UploadFileUtils.saveFile(request,request.getServletContext()
				.getRealPath("jsp/commsource/ArticleImg/") + Article.getUid()+".jpg");
		ArticleDao.updateArticle(Article);
		return "success";
	}
	
	@RequestMapping("remove")
	public String deleteArticle(Integer id) {
		Article key = new Article();
		key.setUid(id); 
		ArticleDao.removeArticle(key);
		return "success";
	}
	
	@RequestMapping("add")
	public String addeArticle(Article Article , HttpServletRequest request) throws IllegalStateException, IOException {
		ArticleDao.insertArticle(Article);
		Article newArticle = ArticleDao.selectArticleByName(Article);
		String imgPath = request.getServletContext()
				.getRealPath("jsp/commsource/ArticleImg/")+newArticle.getUid()+".jpg";
		UploadFileUtils.saveFile(request, imgPath);
		return "success";
	}
	@RequestMapping("turntoAdd")
	public String turnToAdd() {
		return "backend/addArticle";
	}
	 
}