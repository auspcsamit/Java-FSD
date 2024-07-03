package com.wipro.ATM.Services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.wipro.ATM.Entities.Branch;
import com.wipro.ATM.Reposiitories.BranchRepo;

@Service
public class BranchServiceImpl implements BranchService {

	@Autowired
	BranchRepo branchRepo;
	
	// ADD AND UPDATE BRANCH
	@Override
	public void addBranch(Branch branch) {
		branchRepo.save(branch);
	}
	
	// SHOW ALL BRANCHES
	@Override
	public List<Branch> showAllBranches() {
	     List<Branch> branches=branchRepo.findAll();
		return branches;
	}
    // SEARCH BRANCHES
	@Override
	public List<Branch> searchBranches(String searchText) {
	    List<Branch> branches=new ArrayList<Branch>();
	    
		return branches;
	}

	@Override
	public void deleteBranchById(int id) {
		branchRepo.deleteById(id);
		
	}

}
