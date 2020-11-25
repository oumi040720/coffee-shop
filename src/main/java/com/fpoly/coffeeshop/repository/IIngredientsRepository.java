package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.IngredientsEntity;

@Repository
public interface IIngredientsRepository extends JpaRepository<IngredientsEntity, Integer> {

	public IngredientsEntity findOneByName(String name);

	public List<IngredientsEntity> findAllByName(String ingredientCode);

	public Page<IngredientsEntity> findAllByName(String ingredient, Pageable pageable);

	public List<IngredientsEntity> findByFlagDeleteIs(Boolean flagDelete);

	public Page<IngredientsEntity> findByFlagDeleteIs(Boolean flagDelete, Pageable pageable);

}
