
package com.studymatch.backend_api.service;

import java.util.List;
import java.util.Optional;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.studymatch.backend_api.entity.StudyGroup;
import com.studymatch.backend_api.repository.StudyGroupRepository;
import com.studymatch.backend_api.entity.Student;
import com.studymatch.backend_api.repository.StudentRepository;
import com.studymatch.backend_api.entity.Course;

@Service
public class StudyGroupService {

    private final StudyGroupRepository studyGroupRepository;
    private final StudentRepository studentRepository;

    public StudyGroupService(StudyGroupRepository studyGroupRepository,
                             StudentRepository studentRepository) {
        this.studyGroupRepository = studyGroupRepository;
        this.studentRepository = studentRepository;
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
    
    @Transactional
    public boolean joinStudyGroup(Long groupId, Long studentId) {
        Optional<StudyGroup> groupOptional =
                studyGroupRepository.findById(groupId);

        Optional<Student> studentOptional =
                studentRepository.findById(studentId);

        if (groupOptional.isEmpty() || studentOptional.isEmpty()) {
            return false;
        }

        StudyGroup group = groupOptional.get();
        Student student = studentOptional.get();

        group.getMembers().add(student);
        studyGroupRepository.save(group);

        return true;
    }

    @Transactional(readOnly = true)
    public Optional<List<Map<String, Object>>> getGroupMembers(Long groupId) {
        return studyGroupRepository.findById(groupId).map(group -> {
            List<Map<String, Object>> members = new ArrayList<>();

            for (Student student : group.getMembers()) {
                members.add(Map.of(
                    "id", student.getId(),
                    "name", student.getName(),
                    "email", student.getEmail()
                ));
            }

            return members;
        });
    }

    @Transactional(readOnly = true)
    public Optional<List<StudyGroup>> getGroupsForStudent(Long studentId) {

        return studentRepository.findById(studentId).map(student -> {

            Set<Long> courseIds = student.getCourses()
                    .stream()
                    .map(Course::getId)
                    .collect(Collectors.toSet());

            if (courseIds.isEmpty()) {
                return List.<StudyGroup>of();
            }

            return studyGroupRepository.findByCourseIdIn(
                    new java.util.ArrayList<>(courseIds)
            );
        });
    }

}


