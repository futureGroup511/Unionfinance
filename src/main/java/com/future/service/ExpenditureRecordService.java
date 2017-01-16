package com.future.service;

import com.future.domain.ExpenditureRecord;
import com.future.utils.PageBean;

/**
 * ֧����¼
 * @author ţ���
 *
 */
public interface ExpenditureRecordService {


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
