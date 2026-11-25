package com.studymatch.backend_api.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studymatch.backend_api.service.ReportService;

@Controller
public class AdminUIController {

    private final ReportService reportService;

    public AdminUIController(ReportService reportService) {
        this.reportService = reportService;
    }

    @GetMapping("/admin")
    public String adminDashboard() {
        return "admin";
    }

    @GetMapping("/reported-users")
    public String reportedUsers(Model model) {
        model.addAttribute("reports", reportService.getAllReports());
        return "reported-users";
    }

    // Mark a report as viewed
    @PostMapping("/reported-users/{id}/viewed")
    @ResponseBody
    public ResponseEntity<String> markReportViewed(@PathVariable Long id) {

        return reportService.getReportById(id).map(report -> {
            report.setStatus("Viewed");
            reportService.saveReport(report);
            return ResponseEntity.ok("Viewed");
        }).orElse(ResponseEntity.notFound().build());
    }
}