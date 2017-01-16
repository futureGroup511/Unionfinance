package com.future.service;

import com.future.domain.IncomeRecord;

import java.util.List;
import java.util.Map;

/**
 * �����¼
 * @author ţ���
 *
 */
public interface IncomeRecordService {

    void add(IncomeRecord incomeRecord);
    // 按指定条件 查询收入记录的数量情况
    int queryIncomeRecordsCount(Map<String, Object> paramMap);

    //按指定条件 查询收入记录情况
    List<IncomeRecord> queryIncomeRecords(Map<String, Object> paramMap);

}
