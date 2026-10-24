
package com.studymatch.backend_api.entity;

import java.time.LocalDateTime;

import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.JoinTable;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class StudyGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String groupName;

    private String status;

    private LocalDateTime meetingTime;

    @ManyToOne
    @JoinColumn(name = "course_id")
    private Course course;

    
    @ManyToOne
    @JoinColumn(name = "creator_id")
    @JsonIgnoreProperties({"courses", "password"})
    private Student creator;

    @ManyToMany
    @JoinTable(
        name = "study_group_members",
        joinColumns = @JoinColumn(name = "study_group_id"),
        inverseJoinColumns = @JoinColumn(name = "student_id")
    )
    @JsonIgnore
    private Set<Student> members = new HashSet<>();


    public StudyGroup() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getMeetingTime() {
        return meetingTime;
    }

    public void setMeetingTime(LocalDateTime meetingTime) {
        this.meetingTime = meetingTime;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Student getCreator() {
        return creator;
    }

    public void setCreator(Student creator) {
        this.creator = creator;
    }

    
    public Set<Student> getMembers() {
        return members;
    }

    public void setMembers(Set<Student> members) {
        this.members = members;
    }

}

