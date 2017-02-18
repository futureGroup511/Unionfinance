package com.future.service.impl;

import com.future.domain.Entry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.EntryDao;
import com.future.service.EntryService;

import java.util.List;

/**
 * 条目
 *
 *
 */
@Service
@Transactional
public class EntryServiceImp implements EntryService {

	@Autowired
	private EntryDao entryDao;

	public void add(Entry entry) {
		entryDao.add(entry);
	}

	public void deleteById(Integer id) {
		entryDao.deleteById(id);
	}

	public void update(Entry entry) {
		entryDao.update(entry);
	}

	public List<Entry> findAll() {
		return entryDao.findAll();
	}

	public Entry findById(Integer id) {
		return entryDao.findById(id);
	}

	public List<Entry> findByTyep(Integer type) {
		return entryDao.findByTyep(type);
	}


	/**
	 * 查询所有支出条目，类型为1
	 * @return
	 */
	public List<Entry> getAllExpenEntry() {
		return entryDao.getAllExpenEntry();
	}

	/**
	 *  查询所有拨款条目，类型为0
	 *
	 */
	public List<Entry> getAllIncomeEntry() {
		return entryDao.getAllIncomeEntry();
	}
}
