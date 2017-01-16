package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.springframework.stereotype.Repository;

/**
 * ??????
 * @author ????
 *
 */
@Repository
public interface ExpenditureRecordDao {

    /**
     * 添加支出记录
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);
}
