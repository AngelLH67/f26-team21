
package com.studymatch.backend_api.entity;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Report {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String reason;

    private String status;

    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "study_group_id")
    private StudyGroup studyGroup;

    @ManyToOne
    @JoinColumn(name = "reported_student_id")
    private Student reportedStudent;

    @ManyToOne
    @JoinColumn(name = "reporter_id")
    private Student reporter;

    public Report() {
    }

    public Report(String reason, String status, LocalDate date) {
        this.reason = reason;
        this.status = status;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public StudyGroup getStudyGroup() {
        return studyGroup;
    }

    public void setStudyGroup(StudyGroup studyGroup) {
        this.studyGroup = studyGroup;
    }

    public Student getReportedStudent() {
        return reportedStudent;
    }

    public void setReportedStudent(Student reportedStudent) {
        this.reportedStudent = reportedStudent;
    }

    public Student getReporter() {
        return reporter;
    }

    public void setReporter(Student reporter) {
        this.reporter = reporter;
    }
}



