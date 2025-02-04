<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Enhanced Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Modern Calculator</h1>
    <form action="Calculator.jsp" method="post">  
        <input type="text" name="num1" placeholder="Enter number 1" required><br><br>
        <input type="text" name="num2" placeholder="Enter number 2" required><br><br>

        <select name="operator">
            <option value="+">Addition (+)</option>
            <option value="-">Subtraction (-)</option>
            <option value="*">Multiplication (*)</option>
            <option value="/">Division (/)</option>
        </select><br><br>

        <input type="submit" value="Calculate">
    </form>

    <%
        String num1Str = request.getParameter("num1");
        String num2Str = request.getParameter("num2");
        String operator = request.getParameter("operator");

        if (num1Str != null && num2Str != null && operator != null) {
            try {
                double num1 = Double.parseDouble(num1Str);
                double num2 = Double.parseDouble(num2Str);
                double result = 0;

                boolean error = false;
                String message = "";

                switch (operator) {
                    case "+": result = num1 + num2; break;
                    case "-": result = num1 - num2; break;
                    case "*": result = num1 * num2; break;
                    case "/":
                        if (num2 == 0) {
                            message = "Cannot divide by zero!";
                            error = true;
                        } else {
                            result = num1 / num2;
                        }
                        break;
                }

                if (error) {
                    out.println("<p class='error'>" + message + "</p>");
                } else {
                    out.println("<p class='result'>Result: " + result + "</p>");
                }

            } catch (NumberFormatException e) {
                out.println("<p class='error'>Invalid input. Please enter valid numbers.</p>");
            }
        }
    %>

</body>
</html>
