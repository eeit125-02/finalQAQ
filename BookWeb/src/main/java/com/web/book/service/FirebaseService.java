package com.web.book.service;

import java.io.IOException;
import java.io.InputStream;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;

public class FirebaseService {
	
	
	public FirebaseService() throws IOException {
		InputStream serviceAccount = this.getClass().getClassLoader().getResourceAsStream("./firebase_config.json");
		GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
		FirebaseOptions options = FirebaseOptions.builder()
								    .setCredentials(credentials)
								    .build();
		
		if(FirebaseApp.getApps().isEmpty()){			
			FirebaseApp.initializeApp(options);			
		}
		
	}

	public Firestore getFirestore() {
		return FirestoreClient.getFirestore();
	}
}
