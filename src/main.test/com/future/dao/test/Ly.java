package com.future.dao.test;


import com.future.service.EntryService;
import com.future.service.IncomeRecordService;
import com.future.service.UnionService;
import com.future.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class Ly {

	@Autowired
	private UserService userService;

	@Autowired
	private IncomeRecordService incomeRecordService;

	@Autowired
	private UnionService unionService;

	@Autowired
	private EntryService entryService;


	@Test
	public void getAllEnEntry(){
		System.out.println(entryService.getAllExpenEntry());
	}

}
