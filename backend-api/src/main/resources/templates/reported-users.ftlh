<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Reported Users</title>

    <link rel="stylesheet" href="/student/styles.css">
    <link rel="stylesheet" href="/sysadmin/styles.css">

    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js" defer></script>
</head>

<body class="dashboard-page admin-page manage-users-page reports-page">

    <div class="app-layout">

        <aside class="sidebar">

            <a href="/admin" class="brand">
                <span class="brand-icon">
                    <i data-lucide="sprout"></i>
                </span>
                <span>StudyMatch</span>
            </a>

            <div class="sidebar-content">
                <p class="sidebar-label">ADMIN WORKSPACE</p>

                <nav class="sidebar-nav" aria-label="Admin navigation">

                    <a href="/admin" class="nav-link">
                        <i data-lucide="layout-dashboard"></i>
                        Overview
                    </a>

                    <a href="/registered-users" class="nav-link">
                        <i data-lucide="users-round"></i>
                        Registered Users
                    </a>

                    <a href="/courses" class="nav-link">
                        <i data-lucide="book-open"></i>
                        Course Listings
                    </a>

                    <a href="/remove-groups" class="nav-link">
                        <i data-lucide="messages-square"></i>
                        Study Groups
                    </a>

                    <a href="/reported-users" class="nav-link active" aria-current="page">
                        <i data-lucide="shield-alert"></i>
                        Reported Users
                    </a>

                </nav>

                <p class="sidebar-label sidebar-label-spaced">
                    QUICK ACTIONS
                </p>

                <nav class="sidebar-nav" aria-label="Quick actions">
                    <a href="/courses/new" class="nav-link">
                        <i data-lucide="plus-circle"></i>
                        Add Course
                    </a>
                </nav>
            </div>

            <div class="sidebar-bottom">
                <div class="sidebar-note">
                    <i data-lucide="heart-handshake"></i>
                    <p>Better together.</p>
                    <span>Find your people and make studying easier.</span>
                </div>
                <p class="sidebar-copyright">© 2026 StudyMatch</p>
            </div>

        </aside>

        <main class="dashboard-main">

            <div class="topbar">
                <div class="breadcrumb">
                    <span>Administration</span>
                    <i data-lucide="chevron-right"></i>
                    <strong>Reported Users</strong>
                </div>

                <span class="admin-account-icon" aria-label="Administrator">
                    <i data-lucide="shield-check"></i>
                </span>
            </div>

            <!-- INTRO -->
            <section class="courses-heading">

                <span class="eyebrow">
                    <i data-lucide="shield-alert"></i>
                    ADMIN REPORT WORKSPACE
                </span>

                <h1>Keeping our community safe.</h1>

                <p>
                    Review reports submitted about students.
                    View report details and keep track of reports
                    that have been reviewed.
                </p>

            </section>

            <!-- OVERVIEW -->
            <section class="courses-overview">

                <div class="courses-overview-icon">
                    <i data-lucide="flag"></i>
                </div>

                <div class="courses-overview-copy">
                    <span>COMMUNITY SAFETY</span>
                    <h2>Every report deserves attention.</h2>
                    <p>
                        Review submitted reports and their information
                        in one place.
                    </p>
                </div>

                <div class="courses-overview-count">
                    <strong>${reports?size}</strong>
                    <span>Total reports</span>
                </div>

            </section>

            <!-- REPORTS TABLE -->
            <section class="courses-list-section">

                <div class="courses-results-heading">
                    <div>
                        <span class="section-kicker">REPORT DIRECTORY</span>
                        <h2>Submitted reports</h2>
                        <p>Review reports submitted by StudyMatch students.</p>
                    </div>

                    <span class="courses-results-count" id="reportsCount">
                        ${reports?size} reports
                    </span>
                </div>

                <!-- SEARCH -->
                <div class="registered-users-search">
                    <i data-lucide="search"></i>
                    <input type="search" id="reportSearch" placeholder="Search by student or reason..."
                        aria-label="Search reports">
                </div>

                <!-- TABLE -->
                <div class="registered-users-table-wrap">
                    <table class="registered-users-table">

                        <thead>
                            <tr>
                                <th>Reported Student</th>
                                <th>Reported By</th>
                                <th>Reason</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody id="reportsList">

                            <#if reports?has_content>
                                <#list reports as report>
                                    <tr class="report-row">

                                        <td>
                                            <div class="registered-user-name">
                                                <span class="registered-user-avatar">
                                                    <i data-lucide="user-round"></i>
                                                </span>

                                                <strong>
                                                    <#if report.reportedStudent??>
                                                        ${report.reportedStudent.name}
                                                        <#else>
                                                            Unknown
                                                    </#if>
                                                </strong>
                                            </div>
                                        </td>

                                        <td>
                                            <#if report.reporter??>
                                                ${report.reporter.name}
                                                <#else>
                                                    Unknown
                                            </#if>
                                        </td>

                                        <td class="report-reason">
                                            ${report.reason}
                                        </td>

                                        <td>
                                            <span class="moderation-status ${report.status?lower_case}">
                                                ${report.status}
                                            </span>
                                        </td>

                                        <td>
                                            <button type="button" class="report-review-button"
                                                onclick="openReport('${report.id}')">
                                                Review
                                            </button>

                                            <div id="report-${report.id}" hidden>

                                                <p>
                                                    <strong>Reported Student:</strong>
                                                    <#if report.reportedStudent??>
                                                        ${report.reportedStudent.name}
                                                        <#else>
                                                            Unknown
                                                    </#if>
                                                </p>

                                                <p>
                                                    <strong>Student Email:</strong>
                                                    <#if report.reportedStudent??>
                                                        ${report.reportedStudent.email}
                                                        <#else>
                                                            Unknown
                                                    </#if>
                                                </p>

                                                <p>
                                                    <strong>Reported By:</strong>
                                                    <#if report.reporter??>
                                                        ${report.reporter.name}
                                                        <#else>
                                                            Unknown
                                                    </#if>
                                                </p>

                                                <p>
                                                    <strong>Reporter Email:</strong>
                                                    <#if report.reporter??>
                                                        ${report.reporter.email}
                                                        <#else>
                                                            Unknown
                                                    </#if>
                                                </p>

                                                <p><strong>Reason:</strong> ${report.reason}</p>
                                                <p><strong>Date Submitted:</strong> ${report.date}</p>
                                                <p><strong>Status:</strong> ${report.status}</p>

                                            </div>
                                        </td>

                                    </tr>
                                </#list>

                                <#else>
                                    <tr>
                                        <td colspan="5" class="registered-users-empty">
                                            <i data-lucide="shield-check"></i>
                                            <strong>No reports submitted</strong>
                                            <span>New reports will appear here.</span>
                                        </td>
                                    </tr>
                            </#if>

                            <tr id="noReportsFound" hidden>
                                <td colspan="5" class="registered-users-empty">
                                    <i data-lucide="search-x"></i>
                                    <strong>No reports found</strong>
                                    <span>Try searching with a different name or reason.</span>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

                <footer class="dashboard-footer">
                    <p>Supporting students, one connection at a time.</p>
                    <p>StudyMatch © 2026</p>
                </footer>

            </section>

        </main>

    </div>

    <!-- REPORT REVIEW POPUP -->
    <div id="reportModal" class="report-modal" hidden>
        <div class="report-modal-content">

            <button type="button" class="report-modal-close" onclick="closeReport()">
                &times;
            </button>

            <h2>Review Report</h2>
            <p>Review the information submitted about this student.</p>

            <div id="reportModalDetails"></div>

            <div class="report-modal-actions">

                <button type="button" id="markViewedButton" onclick="markAsViewed()">
                    Mark as Viewed
                </button>

                <button type="button" onclick="closeReport()">
                    Close
                </button>

            </div>

        </div>
    </div>

    <!-- JAVASCRIPT -->
    <script>

        let currentReportId = null;

        document.addEventListener("DOMContentLoaded", function () {

            if (window.lucide) {
                lucide.createIcons();
            }

            const searchInput = document.getElementById("reportSearch");
            const reportRows = document.querySelectorAll(".report-row");
            const noReportsFound = document.getElementById("noReportsFound");
            const reportCount = document.getElementById("reportsCount");

            function filterReports() {

                const query = searchInput.value.trim().toLowerCase();
                let visible = 0;

                reportRows.forEach(function (row) {

                    const student = row.cells[0].textContent.toLowerCase();
                    const reporter = row.cells[1].textContent.toLowerCase();
                    const reason = row.cells[2].textContent.toLowerCase();

                    const matches =
                        student.includes(query) ||
                        reporter.includes(query) ||
                        reason.includes(query);

                    row.hidden = !matches;

                    if (matches) {
                        visible++;
                    }
                });

                noReportsFound.hidden =
                    reportRows.length === 0 || visible !== 0;

                reportCount.textContent =
                    visible + (visible === 1 ? " report" : " reports");
            }

            searchInput.addEventListener("input", filterReports);

            filterReports();

        });


        function openReport(id) {

            currentReportId = id;

            const source = document.getElementById("report-" + id);
            const modalDetails = document.getElementById("reportModalDetails");

            modalDetails.replaceChildren();

            if (source) {
                const details = source.cloneNode(true);
                details.hidden = false;
                details.removeAttribute("id");
                modalDetails.appendChild(details);
            }

            document.getElementById("reportModal").hidden = false;

            const status = source.querySelector("p:last-child").textContent;
            const markButton = document.getElementById("markViewedButton");

            if (status.toLowerCase().includes("viewed")) {
                markButton.style.display = "none";
            } else {
                markButton.style.display = "inline-block";
            }
        }


        function closeReport() {

            document.getElementById("reportModal").hidden = true;
            currentReportId = null;

        }


        async function markAsViewed() {

            if (currentReportId === null) return;

            const button = document.getElementById("markViewedButton");

            button.disabled = true;
            button.textContent = "Updating...";

            try {

                const response = await fetch(
                    "/reported-users/" + currentReportId + "/viewed",
                    {
                        method: "POST"
                    }
                );

                if (!response.ok) {
                    const errorText = await response.text();
                    console.log("Server response:", response.status, errorText);
                    alert("Update failed. Status: " + response.status + "\n" + errorText);
                    return;
                }

                const row = Array.from(
                    document.querySelectorAll(".report-row")
                ).find(function (row) {
                    return row.querySelector(
                        'button[onclick="openReport(' + currentReportId + ')"]'
                    );
                });

                if (row) {

                    const status = row.querySelector(".moderation-status");

                    status.textContent = "Viewed";
                    status.classList.remove("pending");
                    status.classList.add("viewed");

                    const source = document.getElementById("report-" + currentReportId);

                    if (source) {
                        const statusParagraph = source.querySelector("p:last-child");
                        statusParagraph.textContent = "Status: Viewed";
                    }
                }

                document.getElementById("markViewedButton").style.display = "none";

                closeReport();

            } catch (error) {

                alert("Unable to update the report. Please try again.");

            } finally {

                button.disabled = false;
                button.textContent = "Mark as Viewed";

            }

        }

    </script>

</body>

</html>