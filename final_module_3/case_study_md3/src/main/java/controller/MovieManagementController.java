package controller;

import entity.Movie;
import entity.Showtime;
import service.IMovieManagerService;
import service.impl.MovieManagerServiceImpl;
import service.impl.ShowtimeService;

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
    ShowtimeService showtimeService = new ShowtimeService();

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

        if ("edit".equals(action)) {
            int movieId = Integer.parseInt(req.getParameter("movie_id"));
            Movie movie = service.findById(movieId);
            req.setAttribute("movie", movie);
            req.getRequestDispatcher("/update.jsp").forward(req, resp);
            return;
        }

        switch (action) {
            case "movie": {
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

            int movieId = service.save(movie);

            // thêm showtime luôn sau khi có movieId
            if (movieId > 0) {
                Showtime showtime = new Showtime();
                showtime.setMovieId(movieId);
                showtime.setRoomId(Integer.parseInt(req.getParameter("roomId")));

                String rawStartTime = req.getParameter("startTime");
                if (rawStartTime != null && !rawStartTime.isEmpty()) {
                    String startTime = rawStartTime.replace("T", " ") + ":00";
                    showtime.setStartTime(startTime);
                }

                showtime.setPrice(Double.parseDouble(req.getParameter("price")));
                showtime.setTotalSeats(Integer.parseInt(req.getParameter("totalSeats")));

                showtimeService.save(showtime);
            }

            resp.sendRedirect(req.getContextPath() + "/api/movie?message=created");
        }

        if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String genre = req.getParameter("genre");
            int duration = Integer.parseInt(req.getParameter("duration"));
            String date = req.getParameter("date");
            String image = req.getParameter("image");

            Movie movie = new Movie(image, id, name, genre, duration, date);
            service.update(movie);

            resp.sendRedirect(req.getContextPath() + "/api/movie?message=updated");
        }
    }
}
