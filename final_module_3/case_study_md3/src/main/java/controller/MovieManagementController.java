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
        if ("delete".equals(action)) {
            int movieId = Integer.parseInt(req.getParameter("movie_id"));
            service.delete(movieId);
            resp.sendRedirect(req.getContextPath() + "/api/movie"); // quay lại danh sách
            return;
        }
        switch (action) {
            case "movie": {
//               forward
                req.getRequestDispatcher("/create.jsp").forward(req, resp);
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
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if ("create".equals(action)) {
            String name = req.getParameter("name");
            String genre = req.getParameter("genre");
            int duration = Integer.parseInt(req.getParameter("duration"));
            String date = req.getParameter("date");
            String image = req.getParameter("image");

            Movie movie = new Movie(image, 0, name, genre, duration, date);

            service.save(movie);


            // Redirect về trang quản lý với message
            resp.sendRedirect(req.getContextPath() + "/api/movie?message=created");
        }

    }
}
