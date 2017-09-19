package com.database;

import java.io.Serializable;

public class Test implements Serializable{
	public static void main(String[] args){
		JDBC jdbc = new JDBC();
		jdbc.validateUsername("aryanzaman");			
	}
}
