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

import com.bysj.dao.PrescriptionDao;
import com.bysj.dto.Mmaterial;
import com.bysj.dto.Prescription;
import com.bysj.dto.Prescription;
import com.bysj.utils.UploadFileUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/prescription")
public class PrescriptionController {
	@Resource
	private PrescriptionDao PrescriptionDao;
	
	@RequestMapping("/lists")
    public String list(Model model,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 10);
		List<Prescription> Prescriptions = PrescriptionDao.selectAllPrescriptions();
		PageInfo<Prescription> pageInfo = new PageInfo<Prescription>(Prescriptions);
		model.addAttribute("pageinfo",pageInfo);
		return "backend/PrescriptionTable";
    }
	@RequestMapping("/showlist")
    public String showList(Model model,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 3);
		List<Prescription> Prescriptions = PrescriptionDao.selectAllPrescriptions();
		PageInfo<Prescription> pageInfo = new PageInfo<Prescription>(Prescriptions);
		model.addAttribute("pageinfo",pageInfo);
		return "frontEnd/prescriptionLists";
    }
	
	
	@RequestMapping("/detail")
	public String PrescriptionDetail(String name ,Model model) {
		Prescription Prescription = PrescriptionDao.selectPrescriptionByName(name);
		if(Prescription != null) {
			model.addAttribute("Prescription", Prescription);
			return "backend/PrescriptionDetail";
		}
		model.addAttribute("message", "没有查到此方剂");
		return "backend/error";
	}
	
	@RequestMapping("/info")
	public String MmaterialInfo(String name,Model model) {
		Prescription dto = this.PrescriptionDao.selectPrescriptionByName(name);
		model.addAttribute("prescriptions", dto);
		return "frontEnd/prescriptioninfo";
	}
	
	@RequestMapping("/PrescriptionUpdate")
	public String PrescriptionUpdateSave(Prescription Prescription, HttpServletRequest request)
			throws IllegalStateException, IOException {
		PrescriptionDao.updatePrescription(Prescription);
		return "success";
	}
	
	@RequestMapping("remove")
	public String deletePrescription(String name) {
		PrescriptionDao.removePrescription(name);
		return "success";
	}
	
	@RequestMapping("add")
	public String addePrescription(Prescription Prescription , HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		PrescriptionDao.insertPrescription(Prescription);
		com.bysj.dto.Prescription dto = PrescriptionDao.selectPrescriptionByName(Prescription.getName());
		if(dto==null) {
			model.addAttribute("message", "Error！有重复名");
			return "error";
		}
		return "success";
	}
	@RequestMapping("turntoAdd")
	public String turnToAdd() {
		return "backend/addPrescription";
	}
	@RequestMapping("search")
	public String searchPrescriptionByName(String name ,Model model ,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 3);
		List<Prescription> Prescriptions = PrescriptionDao.selectPrescriptionVague(name);
		PageInfo<Prescription> pageInfo = new PageInfo<Prescription>(Prescriptions);
		model.addAttribute("pageinfo",pageInfo);
		model.addAttribute("searchflag", true);
		model.addAttribute("searchinfo",name);
		return "frontEnd/prescriptionLists";
	}
}