package com.wipro.ATM.Reposiitories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wipro.ATM.Entities.Costumer;

@Repository
public interface CostumerRepo extends JpaRepository<Costumer,Integer> {

}
