package com.wipro.ATM.Reposiitories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wipro.ATM.Entities.Admin;

public interface AdminRepo extends JpaRepository<Admin, Integer>{

}
