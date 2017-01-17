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
     * ��ѯ����֧���
     * @return
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

}
