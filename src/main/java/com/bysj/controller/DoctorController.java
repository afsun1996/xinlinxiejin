package com.bysj.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.bysj.dao.DoctorDao;
import com.bysj.dto.Article;
import com.bysj.dto.Doctor;
import com.bysj.utils.UploadFileUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/user")
public class DoctorController {
	@Resource
	private DoctorDao doctorDao;
	
	@RequestMapping("/lists")
    public String list(Model model,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 10);
		List<Doctor> doctors = doctorDao.selectAllDoctors();
		PageInfo<Doctor> pageInfo = new PageInfo<Doctor>(doctors);
		model.addAttribute("pageinfo",pageInfo);
		return "backend/doctorTable";
    }
	
	@RequestMapping("/showlist")
    public String showList(Model model,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 3);
		List<Doctor> doctors = doctorDao.selectAllDoctors();
		PageInfo<Doctor> pageInfo = new PageInfo<Doctor>(doctors);
		model.addAttribute("pageinfo",pageInfo);
		return "frontEnd/doctorLists";
    }
	
	@RequestMapping("/detail")
	public String doctorDetail(Integer doctorID ,Model model) {
		Doctor doctor = doctorDao.selectDoctorById(doctorID);
		if(doctor != null) {
			model.addAttribute("doctor", doctor);
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
			if(doctor.getBirthday()!=null) {
				model.addAttribute("birthday",sdf.format(doctor.getBirthday()));
			}
			if(doctor.getDeathday()!=null) {
				model.addAttribute("deathday",sdf.format(doctor.getDeathday()));
			}
			return "backend/doctorDetail";
		}
		return "backend/error";
	}
	@RequestMapping("info")
	public String doctorInfo(Integer id,Model model) {
		Doctor dto = this.doctorDao.selectDoctorById(id);
		List<Article> articles = this.doctorDao.selectArticleByDoctor(dto.getDname());
		model.addAttribute("doctor", dto);
		model.addAttribute("articles", articles);
		return "frontEnd/doctorInfo";
	}
	@RequestMapping("/doctorUpdate")
	public String doctorUpdateSave(Doctor doctor, HttpServletRequest request)
			throws IllegalStateException, IOException {
		UploadFileUtils.saveFile(request,request.getServletContext()
				.getRealPath("jsp/commsource/doctorImg/") + doctor.getId()+".jpg");
		doctorDao.updateDoctor(doctor);
		return "success";
	}
	
	@RequestMapping("remove")
	public String deleteDoctor(Integer id) {
		Doctor key = new Doctor();
		key.setId(id); 
		doctorDao.removeDoctor(key);
		return "success";
	}
	
	@RequestMapping("add")
	public String addeDoctor(Doctor doctor , HttpServletRequest request) throws IllegalStateException, IOException {
		doctorDao.insertDoctor(doctor);
		Doctor newDoctor = doctorDao.selectDoctorByPrecise(doctor);
		String imgPath = request.getServletContext()
				.getRealPath("jsp/commsource/doctorImg/")+newDoctor.getId()+".jpg";
		UploadFileUtils.saveFile(request, imgPath);
		return "success";
	}
	@RequestMapping("turntoAdd")
	public String turnToAdd() {
		return "backend/addDoctor";
	}
	
	
	@RequestMapping("search")
	public String searchDoctorByName(String name ,Model model ,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 3);
		List<Doctor> doctors = doctorDao.selectDoctorByName(name);
		PageInfo<Doctor> pageInfo = new PageInfo<Doctor>(doctors);
		model.addAttribute("pageinfo",pageInfo);
		model.addAttribute("searchflag", true);
		model.addAttribute("searchinfo",name);
		return "frontEnd/doctorLists";
	}
}