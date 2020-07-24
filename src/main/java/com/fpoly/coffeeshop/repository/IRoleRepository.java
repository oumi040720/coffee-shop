package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.RoleEntity;

@Repository
public interface IRoleRepository extends JpaRepository<RoleEntity, Integer> {

	public RoleEntity findOneByRoleCode(String roleCode);
	
	public List<RoleEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
}
