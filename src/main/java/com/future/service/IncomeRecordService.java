package com.future.service;

import com.future.domain.IncomeRecord;
import com.future.utils.PageBean;

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

    /**
     * 查询所有拨款记录
     * @param pageBean 分页
     * @return
     */
    PageBean getAllIncomeRecord(PageBean pageBean);

    /**
     * 查询所有拨款的金额
     * @return
     */
    Double getAllincomeSumMonsy();

    /**
     * 条件查询所有拨款记录
     * @param date1 开始时间
     * @param date2 结束时间
     * @param un_id 工会id
     * @param en_id 条目id
     * @return
     */
    PageBean getConditionIncomeRecord(PageBean pageBean,String date1, String date2, Integer un_id, Integer en_id);

    /**
     * 条件查询金额
     * @param date1 开始日期
     * @param date2 结束日期
     * @param un_id 工会id
     * @param en_id 条目id
     * @return
     */
    Double getConditionIncomeRecordSumMoney(String date1, String date2, Integer un_id, Integer en_id);

    int countAllIncome(Integer unionId);

    /**
     * 公会所有拨款的总和
     * @param id
     * @return
     */
    Double sumMoney(Integer id);

}
