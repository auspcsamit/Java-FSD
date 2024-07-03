package com.wipro.ATM.Entities;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Branch {
    
	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int branchId;
	
	private String branchName;
	
	private String branchAddress;
	
	private String branchManager;
	
	private String IFSC_Code;
	
	 @OneToMany(mappedBy = "branch")
	    private List<Costumer> costumers;
	 
	//GETTERS AND SETTERS

	public int getBranchId() {
		return branchId;
	}

	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchAddress() {
		return branchAddress;
	}

	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}

	public String getBranchManager() {
		return branchManager;
	}

	public void setBranchManager(String branchManager) {
		this.branchManager = branchManager;
	}

	public String getIFSC_Code() {
		return IFSC_Code;
	}

	public void setIFSC_Code(String iFSC_Code) {
		IFSC_Code = iFSC_Code;
	}
	

	public List<Costumer> getCostumers() {
		return costumers;
	}

	public void setCostumers(List<Costumer> costumers) {
		this.costumers = costumers;
	}

	// TO STRING
	@Override
	public String toString() {
		return "Branch [branchId=" + branchId + ", branchName=" + branchName + ", branchAddress=" + branchAddress
				+ ", branchManager=" + branchManager + ", IFSC_Code=" + IFSC_Code + ", costumers=" + costumers + "]";
	}

	
	// CONSTRUCTER USING FIELDS
	public Branch(int branchId, String branchName, String branchAddress, String branchManager, String iFSC_Code,
			List<Costumer> costumers) {
		super();
		this.branchId = branchId;
		this.branchName = branchName;
		this.branchAddress = branchAddress;
		this.branchManager = branchManager;
		IFSC_Code = iFSC_Code;
		this.costumers = costumers;
	}


	
	
	//CONSTRUCTER WITHOUT FIELDS
	public Branch() {
		super();
	}

	
	
	
	
	
	
	
}
