// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js";
import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.2.0/firebase-analytics.js";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDcCvl4MzfMFrWUfshwFPO6YTO0QWQyvvA",
    authDomain: "tuition-centre-application.firebaseapp.com",
    projectId: "tuition-centre-application",
    storageBucket: "tuition-centre-application.appspot.com",
    messagingSenderId: "126957991843",
    appId: "1:126957991843:web:74e7625fe10765ae3b8c16",
    measurementId: "G-QTNQVX1SBR"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);