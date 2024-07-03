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
public class HomeController {

	@Autowired
	AdminService adminService;

	@GetMapping("/")
	public String Home() {
		return "home";
	}

	@GetMapping("/login")
	public String showLogin() {
		return "login";
	}

	@PostMapping("/login")
	public String loginTest(@RequestParam("adminEmail") String adminEmail, @RequestParam("password") String password,
			HttpSession session, Model model) {

		Admin admin = adminService.findByEmail(adminEmail);

		if (admin != null) {
			String apass = admin.getPassword();
			if (apass.equals(password)) {
				session.setAttribute("admin", admin);
				return "redirect:/showDashBoard";
			} else {
				model.addAttribute("password", true);
				return "login";
			}
		}
		model.addAttribute("email", true);
		return "login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/sessionExpire";
	}
	@GetMapping("/sessionExpire")
	public String showSessionExpire() {
		return "sessionExpire";
	}
}
