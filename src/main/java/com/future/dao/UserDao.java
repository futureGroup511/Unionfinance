package com.future.dao;

import com.future.domain.User;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserDao {

	User findUserById(Integer id);
	List<User> findAll();
	void add(User user);
	void update(User user);
	void deleteById(Integer id);
}
