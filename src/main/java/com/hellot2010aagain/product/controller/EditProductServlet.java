package com.hellot2010aagain.product.controller;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.model.MySqlProductModel;
import com.hellot2010aagain.product.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditProductServlet extends HttpServlet {

    private ProductModel productModel;

    public EditProductServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // lấy tham sô id
        String id = req.getParameter("id");
        // kiểm tra trong database xem có tồn tại không}
        Product product = productModel.findById(id);
        // nếu không có trả về trang 404
        if (product == null) {
            req.setAttribute("message", "Product not found!");
        } else {
            req.setAttribute("product", product);
            req.setAttribute("action", 2);
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // xử lí validate và save
        String id = req.getParameter("id");
        Product existingProduct = productModel.findById(id);
        if(existingProduct == null){
            req.setAttribute("message", "Product not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req, resp);
        }else{
            String fullName = req.getParameter("fullName");
            String price = req.getParameter("Price");
            String thumbnail = req.getParameter("Thumbnail");
            System.out.println(fullName);
            Product product = new Product(id, fullName, price, thumbnail);
            // validate dữ liệu
            if (productModel.update(id, product) != null) {
                resp.sendRedirect("/admin/products/list");
            } else {
                // nếu có trả về trang form
                req.setAttribute("product", product);
                req.setAttribute("action", 2);
                req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
            }
        }
    }
}
