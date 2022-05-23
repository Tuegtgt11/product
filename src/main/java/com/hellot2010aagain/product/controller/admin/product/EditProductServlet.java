package com.hellot2010aagain.product.controller.admin.product;

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
        String id = req.getParameter("id");
        Product product = productModel.findById(id);

        if (product == null){
            req.setAttribute("message","Data not found!");
            req.getRequestDispatcher("/admin/errors/404.jsp").forward(req,resp);
        }else {
            req.setAttribute("title", "Edit Product");
            req.setAttribute("product",product);
            req.setAttribute("action",2);
            req.getRequestDispatcher("/admin/products/form.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        Product productModelById = productModel.findById(id);
        if (productModelById == null){
            req.setAttribute("message","Data not found!");
            req.getRequestDispatcher("/admin/error/404.jsp").forward(req,resp);
        }else {
            String name = req.getParameter("name");
            String image = req.getParameter("image");
            double price = Double.valueOf(req.getParameter("price"));
            int qty = Integer.parseInt(req.getParameter("qty"));
            int color = Integer.parseInt(req.getParameter("color"));
            String content = req.getParameter("content");
            int category = Integer.parseInt(req.getParameter("category"));
            Product product = new Product(id, name,image, price, qty,color,content,category);

            if (productModel.update(id, product) != null) {
                resp.sendRedirect("/admin/products/list");
            } else {
                req.setAttribute("title", "Edit Product");
                req.setAttribute("product", price);
                req.setAttribute("action", 2);
                req.getRequestDispatcher("/admin/products/form.jsp").forward(req, resp);
            }

        }
    }
}

