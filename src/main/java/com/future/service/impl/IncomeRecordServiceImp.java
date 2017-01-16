package com.future.service.impl;

import com.future.domain.IncomeRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.IncomeRecordDao;
import com.future.service.IncomeRecordService;

import java.util.List;
import java.util.Map;

/**
 * �����¼
 * @author ţ���
 *
 */
@Service
@Transactional
public class IncomeRecordServiceImp implements IncomeRecordService {

	@Autowired
	private IncomeRecordDao incomeRecordDao;

	public void add(IncomeRecord incomeRecord) {
		incomeRecordDao.add(incomeRecord);
	}

    public int queryIncomeRecordsCount(Map<String, Object> paramMap) {
        return incomeRecordDao.queryIncomeRecordsCount(paramMap);
    }

    public List<IncomeRecord> queryIncomeRecords(Map<String, Object> paramMap) {
		return incomeRecordDao.queryIncomeRecords(paramMap);
	}
}
