package com.future.service.impl;

import com.future.domain.Union;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.UnionDao;
import com.future.service.UnionService;

import java.util.List;

/**
 * ����
 * @author ţ���
 *
 */
@Service
@Transactional
public class UnionServiceImpl implements UnionService{

	@Autowired
	private UnionDao unionDao;

	public void add(Union union) {
		unionDao.add(union);
	}

	public void deleteById(Integer id) {
		unionDao.deleteById(id);
	}

	public void update(Union union) {
		unionDao.update(union);
	}

	public List<Union> findAll() {
		return unionDao.findAll();
	}

	public Union findById(Integer id) {
		return unionDao.findById(id);
	}
}
