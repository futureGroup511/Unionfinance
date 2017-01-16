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
 * ֧����¼
 * @author ţ���
 *
 */
@Service
@Transactional
public class ExpenditureRecordServiceImp  implements ExpenditureRecordService{

	@Autowired
	private ExpenditureRecordDao eDao;


	/**
	 * ���֧����¼
	 * @param expendRecord
	 */
	public void insert(ExpenditureRecord expendRecord) {
		eDao.insert(expendRecord);
	}

	/**
	 * ��ҳ��ѯ֧����¼
	 * @param pageBean
	 * @return
	 */
	public PageBean getAllExpendRecord(PageBean pageBean) {
		//1���ܼ�¼
		List<ExpenditureRecord> expendList = eDao.getAllExpendList(((pageBean.getCurrentPage()-1)*pageBean.getPageSize()),pageBean.getPageSize());
		//2.�ܼ�¼����
		int count = eDao.getAllExpendListNum();
		pageBean.setRecordlist(expendList);
		pageBean.setRecordCount(count);
		System.out.println(expendList);
		System.out.println(count);
		return pageBean;
	}

	/**
	 * ��ѯ�ܽ��
	 * @return
	 */
	public Double getAllExpendSumMoney() {
		return eDao.getAllExpendSumMoney();
	}
}
