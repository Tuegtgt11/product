package com.hellot2010aagain.product.controller_admin;

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
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        double price = Double.valueOf(req.getParameter("price"));
        String content = req.getParameter("content");
        String size = req.getParameter("size");
        int qty = Integer.parseInt(req.getParameter("qty"));
        int sku = Integer.parseInt(req.getParameter("sku"));
        String category = req.getParameter("category");
        String tag = req.getParameter("tag");
        Product product = new Product(id, name, price, content,size,qty,sku,category,tag );
        HashMap<String, String> errors = new HashMap<>();
        if (productModel.save(product) != null) {
            resp.sendRedirect("/admin/products/list");
        } else {
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
        }
    }
}
