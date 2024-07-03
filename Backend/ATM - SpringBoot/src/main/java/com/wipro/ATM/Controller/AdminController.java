package com.wipro.ATM.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wipro.ATM.Entities.Admin;
import com.wipro.ATM.Services.AdminService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	// SHOW ADMIN DASHBOARD
	@GetMapping("showDashBoard")
	public String showDashBoard(HttpSession session) {
		if(session.getAttribute("admin")==null)
			return "redirect:/sessionExpire";
		return"dashBoard";
	}
	
	// SHOW CHANGE PASSWORD
	@GetMapping("changePassword")
	public String showChangePasswordForm(HttpSession session) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/logout";}
		return "changePassword";
	}
	// POST MAPPING CHANGE PASSWORD
	@PostMapping("changePassword")
	public String changePassword(@RequestParam("adminEmail") String email,@RequestParam("oldPassword") String oldPassword,
			@RequestParam("newPassword") String newPassword,HttpSession session,Model model) {
		
		if(session.getAttribute("admin")==null) {
			return "redirect:/logout";}
		Admin admin=adminService.findByEmail(email);
		
		if(admin!=null) {
		if(admin.getPassword().equals(oldPassword)) {
			admin.setPassword(newPassword);
			adminService.updateAdmin(admin);
			model.addAttribute("passwordChanged",true);
			return "changePassword";
			}
	else {
		model.addAttribute("password",true);
	
		return "changePassword";}
	}
		return "redirect:/logout";}


	
}