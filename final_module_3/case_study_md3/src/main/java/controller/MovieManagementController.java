package controller;

import entity.Movie;
import service.IMovieManagerService;
import service.MovieManagerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;




@WebServlet(name = "movieManagementController", value = "/api/movie")
public class MovieManagementController extends HttpServlet {
    IMovieManagerService service = new MovieManagerServiceImpl();

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "movie": {
//               forward
                req.getRequestDispatcher("/WEB-INF/movie/create.jsp").forward(req, resp);
                break;
            }
            default:
                String message = req.getParameter("message");
                if ("created".equals(message)) {
                    req.setAttribute("message", "Thêm mới thành công");
                } else if ("updated".equals(message)) {
                    req.setAttribute("message", "Cập nhật thành công");
                }
                List<Movie> movies = service.getAllMovie();
                req.setAttribute("movies", movies);
                req.getRequestDispatcher("/manager.jsp").forward(req, resp);
        }
    }
}

/*    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                String name = req.getParameter("name");
                String dob = req.getParameter("dob");
                Double point = Double.parseDouble(req.getParameter("point"));
                LocalDate localDate = LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                Student student = new Student(name,localDate, point);
                studentService.save(student);
                resp.sendRedirect("/students?message=created");
        }
    }
}*/
