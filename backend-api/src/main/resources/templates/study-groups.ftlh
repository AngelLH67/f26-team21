<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Study Groups</title>

    <link rel="stylesheet" href="/student/styles.css">
    <link rel="stylesheet" href="/sysadmin/styles.css">

    <script src="https://unpkg.com/lucide@latest/dist/umd/lucide.min.js" defer></script>
</head>

<body class="dashboard-page admin-page manage-users-page">

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

                <nav class="sidebar-nav">

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

                    <a href="/study-groups" class="nav-link active">
                        <i data-lucide="messages-square"></i>
                        Study Groups
                    </a>

                    <a href="/reported-users" class="nav-link">
                        <i data-lucide="shield-alert"></i>
                        Reported Users
                    </a>

                </nav>

                <p class="sidebar-label sidebar-label-spaced">
                    QUICK ACTIONS
                </p>

                <nav class="sidebar-nav">
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
                    <strong>Study Groups</strong>
                </div>

                <span class="admin-account-icon">
                    <i data-lucide="shield-check"></i>
                </span>
            </div>

            <!-- PAGE INTRO -->
            <section class="courses-heading">

                <span class="eyebrow">
                    <i data-lucide="messages-square"></i>
                    ADMIN GROUP WORKSPACE
                </span>

                <h1>Study Groups</h1>

                <p>
                    View and monitor study groups created by
                    StudyMatch students.
                </p>

            </section>

            <!-- OVERVIEW -->
            <section class="courses-overview">

                <div class="courses-overview-icon">
                    <i data-lucide="users"></i>
                </div>

                <div class="courses-overview-copy">
                    <span>STUDENT COLLABORATION</span>
                    <h2>Bringing students together.</h2>
                    <p>
                        View the study groups currently available
                        in the StudyMatch community.
                    </p>
                </div>

                <div class="courses-overview-count">
                    <strong>${groups?size}</strong>
                    <span>Total groups</span>
                </div>

            </section>

            <!-- GROUP DIRECTORY -->
            <section class="courses-list-section">

                <div class="courses-results-heading">
                    <div>
                        <span class="section-kicker">GROUP DIRECTORY</span>
                        <h2>All study groups</h2>
                        <p>Browse groups created by students.</p>
                    </div>

                    <span class="courses-results-count" id="groupsCount">
                        ${groups?size} groups
                    </span>
                </div>

                <!-- SEARCH -->
                <div class="registered-users-search">
                    <i data-lucide="search"></i>

                    <input type="search" id="groupSearch" placeholder="Search study groups..."
                        aria-label="Search study groups">

                    <select id="groupFilter" aria-label="Filter study groups">
                        <option value="all">All Groups</option>
                        <option value="active">Active Groups</option>
                        <option value="reported">Reported Groups</option>
                    </select>
                </div>

                <!-- TABLE -->
                <div class="registered-users-table-wrap">

                    <table class="registered-users-table">
                        <thead>
                            <tr>
                                <th>Group Name</th>
                                <th>Course</th>
                                <th>Creator</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>

                        <tbody id="studyGroupsList">
                            <#if groups?has_content>
                                <#list groups as group>
                                    <tr class="group-row">

                                        <td>${group.groupName!"Unnamed Group"}</td>

                                        <td>
                                            <#if group.course??>
                                                ${group.course.courseName!"No Course"}
                                                <#else>
                                                    No Course
                                            </#if>
                                        </td>

                                        <td>
                                            <#if group.creator??>
                                                ${group.creator.name!"Unknown"}
                                                <#else>
                                                    Unknown
                                            </#if>
                                        </td>

                                        <td>
                                            <span class="moderation-status ${group.status?trim?lower_case}">
                                                ${group.status?upper_case}
                                            </span>
                                        </td>

                                        <td>
                                            <#if group.status?? && group.status?trim?upper_case=="REPORTED">
                                                <button type="button" class="moderation-status reported"
                                                    onclick="removeGroup('${group.id?c}')">
                                                    Remove
                                                </button>
                                                <#else>
                                                    <span class="moderation-status active">
                                                        No action needed
                                                    </span>
                                            </#if>
                                        </td>

                                    </tr>
                                </#list>
                                <#else>
                                    <tr>
                                        <td colspan="5">No study groups found.</td>
                                    </tr>
                            </#if>

                            <tr id="noGroupsFound" hidden>
                                <td colspan="5">No matching study groups found.</td>
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

    <!-- SEARCH SCRIPT -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            if (window.lucide) {
                lucide.createIcons();
            }

            const searchInput = document.getElementById("groupSearch");
            const groupFilter = document.getElementById("groupFilter");
            const groupRows = document.querySelectorAll(".group-row");
            const noGroupsFound = document.getElementById("noGroupsFound");
            const groupsCount = document.getElementById("groupsCount");

            function filterGroups() {

                const query = searchInput.value.trim().toLowerCase();
                const selectedFilter = groupFilter.value;

                let visible = 0;

                groupRows.forEach(function (row) {

                    const rowText = row.textContent.toLowerCase();
                    const status = row.cells[3].textContent.trim().toLowerCase();

                    const matchesSearch = rowText.includes(query);

                    let matchesFilter = true;

                    if (selectedFilter === "active") {
                        matchesFilter = status === "active";
                    }

                    if (selectedFilter === "reported") {
                        matchesFilter = status === "reported";
                    }

                    const matches = matchesSearch && matchesFilter;

                    row.hidden = !matches;

                    if (matches) {
                        visible++;
                    }

                });

                noGroupsFound.hidden = visible !== 0;

                groupsCount.textContent =
                    visible + (visible === 1 ? " group" : " groups");
            }

            searchInput.addEventListener("input", filterGroups);
            groupFilter.addEventListener("change", filterGroups);

            filterGroups();

        });
    </script>

</body>

</html>