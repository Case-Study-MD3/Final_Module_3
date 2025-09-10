package controller;

import entity.Customer;
import service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/customers", name = "customerController")
public class CustomerController extends HttpServlet {
    private ICustomerService customerService = new service.impl.CustomerService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create": {
                req.getRequestDispatcher("/WEB-INF/customers/create.jsp").forward(req, resp);
                break;
            }
            case "edit": {
                int id = Integer.parseInt(req.getParameter("id"));
                List<Customer> list = customerService.searchById(String.valueOf(id));
                if (!list.isEmpty()) {
                    req.setAttribute("customer", list.get(0));
                    req.getRequestDispatcher("/WEB-INF/customers/edit.jsp").forward(req, resp);
                } else {
                    resp.sendRedirect("/customers?message=notfound");
                }
                break;
            }
            case "delete": {
                int id = Integer.parseInt(req.getParameter("id"));
                customerService.delete(id);
                resp.sendRedirect("/customers?message=deleted");
                break;
            }
            case "search": {
                String keyword = req.getParameter("keyword");
                String type = req.getParameter("type"); // name hoặc id
                List<Customer> customers;
                if ("id".equals(type)) {
                    customers = customerService.searchById(keyword);
                } else {
                    customers = customerService.searchByName(keyword);
                }
                req.setAttribute("customers", customers);
                req.getRequestDispatcher("/WEB-INF/customers/list.jsp").forward(req, resp);
                break;
            }
            default: {
                String message = req.getParameter("message");
                if ("created".equals(message)) {
                    req.setAttribute("message", "Thêm khách hàng thành công");
                } else if ("updated".equals(message)) {
                    req.setAttribute("message", "Cập nhật khách hàng thành công");
                } else if ("deleted".equals(message)) {
                    req.setAttribute("message", "Xóa khách hàng thành công");
                }
                List<Customer> customers = customerService.findAll();
                req.setAttribute("customers", customers);
                req.getRequestDispatcher("/WEB-INF/customers/list.jsp").forward(req, resp);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create": {
                String name = req.getParameter("customerName");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");

                Customer customer = new Customer(name, email, phone);
                customerService.save(customer);
                resp.sendRedirect("/customers?message=created");
                break;
            }
            case "update": {
                int id = Integer.parseInt(req.getParameter("id"));
                String name = req.getParameter("customerName");
                String email = req.getParameter("email");
                String phone = req.getParameter("phone");

                Customer updated = new Customer(id, name, email, phone);
                customerService.update(updated);
                resp.sendRedirect("/customers?message=updated");
                break;
            }
        }
    }
}
