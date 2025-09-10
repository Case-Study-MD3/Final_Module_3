package controller;

import entity.Employees;
import service.IEmployeesService;
import service.impl.EmployeesServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "employeeManagementController",value ="/api/employee")
public class EmployeesManagementController extends HttpServlet {

    private final IEmployeesService service = new EmployeesServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "";

        if ("delete".equals(action)) {
            int employeeId = Integer.parseInt(req.getParameter("id"));
            service.delete(employeeId);
            resp.sendRedirect(req.getContextPath() + "/api/employee");
            return;
        }

        if ("edit".equals(action)) {
            int employeeId = Integer.parseInt(req.getParameter("employee_id"));
            Employees employee = service.findById(employeeId);
            req.setAttribute("employee", employee);
            req.getRequestDispatcher("/update-rental.jsp").forward(req, resp);
            return;
        }

        switch (action) {
            case "create": {
                req.getRequestDispatcher("/add-rental.jsp").forward(req, resp);
                break;
            }
            default:
                String message = req.getParameter("message");
                if ("created".equals(message)) {
                    req.setAttribute("message", "Thêm mới nhân viên thành công");
                } else if ("updated".equals(message)) {
                    req.setAttribute("message", "Cập nhật nhân viên thành công");
                }

                // Lấy keyword từ ô tìm kiếm
                String keyword = req.getParameter("keyword");
                List<Employees> employees;

                if (keyword != null && !keyword.trim().isEmpty()) {
                    // Nếu có keyword thì tìm kiếm
                    employees = service.searchEmployees(keyword.trim());
                } else {
                    // Không có keyword thì lấy toàn bộ
                    employees = service.getAllEmployees();
                }

                req.setAttribute("employees", employees);
                req.setAttribute("keyword", keyword); // để JSP biết đang tìm kiếm
                req.getRequestDispatcher("/employees.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("create".equals(action)) {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phone");

            Employees employee = new Employees(0, name, email, phoneNumber);
            try {
                service.save(employee);
                resp.sendRedirect(req.getContextPath() + "/api/employee?message=created");
            }catch (RuntimeException e){
                // Gửi thông báo lỗi về JSP
                req.setAttribute("errorMessage", e.getMessage());
                req.setAttribute("employee", employee); // giữ dữ liệu đã nhập
                req.getRequestDispatcher("/add-rental.jsp").forward(req, resp);
            }



        }

        if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phoneNumber = req.getParameter("phone");

            Employees employee = new Employees(id, name, email, phoneNumber);

            try {
                service.update(employee);

                resp.sendRedirect(req.getContextPath() + "/api/employee?message=updated");
            } catch (RuntimeException e){
                // Gửi thông báo lỗi về JSP
                req.setAttribute("errorMessage", e.getMessage());
                req.setAttribute("employee", employee); // giữ dữ liệu đã nhập
                req.getRequestDispatcher("/update-rental.jsp").forward(req, resp);
            }

        }
    }

}
