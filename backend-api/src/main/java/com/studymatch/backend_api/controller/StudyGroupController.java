
package com.studymatch.backend_api.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.ResponseEntity;

import com.studymatch.backend_api.entity.StudyGroup;
import com.studymatch.backend_api.service.StudyGroupService;

@RestController
@RequestMapping("/api/study-groups")
public class StudyGroupController {

    private final StudyGroupService studyGroupService;

    public StudyGroupController(StudyGroupService studyGroupService) {
        this.studyGroupService = studyGroupService;
    }

    @GetMapping
    public List<StudyGroup> getAllStudyGroups() {
        return studyGroupService.getAllStudyGroups();
    }

    @GetMapping("/{id}")
    public StudyGroup getStudyGroupById(@PathVariable Long id) {
        return studyGroupService.getStudyGroupById(id)
                .orElseThrow(() -> new ResponseStatusException(
                        HttpStatus.NOT_FOUND, "Study group not found"));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public StudyGroup createStudyGroup(@RequestBody StudyGroup studyGroup) {
        return studyGroupService.saveStudyGroup(studyGroup);
    }

    
    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteStudyGroup(@PathVariable Long id) {
        boolean deleted = studyGroupService.deleteStudyGroup(id);

        if (!deleted) {
            throw new ResponseStatusException(
                    HttpStatus.NOT_FOUND, "Study group not found");
        }
    }

    @PostMapping("/{groupId}/members/{studentId}")
    public ResponseEntity<Map<String, String>> joinStudyGroup(
            @PathVariable Long groupId,
            @PathVariable Long studentId) {

        boolean joined = studyGroupService.joinStudyGroup(groupId, studentId);

        if (!joined) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok(
                Map.of("message", "Student joined study group successfully")
        );
    }

    @GetMapping("/{groupId}/members")
    public ResponseEntity<List<Map<String, Object>>> getGroupMembers(
            @PathVariable Long groupId) {

        return studyGroupService.getGroupMembers(groupId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

}


