package com.wipro.ATM.Services;

import java.util.List;

import com.wipro.ATM.Entities.Costumer;

public interface CostumerService {
	
	void addCostumer(Costumer costumer);
	
	List<Costumer> findAllCostumers();
	
	void deleteCostumerById(int id);
	

}
