package com.web.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan({
	"com.web.book.config", 
	"com.web.book.controller", 
	"com.web.book.dao.impl", 
	"com.web.book.service.impl",
	"com.web.book.service"
	})
public class WebAppConfig implements WebMvcConfigurer {
	
	@Bean
	public ViewResolver inteViewResolverViewResolver() {
		
		InternalResourceViewResolver resolver = 
				new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**")
				.addResourceLocations("/Resource/css/");
		registry.addResourceHandler("/image/**")
				.addResourceLocations("/Resource/image/");
		registry.addResourceHandler("/js/**")
				.addResourceLocations("/Resource/js/");
		registry.addResourceHandler("/html/**")
				.addResourceLocations("/Resource/html/");
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}

}
