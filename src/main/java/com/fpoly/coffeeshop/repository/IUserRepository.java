package com.fpoly.coffeeshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.UserEntity;

@Repository
public interface IUserRepository extends JpaRepository<UserEntity, Long> {

//	public RoleEntity findOneByRoleCode(String roleCode);
	
//	public List<RoleEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
}
