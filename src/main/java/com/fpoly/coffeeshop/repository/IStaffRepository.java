package com.fpoly.coffeeshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fpoly.coffeeshop.entity.StaffEntity;
import com.fpoly.coffeeshop.entity.UserEntity;

@Repository
public interface IStaffRepository extends JpaRepository<StaffEntity, Long> {

	public StaffEntity findOneByUser(UserEntity user);
	
	public List<StaffEntity> findAllByFlagDeleteIs(Boolean flagDelete);

	public Page<StaffEntity> findAllByFlagDeleteIs(Boolean flagDelete, Pageable pageable);

	public List<StaffEntity> findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(
			String fullname, String email, String phone, String address);

	public Page<StaffEntity> findAllByFullnameContainingOrEmailContainingOrPhoneContainingOrAddressContaining(
			String fullname, String email, String phone, String address, Pageable pageable);

	@Query(value = "select * from staffs s "
				 + "where (s.fullname like %?1% or s.email like %?1% or s.address like %?1% or s.phone like %?1%) "
				 + "and s.flag_delete = ?2", nativeQuery = true)
	public Page<StaffEntity> search(String key, Boolean flagDelete, Pageable pageable);
	
}