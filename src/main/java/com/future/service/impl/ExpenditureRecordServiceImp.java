package com.future.service.impl;

import com.future.dao.ExpenditureRecordDao;
import com.future.domain.ExpenditureRecord;
import com.future.service.ExpenditureRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * ֧����¼
 * @author ţ���
 *
 */
@Service
@Transactional
public class ExpenditureRecordServiceImp  implements ExpenditureRecordService{

	@Autowired
	private ExpenditureRecordDao eDao;


	/**
	 * ���֧����¼
	 * @param expendRecord
	 */
	public void insert(ExpenditureRecord expendRecord) {
		eDao.insert(expendRecord);
	}
}
