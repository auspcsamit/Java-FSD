package com.wipro.ATM.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.ATM.Entities.Costumer;
import com.wipro.ATM.Reposiitories.CostumerRepo;

@Service
public class CostumerServiceImpl implements CostumerService{

	@Autowired
	CostumerRepo costumerRepo;

	// ADD OR UPDATE COSTUMER
	@Override
	public void addCostumer(Costumer costumer) {
		// TODO Auto-generated method stub
		costumerRepo.save(costumer);
		
	}

	
	// VIEW ALL COSTUMER
	@Override
	public List<Costumer> findAllCostumers() {
		// TODO Auto-generated method stub
		return costumerRepo.findAll();
	}

	
	//DELETE COSTUMER BY ID
	@Override
	public void deleteCostumerById(int id) {
		// TODO Auto-generated method stub
		costumerRepo.deleteById(id);
	}

	
	
}
