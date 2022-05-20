package com.hellot2010aagain.product.entity;

import java.time.LocalDateTime;

public class Product {
    private String id;
    private String fullName;
    private String Price;
    private String Thumbnail;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private int status;

    public Product(String id, String fullName, String price, String thumbnail, LocalDateTime createdAt, LocalDateTime updatedAt, int status) {
        this.id = id;
        this.fullName = fullName;
        this.Price = price;
        this.Thumbnail = thumbnail;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.status = status;
    }

    public Product(String id, String fullName, String price, String thumbnail) {
        this.id = id;
        this.fullName = fullName;
        this.Price = price;
        this.Thumbnail = thumbnail;
        this.createdAt = LocalDateTime.now();
        this.updatedAt = LocalDateTime.now();
        this.status = 1;
    }

    public Product() {
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", price=" + Price +
                ", thumbnail='" + Thumbnail + '\'' +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", status=" + status +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String price) {
        Price = price;
    }

    public String getThumbnail() {
        return Thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        Thumbnail = thumbnail;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}