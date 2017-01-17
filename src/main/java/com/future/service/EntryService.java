package com.future.service;

import com.future.domain.Entry;

import java.util.List;

/**
 * 条目
 * @author 牛洧鹏
 *
 */
public interface EntryService {

    void add(Entry entry);

    void  deleteById(Integer id);

    void update(Entry entry);

    List<Entry> findAll();

    Entry findById(Integer id);

    List<Entry> findByTyep(Integer type);

    /**
     * 查询所有支出条目，类型为1
     * @return
     */
    List<Entry> getAllExpenEntry();
}
