package com.bysj.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bysj.dao.MmaterialDao;
import com.bysj.dao.MmaterialDao;
import com.bysj.dto.Article;
import com.bysj.dto.Doctor;
import com.bysj.dto.Mmaterial;
import com.bysj.dto.Prescription;
import com.bysj.dto.Mmaterial;
import com.bysj.utils.UploadFileUtils;
import com.bysj.dto.Mmaterial;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/mmaterial")
public class MmaterialController {
	@Resource
	private MmaterialDao MmaterialDao;
	@RequestMapping("/lists")
    public String list(Model model,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 3);
		List<Mmaterial> Mmaterials = MmaterialDao.selectAllMmaterials();
		PageInfo<Mmaterial> pageInfo = new PageInfo<Mmaterial>(Mmaterials);
		model.addAttribute("pageinfo",pageInfo);
		return "backend/MmaterialTable";
    }
	@RequestMapping("/showlist")
    public String showList(Model model,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 10);
		List<Mmaterial> Mmaterials = MmaterialDao.selectAllMmaterials();
		PageInfo<Mmaterial> pageInfo = new PageInfo<Mmaterial>(Mmaterials);
		model.addAttribute("pageinfo",pageInfo);
		return "frontEnd/mmaterialLists";
    }
	
	@RequestMapping("/detail")
	public String MmaterialDetail(String name ,Model model) {
		Mmaterial Mmaterial = MmaterialDao.selectMmaterialByName(name);
		if(Mmaterial != null) {
			model.addAttribute("Mmaterial", Mmaterial);
			return "backend/MmaterialDetail";
		}
		model.addAttribute("message", "没有查到此药材");
		return "error";
	}
	@RequestMapping("/info")
	public String MmaterialInfo(String name,Model model) {
		Mmaterial dto = this.MmaterialDao.selectMmaterialByName(name);
		List<Prescription> prescriptions = this.MmaterialDao.selectPrescriptionByMmaterial(name);
		model.addAttribute("mmaterial", dto);
		model.addAttribute("prescriptions", prescriptions);
		return "frontEnd/mmaterialinfo";
	}
	@RequestMapping("/MmaterialUpdate")
	public String MmaterialUpdateSave(Mmaterial Mmaterial, HttpServletRequest request)
			throws IllegalStateException, IOException {
		UploadFileUtils.saveFile(request,request.getServletContext()
				.getRealPath("jsp/commsource/MmaterialImg/") + Mmaterial.getMname()+".jpg");
		MmaterialDao.updateMmaterial(Mmaterial);
		return "success";
	}
	@RequestMapping("remove")
	public String deleteMmaterial(String mname) {
		Mmaterial key = new Mmaterial();
		key.setMname(mname);
		MmaterialDao.removeMmaterial(key);
		return "success";
	}
	@RequestMapping("add")
	public String addeMmaterial(Mmaterial Mmaterial , HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		com.bysj.dto.Mmaterial dto = MmaterialDao.selectMmaterialByName(Mmaterial.getMname());
		if(dto!=null) {
			model.addAttribute("message", "Error！有重复名");
			return "error";
		}
		MmaterialDao.insertMmaterial(Mmaterial);
		Mmaterial newMmaterial = MmaterialDao.selectMmaterialByName(Mmaterial.getMname());
		String imgPath = request.getServletContext()
				.getRealPath("jsp/commsource/MmaterialImg/")+newMmaterial.getMname()+".jpg";
		UploadFileUtils.saveFile(request, imgPath);
		return "success";
	}
	@RequestMapping("turntoAdd")
	public String turnToAdd() {
		return "backend/addMmaterial";
	}
	@RequestMapping("search")
	public String searchDoctorByName(String name ,Model model ,Integer currentPage) {
		if(currentPage == null) {
			currentPage = 1;
		}
		PageHelper.startPage(currentPage, 3);
		List<Mmaterial> mmaterials = MmaterialDao.selectMmaterialVague(name);
		PageInfo<Mmaterial> pageInfo = new PageInfo<Mmaterial>(mmaterials);
		model.addAttribute("pageinfo",pageInfo);
		model.addAttribute("searchflag", true);
		model.addAttribute("searchinfo",name);
		return "frontEnd/mmaterialLists";
	}
	
}
