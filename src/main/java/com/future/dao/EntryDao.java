package com.future.dao;

import com.future.domain.Entry;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 条目
 * @author 牛洧鹏
 *
 */
@Repository
public interface EntryDao {

    void add(Entry entry);

    void  deleteById(Integer id);

    void update(Entry entry);

    List<Entry> findAll();
    List<Entry> findByTyep(Integer type);
    Entry findById(Integer id);

    /**
     * 查询所有支出条目，类型为1
     * @return
     */
    List<Entry> getAllExpenEntry();
}
