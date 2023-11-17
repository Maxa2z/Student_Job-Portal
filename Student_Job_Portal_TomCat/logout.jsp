<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%try{
        session = request.getSession();
        session.invalidate();
        response.sendRedirect("Home.html");
    }
    catch(Exception e){
        System.out.println(e);
    }%>
</body>
</html>