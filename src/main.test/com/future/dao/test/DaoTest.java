package com.future.dao.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.future.domain.User;
import com.future.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
//������@ContextConfigurationע�Ⲣʹ�ø�ע���locations����ָ��spring�������ļ�֮��
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DaoTest {

	@Autowired
	private UserService userService;
	
	@Test
	public void testfinduser(){
		User user = userService.findUserById(1);
		System.out.println(user.getUser_id());
	}
}
