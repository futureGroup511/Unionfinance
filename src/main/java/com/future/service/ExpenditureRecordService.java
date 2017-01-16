package com.future.service;

import com.future.domain.ExpenditureRecord;

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
}
