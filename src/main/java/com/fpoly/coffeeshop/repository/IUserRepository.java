package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.UserEntity;

@Repository
public interface IUserRepository extends JpaRepository<UserEntity, Long> {

	public UserEntity findOneByUsername(String username);
	
	public List<UserEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<UserEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<UserEntity> findAllByUsernameLike(String username);
	
	public Page<UserEntity> findAllByUsernameLike(String username, Pageable pageable);
	
}
