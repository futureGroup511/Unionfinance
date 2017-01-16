package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

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

    /**
     * 分页查询支出记录
     * @return
     */
    List<ExpenditureRecord> getAllExpendList(int a,Integer b);

    /**
     * 查询支出总记录数量
     * @return
     */
    int getAllExpendListNum();

    /**
     * 查询支出总金额
     * @return
     */
    Double getAllExpendSumMoney();
}
