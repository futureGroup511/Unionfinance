package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ExpenditureRecordDao {

    Integer meQueryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    Integer countAllExpense(Integer unionId);
    /**
     * ���֧�����?
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);

    /**
     * ��ҳ��ѯ֧����¼
     * @return
     */
    List<ExpenditureRecord> getAllExpendList(int a,Integer b);

    /**
     * ��ѯ֧���ܼ�¼����
     * @return
     */
    int getAllExpendListNum();

    /**
     * ��ѯ֧���ܽ��?
     * @return
     */
    Double getAllExpendSumMoney();

    /**
     * ֧����¼������ѯ
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
     * ֧����¼������ѯ==>�����ܼ�¼����
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    int getConditionExpendCount(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    /**
     * * ֧����¼������ѯ==>�����ܽ��
     * ������ѯ֧�����
     * @return
     */
    Double getConditionExpendSumMoney(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    Double sumExMoney(Integer id);
}
