
package com.studymatch.backend_api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.studymatch.backend_api.entity.StudyGroup;
import com.studymatch.backend_api.repository.StudyGroupRepository;

@Service
public class StudyGroupService {

    private final StudyGroupRepository studyGroupRepository;

    public StudyGroupService(StudyGroupRepository studyGroupRepository) {
        this.studyGroupRepository = studyGroupRepository;
    }

    public List<StudyGroup> getAllStudyGroups() {
        return studyGroupRepository.findAll();
    }

    public Optional<StudyGroup> getStudyGroupById(Long id) {
        return studyGroupRepository.findById(id);
    }

    public StudyGroup saveStudyGroup(StudyGroup studyGroup) {
        return studyGroupRepository.save(studyGroup);
    }

    public boolean deleteStudyGroup(Long id) {
        if (studyGroupRepository.existsById(id)) {
            studyGroupRepository.deleteById(id);
            return true;
        }

        return false;
    }
}


