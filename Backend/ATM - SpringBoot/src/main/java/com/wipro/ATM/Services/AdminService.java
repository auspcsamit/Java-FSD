package com.wipro.ATM.Services;

import com.wipro.ATM.Entities.Admin;

public interface AdminService {

	

	Admin findByEmail(String email);
	void updateAdmin(Admin admin);
}
