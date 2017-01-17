package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.apache.ibatis.annotations.Param;
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

    /**
     * 支出记录条件查询
     * @param
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    //List<ExpenditureRecord> getConditionExpendRecord(int a,Integer b,String date3, String date4, int un_id, int en_id);
    List<ExpenditureRecord> getConditionExpendRecord(@Param("a") int a, @Param("b") Integer b, @Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    /**
     * 支出记录条件查询==>计算总记录数量
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    int getConditionExpendCount(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    /**
     * * 支出记录条件查询==>计算总金额
     * 条件查询支出金额
     * @return
     */
    Double getConditionExpendSumMoney(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);
}
