
package com.studymatch.backend_api.controller;

import java.util.List;

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
        studyGroupService.deleteStudyGroup(id);
    }
}


