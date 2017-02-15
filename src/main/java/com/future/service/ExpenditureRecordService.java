package com.future.service;

import com.future.domain.ExpenditureRecord;
import com.future.utils.PageBean;

import java.util.List;
import java.util.Map;

/**
 * ֧����¼
 * @author ţ���?
 *
 */
public interface ExpenditureRecordService {

    int queryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    int countAllExpense(Integer unionId);

    /**
     * ���֧�����?
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
     * ��ѯ����֧���
     */
    Double getAllExpendSumMoney();

    /**
     * ֧����¼������ѯ
     * @param pageBean
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    PageBean getConditionExpendRecord(PageBean pageBean, String date3, String date4, Integer un_id, Integer en_id);

    /**
     * ������ѯ֧�����
     * @return
     */
    Double getConditionExpendSumMoney(String date1,String date2,Integer un_id, Integer en_id);

    Double sumExMoney(Integer id);
}
