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
