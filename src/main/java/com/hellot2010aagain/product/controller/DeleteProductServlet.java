package com.hellot2010aagain.product.controller;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.model.MySqlProductModel;
import com.hellot2010aagain.product.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteProductServlet extends HttpServlet {
    private ProductModel productModel;
    public DeleteProductServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        req.setAttribute("title", "Delete Product");

        Product product = productModel.findById(id);

        if (product == null) {
            req.setAttribute("message", "Data not found!");
            req.getRequestDispatcher("/admin/error/404.jsp").forward(req, resp);
        } else {
            boolean result = productModel.delete(id); // xoá mềm.
            if (result) {
                resp.sendRedirect("/admin/products/list");
            } else {
                req.setAttribute("message", "Action fails!");
                req.getRequestDispatcher("/admin/error/500.jsp").forward(req, resp);
            }
        }
    }
}
