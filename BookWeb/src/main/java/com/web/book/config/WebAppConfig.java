package com.web.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan({
	"com.web.book.config", 
	"com.web.book.controller", 
	"com.web.book.dao.impl", 
	"com.web.book.service.impl"
	})
public class WebAppConfig implements WebMvcConfigurer {
	@Bean
	public ViewResolver inteViewResolverViewResolver() {
		
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/");
		resolver.setSuffix(".jsp");
//		resolver.setViewClass(JstlView.class);
		
		return resolver;
	}
}
