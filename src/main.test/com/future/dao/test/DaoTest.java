package com.future.dao.test;

import com.future.domain.IncomeRecord;
import com.future.domain.User;
import com.future.service.IncomeRecordService;
import com.future.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
//配置了@ContextConfiguration注解并使用该注解的locations属性指明spring和配置文件之后，
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DaoTest {

	@Autowired
	private UserService userService;

	@Autowired
	private IncomeRecordService incomeRecordService;

	@Test
	public void testfinduser(){
		User user = userService.findUserById(1);
		System.out.println(user.getUser_id());
	}

	@Test
	public void testaddInr(){
		IncomeRecord incomeRecord = IncomeRecord.newInstance();
		incomeRecord.setIr_date(new Date());

	}
}
