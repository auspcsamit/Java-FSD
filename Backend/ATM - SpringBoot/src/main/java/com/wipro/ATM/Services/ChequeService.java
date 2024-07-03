package com.wipro.ATM.Services;

import java.util.List;
import java.util.Optional;

import com.wipro.ATM.Entities.Cheque;

public interface ChequeService {

	void saveCheque(Cheque cheque);
	List<Cheque> allCheques();
	Cheque chequeFindById(int id);
}
