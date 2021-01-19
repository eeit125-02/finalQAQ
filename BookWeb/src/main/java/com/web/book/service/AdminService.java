package com.web.book.service;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	List<Map<String, Object>> getAllBookReport();
	
	List<Map<String, Object>> getAllBook();
	
	Boolean deleteBookReport(Integer brId);
	
}
