<signin>
    <div class="grid-middle navbar" id="header">
        <div class="col-3 no-padding logo">
            <div><a href="/home"><img id="logo_img" src="https://i.imgur.com/hjbEKrY.png" alt=""></a></div>
            <div id="veget"><p style="font-size: 30px; color: #12b54e;">VegetMe</p></div>
            
        </div>
        <div id="btn_co">
            <a href="/signin" id="btn_si" style="font-size: 16px; text-decoration: none;">Đăng nhập</a>
            <a href="/signup" id="btn_su" style="font-size: 16px; text-decoration: none;">Đăng kí</a>
            <a href="/upload" id="btn_up" style="font-size: 16px; text-decoration: none;">Tải lên</a>
        </div>
    </div>

    <div class="sign-in grid-middle-center">
        <div class="sign-in-content" >
            <h1 style="text-align: center; font-size: 32px; color: whitesmoke;" class="fullwidth" >Đăng nhập</h1>
            <form id="sign-in-form" action="">
                <div class="combo">
                    
                    <label class="text" for="">Địa chỉ email</label>
                    <input class="fullwidth" placeholder="Email của bạn" id="email" type="email" required>
                    
                    <label class="text" for="">Mật khẩu</label>  
                    <input class="fullwidth" placeholder="Mật khẩu của bạn" id="password" type="password" required>
                    
                    <div id="reme">
                        <input type="checkbox" name="" id="">
                        <div>Nhớ mật khẩu</div>
                    </div>
                    <p id="error-message" class="text fullwidth" style="color: red; font-size: 16px;"></p>
                      
                </div>
                <button id="btn_signin" style="color: white; font-size: 16px;">Đăng nhập</button> 
            </form>
        </div>
    </div> 
</signin>