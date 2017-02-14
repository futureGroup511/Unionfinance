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

	/**
	 * 根据用户面密码查询用户
	 * @param username
	 * @param password
	 * @return
	 */
    User findUserByNameAndPass(String username, String password);
}
