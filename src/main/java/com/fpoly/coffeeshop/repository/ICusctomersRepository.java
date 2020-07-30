package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CustomersEntity;


@Repository
public interface ICusctomersRepository extends JpaRepository<CustomersEntity, Long> {

	
	public List<CustomersEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<CustomersEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<CustomersEntity> findAllByFullnameContaining(String fullname);
	
	public Page<CustomersEntity> findAllByFullnameContaining(String fullname, Pageable pageable);
	
	public List<CustomersEntity> findAllByAddressContaining(String address);
	
	public Page<CustomersEntity> findAllByAddressContaining(String address, Pageable pageable);
	
	public List<CustomersEntity> findAllByEmailContaining(String email);
	
	public Page<CustomersEntity> findAllByEmailContaining(String email, Pageable pageable);
	
	public List<CustomersEntity> findAllByPhoneContaining(String phone);
	
	public Page<CustomersEntity> findAllByPhoneContaining(String phone, Pageable pageable);
	
	public List<CustomersEntity> findAllByFlagDeleteIsAndFullnameContainingOrAddressContainingOrEmailContainingOrPhoneContaining(Boolean flagDelete, String fullname, String address, String email, String phone);
	
	public Page<CustomersEntity> findAllByFlagDeleteIsAndFullnameContainingOrAddressContainingOrEmailContainingOrPhoneContaining(Boolean flagDelete, String fullname, String address, String email, String phone, Pageable pageable);
	
}
