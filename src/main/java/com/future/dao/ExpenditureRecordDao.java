package com.future.dao;

import com.future.domain.ExpenditureRecord;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * ֧����¼
 * @author ţ���
=======

/**
 * ??????
 * @author ????
>>>>>>> 9251dde0026fa373a472bd882aa66ba7b214b56b
 *
 */
@Repository
public interface ExpenditureRecordDao {

    int queryExpenseRecordCount(Map<String,Object> paramMap);

    List<ExpenditureRecord> queryExpenseRecord(Map<String,Object> paramMap);

    int countAllExpense(Integer unionId);
    /**
     * ���֧����¼
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
     * ��ѯ֧���ܽ��
     * @return
     */
    Double getAllExpendSumMoney();
}
