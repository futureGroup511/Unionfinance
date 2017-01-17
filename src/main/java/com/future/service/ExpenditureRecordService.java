package com.future.service;

import com.future.domain.ExpenditureRecord;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * ֧����¼
 * @author ţ���
 *
 */
public interface ExpenditureRecordService {

    int queryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    int countAllExpense(Integer unionId);
}
