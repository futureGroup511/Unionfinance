package com.future.dao;

import com.future.domain.Union;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * ����
 * @author ţ���
 *
 */
@Repository
public interface UnionDao {

    void add(Union union);

    void deleteById(Integer id);

    void update(Union union);

    List<Union> findAllOrByid(Integer id);
}
