package com.future.dao;

import com.future.domain.IncomeRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
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

    /**
     * 查询所有拨款记录
     * @return
     */
    List<IncomeRecord> getAllIncomeRecord(int a, Integer b);

    /**
     * 查询所有拨款记录得数量
     * @return
     */
    int getAllIncomeRecordCount();

    /**
     * 查询所有拨款的金额
     * @return
     */
    Double getAllincomeSumMonsy();

    /**
     * 条件查询所有拨款记录
     * @param a 开始条数
     * @param b 结束条数
     * @param date3 开始时间
     * @param date4 结束时间
     * @param un_id 工会id
     * @param en_id 条目id
     * @return
     */
    List<IncomeRecord> getConditionIncomeRecord(@Param("a") int a, @Param("b") Integer b, @Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    /**
     * 条件查询所有拨款记录总条数
     * @param date3 开始时间
     * @param date4 结束时间
     * @param un_id 工会id
     * @param en_id 条目id
     * @return
     */
    int getConditionIncomeRecordCount(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    /**
     * 条件查询金额
     * @param date1 开始日期
     * @param date2 结束日期
     * @param un_id 工会id
     * @param en_id 条目id
     * @return
     */
    Double getConditionIncomeRecordSumMoney(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);
}
