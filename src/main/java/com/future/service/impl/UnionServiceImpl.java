package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.UnionDao;
import com.future.service.UnionService;

/**
 * π§ª·
 * @author ≈£‰¢≈Ù
 *
 */
@Service
@Transactional
public class UnionServiceImpl implements UnionService{

	@Autowired
	private UnionDao unionDao;
}
