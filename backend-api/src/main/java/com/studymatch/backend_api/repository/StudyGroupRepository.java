
package com.studymatch.backend_api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.studymatch.backend_api.entity.StudyGroup;

public interface StudyGroupRepository extends JpaRepository<StudyGroup, Long> {

    List<StudyGroup> findByCourseIdIn(List<Long> courseIds);

}
