import {mxFirebase} from './mx';
import riot from 'riot';
import './index.css';
import './mx.css';

import "./tags/homepage1.tag";
import "./tags/signin.tag";
import "./tags/signup.tag";
import "./tags/detail.tag";
import "./tags/upload.tag";
import route from "riot-route";
import { type } from 'os';

var firebaseConfig = {
    apiKey: "AIzaSyCtnRrPrf75f1Hk6xN4c7rZl08ewCHkkt8",
    authDomain: "camp2-ca443.firebaseapp.com",
    databaseURL: "https://camp2-ca443.firebaseio.com",
    projectId: "camp2-ca443",
    storageBucket: "camp2-ca443.appspot.com",
    messagingSenderId: "1004243049857",
    appId: "1:1004243049857:web:981f3a2ca78c48f7"
  };

mxFirebase.init(firebaseConfig);

route.base("/");

route("/detail/*", async (id) => {
    const detail = riot.mount("div#root", "detail");
    const function_id = await mxFirebase.collection('functions').getOne(id).value;
})

route("/home..", async () => {
    const query = route.query();
    const filter = {};
    const category = query.category || "Tất cả";
    const categoryString = decodeURIComponent(category);
    if (category !== "Tất cả"){
        filter.category = categoryString;
    }
    console.log(filter)
    const pageNo = Number(query.page || 1);
    const page = await mxFirebase.collection("functions").paginate(pageNo, 2, filter);
    const pageTotal = Math.floor(page.total / 2) + 1;
    const opts = {
        functions: page.data,
        pageNo: pageNo,
        pageTotal: pageTotal,
        totalFunction: page.total
    }

    
    document.getElementById("{function_id}").addEventListener("click", (e) => {
        e.preventDefault();
        window.location.href = "/detail/*"
    })
    const homePage = riot.mount("div#root", "homepage", opts);
    
})

route("/upload", async () => {
    const upLoad = riot.mount("div#root", "upload");
    document.getElementById("upload-form").addEventListener("submit", async (e) => {
        e.preventDefault();
        const title = document.getElementById("title").value;
        const func = document.getElementById("func").value;
        const files = []
        document.querySelectorAll("input[type=file]").forEach(element => {
            if (element.files[0]) {
                files.push(element.files[0]);
            }
        });
        const category = document.getElementById("category").value;
        console.log(title);
        console.log(files);
        console.log(category);
        console.log(func);
        const fileUrls = await mxFirebase.putFiles(files);
        const r = await mxFirebase.collection('functions').save({
            title,
            fileUrls,
            category,
            func
        })
        console.log(r);
        window.location.href = "/home";
        
    })
    
    
    
})




route("/signin", () => {
    const signIn = riot.mount("div#root", "signin");
    document.getElementById("sign-in-form").addEventListener("submit", async (e) => {
        e.preventDefault();
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;
        try {
            await mxFirebase.signIn(email, password);
            console.log("success");
            window.location.href = "/home";
        } catch(err) {
            document.getElementById("error-message").innerText = err.message;
        }
    });
})

route("/signup", () => {
    const signUp = riot.mount("div#root", "signup");
    document.getElementById("sign-up-form").addEventListener("submit", async (e) => {
        e.preventDefault();
        const email = document.getElementById("email").value;
        const password1 = document.getElementById("pass_1").value;
        const password2 = document.getElementById("pass_2").value;
        if (password1==password2){        
            const r = await mxFirebase.signUp(email, password1);
            window.location.href = "/signin";
            
        }
        else {
            document.getElementById("error-message").innerText = "Mời bạn nhập lại mật khẩu";  
        }
        
            
        



  })
    
})




route.start(true);