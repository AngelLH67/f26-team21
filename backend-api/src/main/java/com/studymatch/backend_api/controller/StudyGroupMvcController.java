
package com.studymatch.backend_api.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.studymatch.backend_api.entity.Course;
import com.studymatch.backend_api.entity.Student;
import com.studymatch.backend_api.entity.StudyGroup;
import com.studymatch.backend_api.repository.CourseRepository;
import com.studymatch.backend_api.service.StudentService;
import com.studymatch.backend_api.service.StudyGroupService;

@Controller
public class StudyGroupMvcController {

    private final StudyGroupService studyGroupService;
    private final StudentService studentService;
    private final CourseRepository courseRepository;

    public StudyGroupMvcController(
            StudyGroupService studyGroupService,
            StudentService studentService,
            CourseRepository courseRepository) {

        this.studyGroupService = studyGroupService;
        this.studentService = studentService;
        this.courseRepository = courseRepository;
    }

    // Display the Create Study Group page
    @GetMapping("/student/create-group")
    public String showCreateGroup(
            @RequestParam(required = false) Long studentId,
            @RequestParam(required = false) Long createdId,
            Model model) {

        if (studentId == null) {
            model.addAttribute("errorMessage",
                    "Please create a student profile first.");
            return "student/profile-error";
        }

        Student student = studentService.getStudentById(studentId)
                .orElse(null);

        if (student == null) {
            model.addAttribute("errorMessage",
                    "Student profile not found.");
            return "student/profile-error";
        }

        model.addAttribute("student", student);
        model.addAttribute("courses", courseRepository.findAll());

        if (createdId != null) {
            studyGroupService.getStudyGroupById(createdId)
                    .filter(group ->
                            group.getCreator() != null &&
                            studentId.equals(group.getCreator().getId()))
                    .ifPresent(group ->
                            model.addAttribute("createdGroup", group));
        }

        return "student/create-group";
    }

    // Save a new Study Group to Neon
    @PostMapping("/student/create-group")
    public String createGroup(
            @RequestParam Long studentId,
            @RequestParam String groupName,
            @RequestParam Long courseId,
            @RequestParam String date,
            @RequestParam String time,
            @RequestParam String location,
            @RequestParam String description,
            Model model,
            RedirectAttributes redirectAttributes) {

        Student student = studentService.getStudentById(studentId)
                .orElse(null);

        if (student == null) {
            model.addAttribute("errorMessage",
                    "Student profile not found.");
            return "student/profile-error";
        }

        model.addAttribute("student", student);
        model.addAttribute("courses", courseRepository.findAll());

        // Keep submitted values if validation fails.
        model.addAttribute("groupNameValue", groupName);
        model.addAttribute("courseIdValue", courseId);
        model.addAttribute("dateValue", date);
        model.addAttribute("timeValue", time);
        model.addAttribute("locationValue", location);
        model.addAttribute("descriptionValue", description);

        if (groupName.isBlank() || date.isBlank() ||
                time.isBlank() || location.isBlank()) {

            model.addAttribute("errorMessage",
                    "Please complete all required fields.");
            return "student/create-group";
        }

        LocalDateTime meetingTime;

        try {
            meetingTime = LocalDateTime.parse(date + "T" + time);
        } catch (DateTimeParseException exception) {
            model.addAttribute("errorMessage",
                    "Please enter a valid meeting date and time.");
            return "student/create-group";
        }

        if (meetingTime.isBefore(LocalDateTime.now())) {
            model.addAttribute("errorMessage",
                    "Please choose a future meeting date and time.");
            return "student/create-group";
        }

        Course course = courseRepository.findById(courseId)
                .orElse(null);

        if (course == null) {
            model.addAttribute("errorMessage",
                    "The selected course was not found.");
            return "student/create-group";
        }

        StudyGroup group = new StudyGroup();
        group.setGroupName(groupName.trim());
        group.setCourse(course);
        group.setCreator(student);
        group.setMeetingTime(meetingTime);
        group.setLocation(location.trim());
        group.setDescription(description.trim());
        group.setStatus("Active");

        try {
            StudyGroup saved = studyGroupService.saveStudyGroup(group);

            redirectAttributes.addAttribute(
                    "studentId", student.getId());
            redirectAttributes.addAttribute(
                    "createdId", saved.getId());

            return "redirect:/student/create-group";

        } catch (ResponseStatusException exception) {
            model.addAttribute("errorMessage",
                    "Unable to create the group. Please verify the course and student.");
            return "student/create-group";
        }
    }
}
