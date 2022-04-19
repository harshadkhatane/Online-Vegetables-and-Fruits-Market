package com.vegetable;

public class Order {    
    
    private Product product;
    private int qty;
    private String orderdate;

    public String getOrderdate() {
        return orderdate;
    }           

    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }    
}