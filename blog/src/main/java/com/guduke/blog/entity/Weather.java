package com.guduke.blog.entity;

public class Weather {
	@Override
	public String toString() {
		return "Weather [city=" + city + ", emperature=" + emperature + ", tq=" + tq + ", pic1=" + pic1 + ", pic2="
				+ pic2 + "]";
	}

	private String city,emperature,tq,pic1,pic2;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getEmperature() {
		return emperature;
	}

	public void setEmperature(String emperature) {
		this.emperature = emperature;
	}


	public String getTq() {
		return tq;
	}

	public void setTq(String tq) {
		this.tq = tq;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public Weather(String city, String emperature, String tq, String pic1, String pic2) {
		super();
		this.city = city;
		this.emperature = emperature;
		this.tq = tq;
		this.pic1 = pic1;
		this.pic2 = pic2;
	}
	
}
