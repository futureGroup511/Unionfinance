package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * ֧����¼
 * @author ţ���
 *
 */
@Repository
public interface ExpenditureRecordDao {


    int queryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    int countAllExpense(Integer unionId);
}
