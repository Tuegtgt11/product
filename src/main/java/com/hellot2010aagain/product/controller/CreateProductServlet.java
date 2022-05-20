package com.hellot2010aagain.product.controller;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.model.MySqlProductModel;
import com.hellot2010aagain.product.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class CreateProductServlet extends HttpServlet {

    private ProductModel productModel;

    public CreateProductServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("product", new Product());
        req.setAttribute("action", 1);
        req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // xử lí validate và save.
        String id= req.getParameter("id");
        String fullName = req.getParameter("fullName");
        String price = req.getParameter("Price");
        String thumbnail = req.getParameter("Thumbnail");
        System.out.println(fullName);
        Product product = new Product(id, fullName, price, thumbnail);
        HashMap<String, String> errors = new HashMap<>();
        if (id == null || id.length() == 0) {
            errors.put("id", "Please enter id");
        }
        if (fullName == null || fullName.length() == 0) {
            errors.put("fullName", "Please enter fullName");
        }
        if (price == null || price.length() == 0) {
            errors.put("Price", "Please enter price");
        }
        if (thumbnail == null || thumbnail.length() == 0) {
            errors.put("Thumbnail", "Please enter thumbnail");
        }
        if (errors.size() > 0) {
            req.setAttribute("product", product);
            req.setAttribute("action", 1);
            req.setAttribute("errors", errors);
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
            return;
        }
        if (productModel.save(product) != null) {
            resp.sendRedirect("/admin/products/list");
        } else {
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
        }
    }
}
