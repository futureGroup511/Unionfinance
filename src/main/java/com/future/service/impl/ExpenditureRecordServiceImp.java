package com.future.service.impl;

import com.future.domain.ExpenditureRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.ExpenditureRecordDao;
import com.future.service.ExpenditureRecordService;

import java.util.List;
import java.util.Map;

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

	public int queryExpenseRecordCount(Map<String, Object> paramMap) {
		return eDao.queryExpenseRecordCount(paramMap);
	}

	public List<ExpenditureRecord> queryExpenseRecord(Map<String, Object> paramMap) {
		return eDao.queryExpenseRecord(paramMap);
	}

    public int countAllExpense(Integer unionId) {
        return eDao.countAllExpense(unionId);
    }
}
