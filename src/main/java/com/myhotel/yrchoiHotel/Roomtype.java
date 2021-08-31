package com.myhotel.yrchoiHotel;

public class Roomtype {

	private String name;
	private int typeCode;
	public Roomtype() {}
	public Roomtype(int typeCode, String name) {

		this.name = name;

		this.typeCode = typeCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypeCode() {
		return typeCode;
	}
	public void setTypeCode(int typecode) {
		this.typeCode = typecode;
	}
}
