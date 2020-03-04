package com.qxt.hgshop.service.impl;

import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.factory.annotation.Autowired;

import com.qxt.hgshop.config.AdminProperties;
import com.qxt.hgshop.service.UserService;
@Service(interfaceClass=UserService.class,version="1.0.0")
public class UserServiceImpl implements UserService {
	@Autowired
	AdminProperties adminPro;

	public boolean login(String userName, String passWord) {
		// TODO Auto-generated method stub
		return (adminPro.getAdminName().equals(userName) 
				&& adminPro.getPassword().equals(passWord));
	}

}
