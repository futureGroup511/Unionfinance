package com.future.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.future.domain.User;

/**
 * ”√ªß
 * @author ≈£‰¢≈Ù
 *
 */
@Repository
public interface UserDao {

	User findUserById(Integer id);
}
