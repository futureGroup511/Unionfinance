package com.future.dao;

import com.future.domain.IncomeRecord;
import org.springframework.stereotype.Repository;

/**
 * �����¼
 * @author ţ���
 *
 */
@Repository
public interface IncomeRecordDao {

    void add(IncomeRecord incomeRecord);

}
