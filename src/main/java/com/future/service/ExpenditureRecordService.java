package com.future.service;

import com.future.domain.ExpenditureRecord;
import com.future.utils.PageBean;

/**
 * 支出记录
 * @author 牛洧鹏
 *
 */
public interface ExpenditureRecordService {


    /**
     * 添加支出记录
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);

    /**
     * 分页查询所有支出记录
     * @param pageBean
     * @return
     */
    PageBean getAllExpendRecord(PageBean pageBean);

    /**
     * 查询所有支金额
     * @return
     */
    Double getAllExpendSumMoney();

    /**
     * 支出记录条件查询
     * @param pageBean
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    PageBean getConditionExpendRecord(PageBean pageBean, String date3, String date4, Integer un_id, Integer en_id);

    /**
     * 条件查询支出金额
     * @return
     */
    Double getConditionExpendSumMoney(String date1,String date2,Integer un_id, Integer en_id);

}
