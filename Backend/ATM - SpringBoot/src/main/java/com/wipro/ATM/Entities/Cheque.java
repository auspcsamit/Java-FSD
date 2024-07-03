package com.wipro.ATM.Entities;

import java.sql.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Cheque {
	
	@Id
	private int chequeId;
	
	private long amount;
	
	@ManyToOne
    @JoinColumn(name = "costumerId")
    private Costumer costumer;
	
	private Date chequeDate;
	
	private String Status;

	//GETTERS AND SETTERS
	public int getChequeId() {
		return chequeId;
	}

	public void setChequeId(int chequeId) {
		this.chequeId = chequeId;
	}

	public long getAmount() {
		return amount;
	}

	public void setAmount(long amount) {
		this.amount = amount;
	}

	public Costumer getCostumer() {
		return costumer;
	}

	public void setCostumer(Costumer costumer) {
		this.costumer = costumer;
	}

	public Date getChequeDate() {
		return chequeDate;
	}

	public void setChequeDate(Date chequeDate) {
		this.chequeDate = chequeDate;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	//TO STRING METHOD
	@Override
	public String toString() {
		return "Cheque [checkId=" + chequeId + ", amount=" + amount + ", costumer=" + costumer + ", chequeDate="
				+ chequeDate + ", Status=" + Status + "]";
	}

	//CONSTRUCTER USING FIELD
	public Cheque(int chequeId, long amount, Costumer costumer, Date chequeDate, String status) {
		super();
		this.chequeId = chequeId;
		this.amount = amount;
		this.costumer = costumer;
		this.chequeDate = chequeDate;
		Status = status;
	}
	
	//DEFAULT CONSTRUCTER
	public Cheque() {
		super();
	}

	
	
	

}
