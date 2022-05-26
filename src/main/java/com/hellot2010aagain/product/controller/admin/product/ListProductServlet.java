package com.hellot2010aagain.product.controller.admin.product;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.model.MySqlProductModel;
import com.hellot2010aagain.product.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListProductServlet extends HttpServlet {

    private ProductModel productModel;

    public ListProductServlet() {
        this.productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getAttribute("message"));
        List<Product> list = productModel.findAll();
        req.setAttribute("title", "List Product");
        req.setAttribute("list", list);
        req.getRequestDispatcher("/admin/products/list.jsp").forward(req, resp);
    }
}
