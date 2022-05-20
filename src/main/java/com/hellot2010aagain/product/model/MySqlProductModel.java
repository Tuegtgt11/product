package com.hellot2010aagain.product.model;

import com.hellot2010aagain.product.entity.Product;
import com.hellot2010aagain.product.utill.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

public class MySqlProductModel implements ProductModel{
    @Override
    public Product save(Product product) {
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = " insert into products " +
                    "(id, fullName, Price, Thumbnail, createdAt, updatedAt, status)" +
                    "values " +
                    "(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, product.getId());
            preparedStatement.setString(2, product.getFullName());
            preparedStatement.setString(3, product.getPrice());
            preparedStatement.setString(4, product.getThumbnail());
            preparedStatement.setString(5, product.getCreatedAt().toString());
            preparedStatement.setString(6, product.getCreatedAt().toString());
            preparedStatement.setInt(7, product.getStatus());
            System.out.println("Connection success!");
            preparedStatement.execute();
            return product;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Product> findAll(){
        List<Product> list =new ArrayList<>();
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "select * from products where status = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, 1);
            System.out.println("Connection success!");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String id = resultSet.getString("id");
                String fullName = resultSet.getString("fullName");
                String Price = resultSet.getString("Price");
                String Thumbnail = resultSet.getString("Thumbnail");
                LocalDateTime createdAt =
                        LocalDateTime.ofInstant(resultSet.getTimestamp("createdAt").toInstant(), ZoneId.systemDefault());
                LocalDateTime updatedAt =
                        LocalDateTime.ofInstant(resultSet.getTimestamp("updatedAt").toInstant(), ZoneId.systemDefault());
                int status = resultSet.getInt("status");
                Product product = new Product(id, fullName, Price, Thumbnail, createdAt, updatedAt, status);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Product findById(String id) {
        Product product = null;
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "select * from products where status = ? and id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, 1);
            preparedStatement.setString(2, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                String fullName = resultSet.getString("fullName");
                String Price = resultSet.getString("Price");
                String Thumbnail = resultSet.getString("Thumbnail");
                LocalDateTime createdAt =
                        LocalDateTime.ofInstant(resultSet.getTimestamp("createdAt").toInstant(), ZoneId.systemDefault());
                LocalDateTime updatedAt =
                        LocalDateTime.ofInstant(resultSet.getTimestamp("updatedAt").toInstant(), ZoneId.systemDefault());
                int status = resultSet.getInt("status");
                product = new Product(id, fullName, Price, Thumbnail, createdAt, updatedAt, status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public Product update(String id, Product updateProduct) {
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "update products " +
                    "set id = ?, fullName = ?, Price = ?, Thumbnail = ?, createdAt = ?, updatedAt = ?, status = ? where id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setString(1, updateProduct.getId());
            preparedStatement.setString(2, updateProduct.getFullName());
            preparedStatement.setString(3, updateProduct.getPrice());
            preparedStatement.setString(4, updateProduct.getThumbnail());
            preparedStatement.setString(5, updateProduct.getCreatedAt().toString());
            preparedStatement.setString(6, updateProduct.getUpdatedAt().toString());
            preparedStatement.setInt(7, updateProduct.getStatus());
            preparedStatement.setString(8, id);
            System.out.println("Connection success!");
            preparedStatement.execute();
            return updateProduct;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean delete(String id) {
        try {
            Connection connection = ConnectionHelper.getConnection();
            String sqlQuery = "update products " +
                    "set status = ? where id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
            preparedStatement.setInt(1, -1);
            preparedStatement.setString(2, id);
            System.out.println("Connection success!");
            preparedStatement.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
