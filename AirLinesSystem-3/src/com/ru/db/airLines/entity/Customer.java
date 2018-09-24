package com.ru.db.airLines.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

@Entity
@Table(name="Customer")
public class Customer {
	
	
	@Id
	@Column(name="custID")
	@TableGenerator(name = "custID",table="custpktb",pkColumnName="custkey", pkColumnValue="custvalue",
	allocationSize=1)
	@GeneratedValue(strategy=GenerationType.TABLE, generator="custID")
	private int custId;
	@Column(name="custName")
	private String name;
	@Column(name="age")
	private int age;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return custId;
	}
	public void setId(int id) {
		this.custId = id;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
