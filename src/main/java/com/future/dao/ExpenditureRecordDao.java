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
     * ���֧����¼
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);
}
