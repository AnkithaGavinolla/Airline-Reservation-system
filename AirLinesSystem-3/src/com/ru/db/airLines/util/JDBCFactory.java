package com.ru.db.airLines.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JDBCFactory {
	private static final EntityManager em=buildEmFactory();
	private static EntityManager buildEmFactory()
	{
			try 
			{
				System.out.println("In static Part !");
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("default");
				EntityManager em=emf.createEntityManager();
				return em;
				
			} 
			catch (Exception e)
			{
				e.printStackTrace();
				System.out.println("In static Error Part !");
				return null;
			}
			
	}
	public static EntityManager getEm() {
		return em;
	}

}
