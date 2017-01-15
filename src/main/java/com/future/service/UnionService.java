package com.future.service;

import com.future.domain.Union;

import java.util.List;

/**
 * π§ª·
 * @author ≈£‰¢≈Ù
 *
 */
public interface UnionService {


    void add(Union union);

    void deleteById(Integer id);

    void update(Union union);

    List<Union> findAllOrByid(Integer id);
}
