package com.vegetable;

public class Cart {
     private String userid;
     private String prodid;
     private int qty;

    public Cart() {
    }

    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getProdid() {
        return prodid;
    }
    public void setProdid(String prodid) {
        this.prodid = prodid;
    }

    public int getQty() {
        return qty;
    }
    public void setQty(int qty) {
        this.qty = qty;
    }     
}