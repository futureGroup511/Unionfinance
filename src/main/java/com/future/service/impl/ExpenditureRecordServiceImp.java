package com.future.service.impl;

import com.future.dao.ExpenditureRecordDao;
import com.future.domain.ExpenditureRecord;
import com.future.service.ExpenditureRecordService;
import com.future.utils.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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


	/**
	 * 添加支出记录
	 * @param expendRecord
	 */
	public void insert(ExpenditureRecord expendRecord) {
		eDao.insert(expendRecord);
	}

	/**
	 * 分页查询支出记录
	 * @param pageBean
	 * @return
	 */
	public PageBean getAllExpendRecord(PageBean pageBean) {
		//1、总记录
		List<ExpenditureRecord> expendList = eDao.getAllExpendList(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize());
		//2.总记录数量
		int count = eDao.getAllExpendListNum();
		pageBean.setRecordlist(expendList);
		pageBean.setRecordCount(count);
		System.out.println(expendList);
		System.out.println(count);
		return pageBean;
	}

	/**
	 * 查询总金额
	 * @return
	 */
	public Double getAllExpendSumMoney() {
		return eDao.getAllExpendSumMoney();
	}
}
