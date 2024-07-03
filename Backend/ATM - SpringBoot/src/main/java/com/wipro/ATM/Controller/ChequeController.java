package com.wipro.ATM.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.wipro.ATM.Entities.Cheque;
import com.wipro.ATM.Entities.Costumer;
import com.wipro.ATM.Services.ChequeService;
import com.wipro.ATM.Services.CostumerService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ChequeController {

	@Autowired
	ChequeService chequeservice;
	@Autowired
	CostumerService costumerService;
	
	@GetMapping("/showCheques")
	public String showCheques(HttpSession session,Model model)
	{
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		List<Cheque> cheques=chequeservice.allCheques();
		
		model.addAttribute("cheques",cheques);
		return"viewCheques";
		
	}
	@PostMapping("/verifyCheque")
	public String verifyCheques(HttpSession session,Model model,@ModelAttribute("Cheque")Cheque cheque)
	{
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		
		Cheque chequeById=chequeservice.chequeFindById(cheque.getChequeId());
		Costumer costumer=chequeById.getCostumer();
		costumer.setBalance(chequeById.getAmount());
		chequeById.setStatus("Cleared");
		chequeservice.saveCheque(chequeById);
		costumerService.addCostumer(costumer);
		return"redirect:/showCheques";
		
	}
	@PostMapping("/rejectCheque")
	public String rejectCheques(HttpSession session,Model model,@ModelAttribute("Cheque")Cheque cheque)
	{
		if(session.getAttribute("admin")==null) {
			return "redirect:/sessionExpire";
		}
		Cheque chequeById=chequeservice.chequeFindById(cheque.getChequeId());
		chequeById.setStatus("Cancelled");
		chequeservice.saveCheque(chequeById);
		return"redirect:/showCheques";
		
	}
}
