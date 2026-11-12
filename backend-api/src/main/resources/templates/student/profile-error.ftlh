
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StudyMatch | Profile</title>
    <link rel="stylesheet" href="/student/styles.css">
</head>
<body style="background:#F7F7F3; font-family:Arial,sans-serif;">
    <main style="max-width:520px; margin:100px auto;
                 background:white; padding:40px;
                 border:1px solid #E3DCCF;
                 border-radius:20px;">
        <h1 style="color:#303B32;">Unable to open profile</h1>
        <p style="color:#667C68;">${errorMessage!"Profile not found."}</p>
        <a href="/student/create-profile"
           style="color:#526654; font-weight:bold;">
            Go to Create Profile
        </a>
    </main>
</body>
</html>
