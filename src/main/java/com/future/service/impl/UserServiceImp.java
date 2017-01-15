package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.UserDao;
import com.future.domain.User;
import com.future.service.UserService;

/**
 * ”√ªß
 * @author ≈£‰¢≈Ù
 *
 */
@Service
@Transactional
public class UserServiceImp implements UserService{

	@Autowired
	private UserDao userDao;

	public User findUserById(Integer id) {
		return userDao.findUserById(id);
	}
}
