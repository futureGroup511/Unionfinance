package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.UnionDao;
import com.future.service.UnionService;

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
}
