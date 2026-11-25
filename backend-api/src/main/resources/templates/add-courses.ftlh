
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch - Add Course</title>
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
        <h2>Add Course</h2>
        <p>Add a new course listing to StudyMatch.</p>

        <div class="form-container">

            <form action="/courses" method="post">

                <div class="form-group">
                    <label for="courseNumber">Course Number</label>
                    <input type="text" id="courseNumber" name="courseNumber"
                           placeholder="Example: CSC 340" required>
                </div>

                <div class="form-group">
                    <label for="courseName">Course Name</label>
                    <input type="text" id="courseName" name="courseName"
                           placeholder="Example: Software Engineering" required>
                </div>

                <div class="form-group">
                    <label for="instructor">Instructor</label>
                    <input type="text" id="instructor" name="instructor"
                           placeholder="Example: Dr. Smith" required>
                </div>

                <div class="form-group">
                    <label for="description">Course Description</label>
                    <textarea id="description" name="description"
                              rows="5" placeholder="Enter course description"
                              required></textarea>
                </div>

                <button class="action-button" type="submit">
                    Add Course
                </button>

                <a class="back-button" href="/courses">Cancel</a>

            </form>

        </div>
    </main>

</body>
</html>
