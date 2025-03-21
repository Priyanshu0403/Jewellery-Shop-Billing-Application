package com.ba.model;

import java.sql.Date;
import java.time.LocalDate;

public class customerInfo {
	private Integer ID;
	private String CUSTOMERNAME;
	private String CONTACTNUMBER;
	private String ITEMNAME;
	private Integer QUANTITY;
	private Float WEIGHT;
	private Double PRICE;
	private Double TOTAL;
	private Date DATE;
	private Double AMOUNTPAID;
	private Double DUEAMOUNT;
	
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getCUSTOMERNAME() {
		return CUSTOMERNAME;
	}
	public void setCUSTOMERNAME(String cUSTOMERNAME) {
		CUSTOMERNAME = cUSTOMERNAME;
	}
	public String getCONTACTNUMBER() {
		return CONTACTNUMBER;
	}
	public void setCONTACTNUMBER(String cONTACTNUMBER) {
		CONTACTNUMBER = cONTACTNUMBER;
	}
	public String getITEMNAME() {
		return ITEMNAME;
	}
	public void setITEMNAME(String iTEMNAME) {
		ITEMNAME = iTEMNAME;
	}
	public Integer getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(Integer qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public Float getWEIGHT() {
		return WEIGHT;
	}
	public void setWEIGHT(Float wEIGHT) {
		WEIGHT = wEIGHT;
	}
	public Double getPRICE() {
		return PRICE;
	}
	public void setPRICE(Double pRICE) {
		PRICE = pRICE;
	}
	public Double getTOTAL() {
		return TOTAL;
	}
	public void setTOTAL(Double tOTAL) {
		TOTAL = tOTAL;
	}
	public Date getDATE() {
		return DATE;
	}
	public void setDATE(Date dATE) {
		DATE = dATE;
	}
	public Double getAMOUNTPAID() {
		return AMOUNTPAID;
	}
	public void setAMOUNTPAID(Double aMOUNTPAID) {
		AMOUNTPAID = aMOUNTPAID;
	}
	public Double getDUEAMOUNT() {
		return DUEAMOUNT;
	}
	public void setDUEAMOUNT(Double dUEAMOUNT) {
		DUEAMOUNT = dUEAMOUNT;
	}
}
	
	
	