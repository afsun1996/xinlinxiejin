package com.bysj.controller;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bysj.dao.LognUserDao;
import com.bysj.dto.LognUser;
@Controller
@RequestMapping(value = "/logn")
@SessionAttributes("user")
public class LognController {
	@Resource
    private LognUserDao dao;
	
	// 进入登录页面
	@RequestMapping("/logn")
	public String logn() {
		return "backend/logn";
	}
	
	// 用户名密码检验֤
	@RequestMapping("/logning")
	public String Logn(HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String user = request.getParameter("username");
		String pwd = request.getParameter("pwd");
		LognUser userDto = dao.getLognUserByName(user);
		if(userDto != null) {
			if(userDto.getPassWord().equals(pwd)) {
				model.addAttribute("user", userDto);
				return "backend/index";
			}
		} 
		model.addAttribute("msg", "账户或者密码输入错误 请重新输入！");
		return "backend/logn";
	}
	// 注销
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session){
        session.invalidate();
        return "backend/logn";
    }

	
}
