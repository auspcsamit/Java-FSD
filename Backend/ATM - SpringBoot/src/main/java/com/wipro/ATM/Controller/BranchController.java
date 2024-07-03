package com.wipro.ATM.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wipro.ATM.Entities.Branch;
import com.wipro.ATM.Services.BranchService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BranchController {
	
	@Autowired
	BranchService branchService;
	
	@GetMapping("/addBranch")
	public String showAddBranch(HttpSession session)
	{
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		return "addBranch";
	}
	
	@PostMapping("/addBranch")
	public String addBranch(HttpSession session,@ModelAttribute ("branch") Branch branch) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		branchService.addBranch(branch);
		return"redirect:/showBranches";
	}
	@GetMapping("/showBranches")
	public String showBranches(Model model) {
		List<Branch>branches=branchService.showAllBranches();
		model.addAttribute("branches",branches);
		return "viewBranches";
		
	}
	@PostMapping("/showBranches")
	public String searchBranches(@RequestParam("searchText")String searchText,HttpSession session,Model model) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		List<Branch> branches=branchService.searchBranches(searchText);
		
		model.addAttribute(branches);
		return"viewBranches";
	}
	@PostMapping("/deleteBranch")
	public String deleteBranch(@ModelAttribute("branch")Branch branch,HttpSession session) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		branchService.deleteBranchById(branch.getBranchId());
		return "redirect:/showBranches";
	}

}
