package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.EntryDao;
import com.future.service.EntryService;

/**
 * ÌõÄ¿
 * @author Å£ä¢Åô
 *
 */
@Service
@Transactional
public class EntryServiceImp implements EntryService {

	@Autowired
	private EntryDao entryDao;
}
