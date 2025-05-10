package com.ems.www.config;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final SessionFactory sessionFactory;
	
	static {
		try {
			sessionFactory=new Configuration().configure().buildSessionFactory();
		}catch(Exception ex) {
			ex.printStackTrace();
			throw new ExceptionInInitializerError("unable to Create the SessionFactory");
		}
	}
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public static void shutdown() {
		if(sessionFactory!=null) {
			sessionFactory.close();
		}
	}

}
