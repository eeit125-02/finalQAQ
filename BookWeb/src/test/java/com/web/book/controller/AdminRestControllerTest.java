package com.web.book.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.web.book.config.RootAppConfig;
import com.web.book.config.WebAppConfig;
import com.web.book.config.WebAppInitializer;
import com.web.book.dao.AdminDao;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {WebAppConfig.class, RootAppConfig.class, WebAppInitializer.class})
public class AdminRestControllerTest {

	@Autowired
	AdminDao adminDao;
	
	
	@Test
	public void testGetAllStrore() {
		System.out.println(adminDao.getAllStrore());
	}

}
