package com.web.book.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;

public class GlobalService {	
	
	public static final String SYSTEM_NAME ="";
	
	private static final String SESSION_ID = "SessionID";
	
	
	private GlobalService() {
		
	}

	public static String getMemberEncoder (String passwordString) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(passwordString);
	}
	
	public static Boolean checkMemberEncoder(String loginMemberPassword, String checkMemberPassword ){
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(loginMemberPassword,checkMemberPassword);
	}
	
	public static Map<String, String> getSession(String sessionID) throws InterruptedException, ExecutionException, IOException{
		
		FirebaseService firebase = new FirebaseService();
		DocumentReference session = firebase.getFirestore().collection(SESSION_ID).document(sessionID);
		Map<String, String> sessionValue = new HashMap<>();
		DocumentSnapshot data =  session.get().get();
		sessionValue.put("id",data.getString("id"));
		sessionValue.put("name", data.getString("name"));
		sessionValue.put("account", data.getString("account"));
		return sessionValue;
	}
	
	public static String createSessionID(String id, String name, String account) throws IOException, InterruptedException, ExecutionException {
		
		FirebaseService firebase = new FirebaseService();
		
		ApiFuture<QuerySnapshot> future = firebase.getFirestore().collection(SESSION_ID).get();
		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
		for (QueryDocumentSnapshot document : documents) {
			  if (document.getString("id").equals(id)) {
				  firebase.getFirestore().collection(SESSION_ID).document(document.getId()).delete();
			  }
		}
		Map<String, Object> sessionValue = new HashMap<>();
		sessionValue.put("id", id);
		sessionValue.put("name", name);	
		sessionValue.put("account", account);
		ApiFuture<DocumentReference> addedDocRef = firebase.getFirestore().collection(SESSION_ID).add(sessionValue);
		
		return addedDocRef.get().getId();
	}
	
	public static String saveImage(String firebasePath, CommonsMultipartFile image, String name) throws IOException {
		
		String header = "https://firebasestorage.googleapis.com/v0/b/bookweb-50d11.appspot.com/o/";
		String middle = "%2F";
		String footer = "?alt=media";
		
		//上傳圖片
		FirebaseService firebase = new FirebaseService();
		String bloString = firebasePath + "/" + name;
		firebase.getStorage().bucket().create(bloString, image.getBytes(), image.getContentType());
		
		return header+ firebasePath+ middle+ name+ footer;
	}
	

}
