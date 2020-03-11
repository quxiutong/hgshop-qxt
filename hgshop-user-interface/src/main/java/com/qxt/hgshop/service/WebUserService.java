package com.qxt.hgshop.service;

import com.qxt.hgshop.pojo.User;

public interface WebUserService {
	
	/**
	 * 用户登录
	 * @param username
	 * @param pwd
	 * @return
	 */
	User login(String username,String pwd);
	
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	User register(User user);

}
