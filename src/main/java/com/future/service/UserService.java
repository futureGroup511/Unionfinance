package com.future.service;

import com.future.domain.User;

import java.util.List;


public interface UserService {
	User findUserById(Integer id);
	List<User> findAll();
	void add(User user);
	void update(User user);
	void deleteById(Integer id);
}
