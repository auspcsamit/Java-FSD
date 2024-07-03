package com.wipro.ATM.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wipro.ATM.Entities.Admin;
import com.wipro.ATM.Reposiitories.AdminRepo;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminRepo adminRepo;

	

	@Override
	public Admin findByEmail(String email) {
		List<Admin> allAdmin = adminRepo.findAll();

		for (Admin admin : allAdmin) {

			if (admin.getEmail().equals(email)) {
				return admin;
			}
		}
		return null;

	}



	@Override
	public void updateAdmin(Admin admin) {
		adminRepo.save(admin);
		
	}

}
