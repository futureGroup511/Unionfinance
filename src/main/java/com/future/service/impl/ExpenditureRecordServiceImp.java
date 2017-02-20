package com.future.service.impl;

import com.future.domain.ExpenditureRecord;
import com.future.dao.ExpenditureRecordDao;
import com.future.service.ExpenditureRecordService;
import com.future.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import java.util.Map;

/**
 * 支出记录
 * @author 牛洧鹏
 *
 */
@Service
@Transactional
public class ExpenditureRecordServiceImp  implements ExpenditureRecordService{

	@Autowired
	private ExpenditureRecordDao eDao;

	public Integer queryExpenseRecordCount(Map<String, Object> paramMap) {
		return eDao.meQueryExpenseRecordCount(paramMap);
	}

	public List<ExpenditureRecord> queryExpenseRecord(Map<String, Object> paramMap) {
		return eDao.queryExpenseRecord(paramMap);
	}

    public Integer countAllExpense(Integer unionId) {
        return eDao.countAllExpense(unionId);
    }

	/**
	 * 添加支出记录
	 * @param expendRecord
	 */
	public void insert(ExpenditureRecord expendRecord) {
		eDao.insert(expendRecord);
	}

	/**
	 * 分页查询所有支出记录
	 * @param pageBean
	 * @return
	 */
	public PageBean getAllExpendRecord(PageBean pageBean) {
		List<ExpenditureRecord> expendList = eDao.getAllExpendList(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize());
		int count = eDao.getAllExpendListNum();
		pageBean.setRecordlist(expendList);
		pageBean.setRecordCount(count);
		System.out.println(expendList);
		System.out.println(count);
		return pageBean;
	}

	/**
	 * 查询所有支金额
	 * @return
	 */
	public Double getAllExpendSumMoney() {
		return eDao.getAllExpendSumMoney();
	}

	/**
	 * 支出记录条件查询
	 * @param pageBean
	 * @param date3
	 * @param date4
	 * @param un_id
	 * @param en_id
	 * @return
	 */
	public PageBean getConditionExpendRecord(PageBean pageBean, String date3, String date4, Integer un_id, Integer en_id) {
		List<ExpenditureRecord> expendList = eDao.getConditionExpendRecord(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize(),date3,date4,un_id,en_id);
		int count = eDao.getConditionExpendCount(date3,date4,un_id,en_id);
		pageBean.setRecordlist(expendList);
		pageBean.setRecordCount(count);
		return pageBean;
	}

	/**
	 * 条件查询支出金额
	 * @return
	 */
	public Double getConditionExpendSumMoney(String date1, String date2, Integer un_id, Integer en_id) {
		return eDao.getConditionExpendSumMoney(date1,date2,un_id,en_id);
	}

	public Double sumExMoney(Integer id) {
		return eDao.sumExMoney(id);
	}
}
