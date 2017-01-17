package com.future.service;

import com.future.domain.ExpenditureRecord;
import com.future.utils.PageBean;

import java.util.List;
import java.util.Map;

/**
 * Ö§ï¿½ï¿½ï¿½ï¿½Â¼
 * @author Å£ï¿½ï¿½ï¿?
 *
 */
public interface ExpenditureRecordService {

    int queryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    int countAllExpense(Integer unionId);

    /**
     * ï¿½ï¿½ï¿½Ö§ï¿½ï¿½ï¿½ï¿½Â?
     * @param expendRecord
     */
    void insert(ExpenditureRecord expendRecord);

    /**
     * ï¿½ï¿½Ò³ï¿½ï¿½Ñ¯ï¿½ï¿½ï¿½ï¿½Ö§ï¿½ï¿½ï¿½ï¿½Â¼
     * @param pageBean
     * @return
     */
    PageBean getAllExpendRecord(PageBean pageBean);

    /**
     * ²éÑ¯ËùÓÐÖ§½ð¶î
     */
    Double getAllExpendSumMoney();

    /**
     * Ö§³ö¼ÇÂ¼Ìõ¼þ²éÑ¯
     * @param pageBean
     * @param date3
     * @param date4
     * @param un_id
     * @param en_id
     * @return
     */
    PageBean getConditionExpendRecord(PageBean pageBean, String date3, String date4, Integer un_id, Integer en_id);

    /**
     * Ìõ¼þ²éÑ¯Ö§³ö½ð¶î
     * @return
     */
    Double getConditionExpendSumMoney(String date1,String date2,Integer un_id, Integer en_id);

}
