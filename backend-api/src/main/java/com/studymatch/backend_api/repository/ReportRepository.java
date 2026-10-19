
package com.studymatch.backend_api.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studymatch.backend_api.entity.Report;

public interface ReportRepository extends JpaRepository<Report, Long> {

    boolean existsByStudyGroup_Id(Long studyGroupId);
}

