package com.wipro.ATM.Reposiitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wipro.ATM.Entities.Branch;

@Repository
public interface BranchRepo extends JpaRepository<Branch,Integer>{
	

}
