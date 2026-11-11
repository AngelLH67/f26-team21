
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch - Registered Users</title>
    <link rel="stylesheet" href="/styles.css">
</head>

<body>

    <header>
        <h1>StudyMatch</h1>
        <nav>
            <a href="/admin">Dashboard</a>
        </nav>
    </header>

    <main>
        <h2>Registered Users</h2>
        <p>View the users who have registered for StudyMatch.</p>

        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Registration Date</th>
                </tr>
            </thead>

            <tbody>
                <#if students?has_content>
                    <#list students as student>
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td>${student.email}</td>
                            <td>${student.registrationDate!''}</td>
                        </tr>
                    </#list>
                <#else>
                    <tr>
                        <td colspan="4">No registered users found.</td>
                    </tr>
                </#if>
            </tbody>
        </table>

        <div>
            <a class="back-button" href="/admin">
                Back to Dashboard
            </a>
        </div>
    </main>

</body>
</html>
