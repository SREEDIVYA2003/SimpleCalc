<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Basic Calculator</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Simple Calculator</h1>
    <form action="Calculator.jsp" method="post">  <%-- Form submits to itself --%>
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

                switch (operator) {
                    case "+": result = num1 + num2; break;
                    case "-": result = num1 - num2; break;
                    case "*": result = num1 * num2; break;
                    case "/":
                        if (num2 == 0) {
                            out.println("<p style='color:red;'>Cannot divide by zero!</p>");
                        } else {
                            result = num1 / num2;
                        }
                        break;
                }

                out.println("<p>Result: " + result + "</p>");

            } catch (NumberFormatException e) {
                out.println("<p style='color:red;'>Invalid input. Please enter numbers only.</p>");
            }
        }
    %>

</body>
</html>