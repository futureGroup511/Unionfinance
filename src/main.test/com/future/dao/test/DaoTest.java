package com.future.dao.test;

import com.future.domain.Entry;
import com.future.domain.IncomeRecord;
import com.future.domain.User;
import com.future.service.IncomeRecordService;
import com.future.service.UnionService;
import com.future.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DaoTest {

	@Autowired
	private UserService userService;

	@Autowired
	private IncomeRecordService incomeRecordService;

	@Autowired
	private UnionService unionService;

	@Test
	public void testfinduser(){
		User user = userService.findUserById(1);
		System.out.println(user.getUser_id());
	}

	@Test
	public void testaddInr(){
		Entry entry = Entry.newInstance();
		entry.setEn_id(1);
		User user = new User();
		user.setUser_id(1);
		IncomeRecord incomeRecord = IncomeRecord.newInstance();
		incomeRecord.setIr_date(new Date());
		incomeRecord.setIr_user(user);
		incomeRecord.setIr_entry(entry);
		incomeRecord.setIr_money(500.0);
		incomeRecordService.add(incomeRecord);
	}

	@Test
	public void testUnion(){
		/*Union union = new Union();
		union.setUn_name("这是一个工会");
		unionService.add(union);*/
		unionService.deleteById(1);
		/*
		unionService.deleteById(4);*/

		/*Union union = new Union();
		union.setUn_name("这是一个工会2");
		union.setUn_id(1);
		unionService.update(union);*/

		/*Union unions = unionService.findById(1);
		List<Union> unions2 = unionService.findAll();

		System.out.println(unions);
		for (Union union:unions2) System.out.println(union+"2");*/
	}
}
