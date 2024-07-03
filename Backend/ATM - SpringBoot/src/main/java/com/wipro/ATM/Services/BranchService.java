package com.wipro.ATM.Services;

import java.util.List;

import com.wipro.ATM.Entities.Branch;

public interface BranchService {

	void addBranch(Branch branch);
	List<Branch> showAllBranches();
	List<Branch> searchBranches(String searchText);
	void deleteBranchById(int id);
}
