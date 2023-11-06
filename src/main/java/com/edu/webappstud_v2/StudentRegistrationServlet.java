package com.edu.webappstud_v2;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.util.ArrayList;
import java.util.List;



@WebServlet(name = "StudentRegistrationServlet", value = "/student-registration")
public class StudentRegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String group = request.getParameter("group");
        String faculty = request.getParameter("faculty");

        if (name != null && !name.trim().isEmpty() && surname != null && !surname.trim().isEmpty()) {
            List<Student> students = (List<Student>) getServletContext().getAttribute("students");

            if (students == null) {
                students = new ArrayList<>();
                getServletContext().setAttribute("students", students);
            }

            boolean isDuplicate = false;
            for (Student s : students) {
                if (s.getName().equals(name) && s.getSurname().equals(surname)) {
                    isDuplicate = true;
                    break;
                }
            }

            if (!isDuplicate) {
                Student student = new Student();
                student.setName(name);
                student.setSurname(surname);
                student.setEmail(email);
                student.setGroup(group);
                student.setFaculty(faculty);
                students.add(student);
            } else {
                request.setAttribute("error", "Дублікат імені та прізвища.");
            }
        } else {
            request.setAttribute("error", "Некоректне ім'я або прізвище.");
        }

        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
