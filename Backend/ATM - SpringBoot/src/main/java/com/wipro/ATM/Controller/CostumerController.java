package com.wipro.ATM.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.wipro.ATM.Entities.Branch;
import com.wipro.ATM.Entities.Costumer;
import com.wipro.ATM.Services.BranchService;
import com.wipro.ATM.Services.CostumerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CostumerController {
	
	@Autowired
	CostumerService costumerService;
	
	@Autowired
	BranchService branchService;
	
	//SHOW ADDCOSTUMER FORM PAGE
	@GetMapping("/addCostumer")
	public String showCostumerForm(HttpSession session,Model model) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		List<Branch>branches=branchService.showAllBranches();
		model.addAttribute("branches",branches);
		return "addCostumer";
		
		
	}
	// ADD COSTUMER POST MAPPING
	@PostMapping("/addCostumer")
	public String addCostumer(@ModelAttribute("costumer")Costumer costumer, HttpSession session) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		costumerService.addCostumer(costumer);
		
		return "redirect:/viewCostumer";
	}
	// VIEW ALL COSTUMER
	@GetMapping("/viewCostumer")
	public String viewCostumer(HttpSession session,Model model) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		List<Costumer>costumers=costumerService.findAllCostumers();
		model.addAttribute("costumers",costumers);
		return "viewCostumer";
		
		
	}
	@PostMapping("/deleteCostumer")
	public String deleteCostumer(@ModelAttribute("costumer")Costumer costumer,HttpSession session) {
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		
		costumerService.deleteCostumerById(costumer.getCostumerId());
		
		return "redirect:/viewCostumer";
	}
	

}
