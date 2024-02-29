package com.girmiti.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
	public static SessionFactory factory;
	public static SessionFactory getFactory() {
		if(factory == null) {
			factory = new Configuration().configure().buildSessionFactory();
		}
		return factory;
	}

	public static void isCloseFactory() {
		if(factory.isOpen())
			factory.close();
	}

}
