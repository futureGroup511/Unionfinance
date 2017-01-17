package com.future.service;

import com.future.domain.ExpenditureRecord;
import com.future.utils.PageBean;

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

    /**
     * ���֧����¼
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);

    /**
     * ��ҳ��ѯ����֧����¼
     * @param pageBean
     * @return
     */
    PageBean getAllExpendRecord(PageBean pageBean);

    /**
     * ��ѯ����֧����
     * @return
     */
    Double getAllExpendSumMoney();
}
