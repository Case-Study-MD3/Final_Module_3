package controller.Payment;



import config.VNPayConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

@WebServlet("/vnpay_return")
public class VNPayReturnServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements(); ) {
            String fieldName = params.nextElement();
            String fieldValue = request.getParameter(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = fields.remove("vnp_SecureHash");
        List<String> fieldNames = new ArrayList<>(fields.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        for (String fieldName : fieldNames) {
            String fieldValue = fields.get(fieldName);
            hashData.append(fieldName).append('=').append(fieldValue);
            if (!fieldName.equals(fieldNames.get(fieldNames.size() - 1))) {
                hashData.append('&');
            }
        }

        String signValue = hmacSHA512(VNPayConfig.secretKey, hashData.toString());
        String responseCode = request.getParameter("vnp_ResponseCode");

        if (signValue.equals(vnp_SecureHash) && "00".equals(responseCode)) {
            request.setAttribute("message", "Thanh toán thành công!");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Thanh toán thất bại!");
            request.getRequestDispatcher("fail.jsp").forward(request, response);
        }
    }

    private String hmacSHA512(String key, String data) {
        try {
            javax.crypto.Mac hmac512 = javax.crypto.Mac.getInstance("HmacSHA512");
            javax.crypto.spec.SecretKeySpec secretKey = new javax.crypto.spec.SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(secretKey);
            byte[] bytes = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder hash = new StringBuilder();
            for (byte b : bytes) {
                hash.append(String.format("%02x", b));
            }
            return hash.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
