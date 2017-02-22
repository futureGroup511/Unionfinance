package com.future.service.impl;

import com.future.domain.IncomeRecord;
import com.future.utils.Balance;
import com.future.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.IncomeRecordDao;
import com.future.service.IncomeRecordService;

import java.util.List;
import java.util.Map;

/**
 * �����¼
 * @author ţ���
 *
 */
@Service
@Transactional
public class IncomeRecordServiceImp implements IncomeRecordService {

	@Autowired
	private IncomeRecordDao incomeRecordDao;

	public void add(IncomeRecord incomeRecord) {
		incomeRecordDao.add(incomeRecord);
	}

    public Integer queryIncomeRecordsCount(Map<String, Object> paramMap) {
        return incomeRecordDao.meQueryIncomeRecordsCount(paramMap);
    }

    public List<IncomeRecord> queryIncomeRecords(Map<String, Object> paramMap) {
		return incomeRecordDao.queryIncomeRecords(paramMap);
	}

	/**
	 * 查询所有拨款记录
	 * @param pageBean
	 * @return
	 */
	public PageBean getAllIncomeRecord(PageBean pageBean) {
		List<IncomeRecord> incomeRecordList = incomeRecordDao.getAllIncomeRecord(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize());
		int count = incomeRecordDao.getAllIncomeRecordCount();
		pageBean.setRecordlist(incomeRecordList);
		pageBean.setRecordCount(count);
		return pageBean;
	}

	/**
	 * 查询所有拨款的金额
	 * @return
	 */
	public Double getAllincomeSumMonsy() {
		return incomeRecordDao.getAllincomeSumMonsy();
	}

	/**
	 * 条件查询所有拨款记录
	 * @param date1 开始时间
	 * @param date2 结束时间
	 * @param un_id 工会id
	 * @param en_id 条目id
	 * @return
	 */
	public PageBean getConditionIncomeRecord(PageBean pageBean,String date1, String date2, Integer un_id, Integer en_id) {
		List<IncomeRecord> incomeRecordList = incomeRecordDao.getConditionIncomeRecord(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize(),date1,date2,un_id,en_id);
		int count = incomeRecordDao.getConditionIncomeRecordCount(date1,date2,un_id,en_id);
		pageBean.setRecordlist(incomeRecordList);
		pageBean.setRecordCount(count);
		return pageBean;
	}

	/**
	 * 条件查询金额
	 * @param date1 开始日期
	 * @param date2 结束日期
	 * @param un_id 工会id
	 * @param en_id 条目id
	 * @return
	 */
	public Double getConditionIncomeRecordSumMoney(String date1, String date2, Integer un_id, Integer en_id) {
		return incomeRecordDao.getConditionIncomeRecordSumMoney(date1, date2, un_id, en_id);
	}

	public Integer countAllIncome(Integer unionId) {
		return incomeRecordDao.countAllIncome(unionId);
	}

	/**
	 * 查询余额
	 * @return
	 */
	public List<Balance> getBalance() {
		return incomeRecordDao.getBalance();
	}

	public Double sumMoney(Integer id) {
		Double money = incomeRecordDao.sumMoney(id);
		if(money == null) money = 0.0;
		return money;
	}
}
