package com.example.dreampicturespring.repository;

import com.example.dreampicturespring.vo.Membershiptbl;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Membershiptbl,Long> {
}
