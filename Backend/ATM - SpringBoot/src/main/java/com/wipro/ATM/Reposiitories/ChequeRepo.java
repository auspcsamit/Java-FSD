package com.wipro.ATM.Reposiitories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wipro.ATM.Entities.Cheque;

public interface ChequeRepo extends JpaRepository<Cheque, Integer> {

}
