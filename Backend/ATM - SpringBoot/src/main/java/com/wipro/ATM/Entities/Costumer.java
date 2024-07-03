package com.wipro.ATM.Entities;

import java.sql.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Costumer {
	
	@Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int costumerId;
	
	private String accountNo;
	
	private String costumerName;
	
	private Date DOB;
	
	private int pin;
	
	private String costumerAddress;
	
	private String mobNum;
	
	private String panNo;
	
	private long balance;
	
	@ManyToOne
    @JoinColumn(name = "branchId")
    private Branch branch;
	

	 @OneToMany(mappedBy = "costumer")
	  private List<Cheque> cheque;

	// GETTERS SETTER METHOD
	public int getCostumerId() {
		return costumerId;
	}

	public void setCostumerId(int costumerId) {
		this.costumerId = costumerId;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getCostumerName() {
		return costumerName;
	}

	public void setCostumerName(String costumerName) {
		this.costumerName = costumerName;
	}

	public Date getDOB() {
		return DOB;
	}

	public void setDOB(Date dOB) {
		DOB = dOB;
	}

	public String getCostumerAddress() {
		return costumerAddress;
	}

	public void setCostumerAddress(String costumerAddress) {
		this.costumerAddress = costumerAddress;
	}

	public String getMobNum() {
		return mobNum;
	}

	public void setMobNum(String mobNum) {
		this.mobNum = mobNum;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}
	

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}
	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}


	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}

	public List<Cheque> getCheque() {
		return cheque;
	}

	public void setCheque(List<Cheque> cheque) {
		this.cheque = cheque;
	}

	// TO STRING METHOD
	@Override
	public String toString() {
		return "Costumer [costumerId=" + costumerId + ", accountNo=" + accountNo + ", costumerName=" + costumerName
				+ ", DOB=" + DOB + ", pin=" + pin + ", costumerAddress=" + costumerAddress + ", mobNum=" + mobNum
				+ ", panNo=" + panNo + ", balance=" + balance + ", branch=" + branch + ", cheque=" + cheque + "]";
	}

	
	//DEFAULT CONSTRUCTER
	public Costumer() {
		super();
	}

	//CONSTRUCTER USING FIELD
	
	public Costumer(int costumerId, String accountNo, String costumerName, Date dOB, int pin, String costumerAddress,
			String mobNum, String panNo, long balance, Branch branch, List<Cheque> cheque) {
		super();
		this.costumerId = costumerId;
		this.accountNo = accountNo;
		this.costumerName = costumerName;
		DOB = dOB;
		this.pin = pin;
		this.costumerAddress = costumerAddress;
		this.mobNum = mobNum;
		this.panNo = panNo;
		this.balance = balance;
		this.branch = branch;
		this.cheque = cheque;
	}

	
	


}
