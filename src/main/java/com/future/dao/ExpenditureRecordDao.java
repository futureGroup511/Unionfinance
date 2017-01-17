package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ExpenditureRecordDao {

    int queryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    int countAllExpense(Integer unionId);
    /**
     * ï¿½ï¿½ï¿½Ö§ï¿½ï¿½ï¿½ï¿½Â?
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);

    /**
     * ï¿½ï¿½Ò³ï¿½ï¿½Ñ¯Ö§ï¿½ï¿½ï¿½ï¿½Â¼
     * @return
     */
    List<ExpenditureRecord> getAllExpendList(int a,Integer b);

    /**
     * ï¿½ï¿½Ñ¯Ö§ï¿½ï¿½ï¿½Ü¼ï¿½Â¼ï¿½ï¿½ï¿½ï¿½
     * @return
     */
    int getAllExpendListNum();

    /**
     * ï¿½ï¿½Ñ¯Ö§ï¿½ï¿½ï¿½Ü½ï¿½ï¿?
     * @return
     */
    Double getAllExpendSumMoney();

    /**
     * Ö§³ö¼ÇÂ¼Ìõ¼þ²éÑ¯
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
     * Ö§³ö¼ÇÂ¼Ìõ¼þ²éÑ¯==>¼ÆËã×Ü¼ÇÂ¼ÊýÁ¿
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    int getConditionExpendCount(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);

    /**
     * * Ö§³ö¼ÇÂ¼Ìõ¼þ²éÑ¯==>¼ÆËã×Ü½ð¶î
     * Ìõ¼þ²éÑ¯Ö§³ö½ð¶î
     * @return
     */
    Double getConditionExpendSumMoney(@Param("date3") String date3, @Param("date4") String date4, @Param("un_id") int un_id, @Param("en_id") int en_id);
}
