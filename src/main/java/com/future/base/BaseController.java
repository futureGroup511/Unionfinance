package com.future.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.service.EntryService;
import com.future.service.ExpenditureRecordService;
import com.future.service.IncomeRecordService;
import com.future.service.UnionService;
import com.future.service.UserService;

@Controller
@Scope("prototype")
public class BaseController {

	@Autowired
	protected EntryService entryService;
	
	@Autowired
	protected ExpenditureRecordService eRecordService;
	
	@Autowired
	protected IncomeRecordService incomeRecordService;
	
	@Autowired
	protected UnionService unionService;
	
	@Autowired UserService userService;
}
