package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.ExpenditureRecordDao;
import com.future.service.ExpenditureRecordService;

/**
 * Ö§³ö¼ÇÂ¼
 * @author Å£ä¢Åô
 *
 */
@Service
@Transactional
public class ExpenditureRecordServiceImp  implements ExpenditureRecordService{

	@Autowired
	private ExpenditureRecordDao eDao;
}
