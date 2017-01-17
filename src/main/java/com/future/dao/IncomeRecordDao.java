package com.future.dao;

import com.future.domain.IncomeRecord;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Date;
import java.util.Map;

/**
 * �����¼
 * @author ţ���
 *
 */
@Repository
public interface IncomeRecordDao {

    void add(IncomeRecord incomeRecord);

    //得到指定条件下 记录的数量
    int queryIncomeRecordsCount(Map<String, Object> paramMap);

    List<IncomeRecord> queryIncomeRecords(Map<String, Object> paramMap);

    int countAllIncome(Integer unionId);
}
