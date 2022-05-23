package com.hellot2010aagain.product.controller.admin.product;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.model.MySqlProductModel;
import com.hellot2010aagain.product.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DetailProductServlet extends HttpServlet {

    private ProductModel productModel;
    public DetailProductServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // lấy tham số id
        String id = req.getParameter("id");
        req.setAttribute("title", "Detail Product");
        // kiểm tra trong database xem có tồn tại không.
        Product product = productModel.findById(id);
        // nếu không trả về trang 404
        if (product == null) {
            req.setAttribute("message", "product not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req, resp);
        } else {
            // nếu có trả về trang detail
            req.setAttribute("product", product);
            req.getRequestDispatcher("/admin/products/detail.jsp").forward(req, resp);
        }
    }
}
