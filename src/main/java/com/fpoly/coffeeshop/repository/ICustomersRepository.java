package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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

	@Query(value = "select * from customers c "
			 + "where (c.fullname like %?1% or c.email like %?1% or c.address like %?1% or c.phone like %?1%) "
			 + "and c.flag_delete = ?2", nativeQuery = true)
	public Page<CustomersEntity> search(String key, Boolean flagDelete, Pageable pageable);
	
}
