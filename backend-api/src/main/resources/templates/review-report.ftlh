<!DOCTYPE html>
<html>
<head>
    <title>Review Report</title>
    <link rel="stylesheet" href="/sysadmin/styles.css">
</head>

<body class="dashboard-page admin-page reports-page">

    <main class="dashboard-content">
        <h1>Review Report</h1>

        <div class="report-details">
            <h2>Report Information</h2>

            <p><strong>Reported Student:</strong>
                <#if report.reportedStudent??>
                    ${report.reportedStudent.name}
                <#else>
                    Unknown
                </#if>
            </p>

            <p><strong>Reported Student Email:</strong>
                <#if report.reportedStudent??>
                    ${report.reportedStudent.email}
                <#else>
                    Unknown
                </#if>
            </p>

            <p><strong>Reported By:</strong>
                <#if report.reporter??>
                    ${report.reporter.name}
                <#else>
                    Unknown
                </#if>
            </p>

            <p><strong>Reporter Email:</strong>
                <#if report.reporter??>
                    ${report.reporter.email}
                <#else>
                    Unknown
                </#if>
            </p>

            <p><strong>Reason:</strong> ${report.reason}</p>

            <p><strong>Date:</strong> ${report.date}</p>

            <p><strong>Status:</strong> ${report.status}</p>
        </div>

        <a href="/reported-users" class="report-review-button">
            Back to Reports
        </a>
    </main>

</body>
</html>