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
     * 查询所有支出解
     * @return
     */
    Double getAllExpendSumMoney();
}
