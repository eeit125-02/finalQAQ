package com.web.book.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.google.api.core.ApiFuture;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.web.book.model.MemberBean;

public class GlobalService {	
	
	static MemberBean loginMember;
	
	public static final String SYSTEM_NAME ="";
	
	public static MemberBean getLoginMember() {
		return loginMember;
	}

	public static void setLoginMember(MemberBean loginMember) {
		GlobalService.loginMember = loginMember;
	}

	public static String getMemberEncoder (String passwordString) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(passwordString);
	}
	
	public static Boolean checkMemberEncoder(String checkMemberPassword , String loginMemberPassword){
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(checkMemberPassword, loginMemberPassword);
	}
	
	public static Map<String, String> getSession(String sessionID) throws InterruptedException, ExecutionException, IOException{
		
		FirebaseService firebase = new FirebaseService();
		DocumentReference session = firebase.getFirestore().collection("SessionID").document(sessionID);
		Map<String, String> sessionValue = new HashMap<>();
		DocumentSnapshot data =  session.get().get();
		sessionValue.put("id",data.getString("id"));
		sessionValue.put("name", data.getString("name"));
		sessionValue.put("account", data.getString("account"));
		return sessionValue;
	}
	
	public static String createSessionID(String id, String name, String account) throws IOException, InterruptedException, ExecutionException {
		
		FirebaseService firebase = new FirebaseService();
		
		ApiFuture<QuerySnapshot> future = firebase.getFirestore().collection("SessionID").get();
		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
		for (QueryDocumentSnapshot document : documents) {
			  if (document.getString("id").equals(id)) {
				  firebase.getFirestore().collection("SessionID").document(document.getId()).delete();
				  break;
			  }
		}
		Map<String, Object> sessionValue = new HashMap<>();
		sessionValue.put("id", id);
		sessionValue.put("name", name);	
		sessionValue.put("account", account);
		ApiFuture<DocumentReference> addedDocRef = firebase.getFirestore().collection("SessionID").add(sessionValue);
		
		return addedDocRef.get().getId();
	}

}
