package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.CustomersEntity;


@Repository
public interface ICustomersRepository extends JpaRepository<CustomersEntity, Long> {

	public CustomersEntity findOneByFullname(String fullname);
	
	public List<CustomersEntity> findAllByFlagDeleteIs(Boolean flagDelete);
	
	public Page<CustomersEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);
	
	public List<CustomersEntity> findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(String fullname, String email,
			String phone, String address);

	public Page<CustomersEntity> findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(String fullname, String email, String phone, 
			String address, Pageable pageable);

	public List<CustomersEntity> findAllByFlagDeleteIsAndFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(Boolean flagDelete, String fullname,
			String email, String phone, String address);

	public Page<CustomersEntity> findAllByFlagDeleteIsAndFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(Boolean flagDelete, String fullname, 
		String email, String phone, 
		String address, Pageable pageable);

	
}
