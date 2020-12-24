package com.web.book.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
public class RootAppConfig {

	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		try {
			ds.setDriverClass("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setUser("book");
		ds.setPassword("qaq");
		ds.setJdbcUrl("jdbc:sqlserver://eeit125g2.ddns.net:1433;databaseName=BookDB");
		ds.setInitialPoolSize(3);
		ds.setMaxPoolSize(6);
		ds.setMaxIdleTime(3500);
		return ds;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean bean = new LocalSessionFactoryBean();
		bean.setDataSource(dataSource());
		bean.setPackagesToScan(new String[]{"com.web.book.model"});
		bean.setHibernateProperties(getHibernateProperties());
		return bean;
	}

	private Properties getHibernateProperties() {
		Properties p0 = new Properties();
		p0.put("hibernate.dialect", "org.hibernate.dialect.SQLServer2012Dialect");
		p0.put("hibernate.hbm2ddl.auto", "update");
		p0.put("hibernate.show_sql", "true");
		p0.put("hibernate.format_sql", "true");
		p0.put("hibernate.transaction.coordinator_class", "jdbc");
		p0.put("hibernate.bytecode.use_reflection_optimizer", "false");
		p0.put("connection_pool_size", "8");
		return p0;
	}
	
	@Bean
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory factory){
		HibernateTransactionManager manager = new HibernateTransactionManager();
		manager.setSessionFactory(factory);
		return manager;
		
	}
	
	
	

}
