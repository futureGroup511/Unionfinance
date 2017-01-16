package com.future.service.impl;

import com.future.dao.ExpenditureRecordDao;
import com.future.domain.ExpenditureRecord;
import com.future.service.ExpenditureRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 支出记录
 * @author 牛洧鹏
 *
 */
@Service
@Transactional
public class ExpenditureRecordServiceImp  implements ExpenditureRecordService{

	@Autowired
	private ExpenditureRecordDao eDao;


	/**
	 * 添加支出记录
	 * @param expendRecord
	 */
	public void insert(ExpenditureRecord expendRecord) {
		eDao.insert(expendRecord);
	}
}
