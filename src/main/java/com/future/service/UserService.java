package com.future.service;

import org.springframework.stereotype.Service;

import com.future.domain.User;

/**
 * �û�
 * @author ţ���
 *
 */

public interface UserService {
	User findUserById(Integer id);
}
