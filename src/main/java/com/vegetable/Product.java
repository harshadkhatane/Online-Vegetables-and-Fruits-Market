package com.vegetable;

public class Product implements Comparable<Product> {
    private int prodid;
    private String pname;
    private String pcat;
    private float price;
    private float disc_price;
    private String photo;
    private String remarks;
    private String descr;
    private String instock;
    private String featured;
    private String create_date;

    public Product() {
    }

    public Product(String pname, String pcat, float price, float disc_price, String remarks, String descr) {
        this.pname = pname;
        this.pcat = pcat;
        this.price = price;
        this.disc_price = disc_price;
        this.remarks = remarks;
        this.descr = descr;
    }

    public String getInstock() {
        return instock;
    }

    public void setInstock(String instock) {
        this.instock = instock;
    }

    public String getFeatured() {
        return featured;
    }

    public void setFeatured(String featured) {
        this.featured = featured;
    }
    

    public int getProdid() {
        return prodid;
    }

    public void setProdid(int prodid) {
        this.prodid = prodid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcat() {
        return pcat;
    }

    public void setPcat(String pcat) {
        this.pcat = pcat;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getDisc_price() {
        return disc_price;
    }

    public void setDisc_price(float disc_price) {
        this.disc_price = disc_price;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public int compareTo(Product o) {
        return this.prodid>o.prodid ? -1 : 1;
    }
}