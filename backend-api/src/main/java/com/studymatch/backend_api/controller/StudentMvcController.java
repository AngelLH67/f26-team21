
package com.studymatch.backend_api.controller;

import com.studymatch.backend_api.entity.Student;
import com.studymatch.backend_api.service.StudentService;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/student")
public class StudentMvcController {

    private final StudentService studentService;

    public StudentMvcController(StudentService studentService) {
        this.studentService = studentService;
    }

    // Display the Create Profile page
    @GetMapping("/create-profile")
    public String showCreateProfile(
            @RequestParam(required = false) Long createdId,
            Model model) {

        if (createdId != null) {
            studentService.getStudentById(createdId)
                    .ifPresent(student ->
                            model.addAttribute("savedStudent", student));
        }

        return "student/create-profile";
    }

    // Process the Create Profile form
    @PostMapping("/create-profile")
    public String createProfile(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String major,
            @RequestParam String year,
            @RequestParam String studyStyle,
            @RequestParam String groupSize,
            @RequestParam(required = false, defaultValue = "") String bio,
            @RequestParam(required = false, defaultValue = "") String availability,
            Model model) {

        if (name.isBlank() || email.isBlank()
                || password.isBlank()) {
            model.addAttribute("errorMessage",
                    "Name, email, and password are required.");
            return "student/create-profile";
        }

        Student student = new Student();

        student.setName(name.trim());
        student.setEmail(email.trim());
        student.setPassword(password);

        student.setMajor(major);
        student.setClassYear(year);
        student.setStudyPreferences(studyStyle);
        student.setPreferredGroupSize(groupSize);
        student.setBio(bio);
        student.setAvailability(availability);

        try {
            Student savedStudent = studentService.saveStudent(student);

            return "redirect:/student/create-profile?createdId="
                    + savedStudent.getId();

        } catch (DataIntegrityViolationException exception) {
            model.addAttribute("errorMessage",
                    "Unable to create profile. The email may already be registered.");
            return "student/create-profile";
        }
    }


    // Display the Edit Profile page using real database data
    @GetMapping("/edit-profile")
    public String showEditProfile(
            @RequestParam(required = false) Long id,
            @RequestParam(required = false) String updated,
            Model model) {

        if (id == null) {
            model.addAttribute("errorMessage",
                    "Please create a profile before editing.");
            return "student/profile-error";
        }

        return studentService.getStudentById(id)
                .map(student -> {
                    model.addAttribute("student", student);

                    if ("true".equals(updated)) {
                        model.addAttribute("successMessage",
                                "Your changes have been saved!");
                    }

                    return "student/edit-profile";
                })
                .orElseGet(() -> {
                    model.addAttribute("errorMessage",
                            "Student profile not found.");
                    return "student/profile-error";
                });
    }

    // Process the Edit Profile form
    @PostMapping("/edit-profile")
    public String updateProfile(
            @RequestParam Long id,
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String major,
            @RequestParam String year,
            @RequestParam String studyStyle,
            @RequestParam String groupSize,
            @RequestParam(required = false, defaultValue = "") String bio,
            @RequestParam(required = false, defaultValue = "") String availability,
            Model model,
            RedirectAttributes redirectAttributes) {

        Student updatedStudent = new Student();

        updatedStudent.setName(name.trim());
        updatedStudent.setEmail(email.trim());
        updatedStudent.setMajor(major.trim());
        updatedStudent.setClassYear(year);
        updatedStudent.setStudyPreferences(studyStyle);
        updatedStudent.setPreferredGroupSize(groupSize);
        updatedStudent.setBio(bio);
        updatedStudent.setAvailability(availability);

        if (name.isBlank() || email.isBlank()
                || !email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {

            updatedStudent.setId(id);
            model.addAttribute("student", updatedStudent);
            model.addAttribute("errorMessage",
                    "Please enter a name and valid email address.");
            return "student/edit-profile";
        }

        try {
            return studentService.updateStudent(id, updatedStudent)
                    .map(savedStudent -> {
                        redirectAttributes.addAttribute(
                                "id", savedStudent.getId());
                        redirectAttributes.addAttribute("updated", "true");
                        return "redirect:/student/edit-profile";
                    })
                    .orElseGet(() -> {
                        model.addAttribute("errorMessage",
                                "Student profile not found.");
                        return "student/profile-error";
                    });

        } catch (DataIntegrityViolationException exception) {
            updatedStudent.setId(id);
            model.addAttribute("student", updatedStudent);
            model.addAttribute("errorMessage",
                    "Unable to save changes. This email may already be registered.");
            return "student/edit-profile";
        }
    }

}
