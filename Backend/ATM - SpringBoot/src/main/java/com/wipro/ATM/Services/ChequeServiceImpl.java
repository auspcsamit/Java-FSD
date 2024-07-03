package com.wipro.ATM.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.ATM.Entities.Cheque;
import com.wipro.ATM.Reposiitories.ChequeRepo;

@Service
public class ChequeServiceImpl implements ChequeService{

	@Autowired
	ChequeRepo chequeRepo;
	
	@Override
	public void saveCheque(Cheque cheque) {
		// TODO Auto-generated method stub
		chequeRepo.save(cheque);
		
	}

	@Override
	public List<Cheque> allCheques() {
		// TODO Auto-generated method stub
		return chequeRepo.findAll();
	
	}

	@Override
	public Cheque chequeFindById(int id) {
		// TODO Auto-generated method stub
		Optional<Cheque> cheque=chequeRepo.findById(id);
		if(cheque!=null)
		return cheque.get();
		return null;
		
		
	}
	



}
