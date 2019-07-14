<homepage>
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
     <div>
        <img style="width: 100vw;" src="https://fruitsandveggies.org/wp-content/uploads/2009/06/natalie-walters-420837-unsplash-1400x467.jpg" alt="">
    </div>
    <div class="grid" style="width:100%; display: flex; flex-flow: column">
        <div style="display: flex;flex-flow: row">
            <div class="column" id="filter">
                    <a href="/home" class="category">Tất cả</a></li>
                    <a href="/home?category=diet" class="category">Món ăn kiêng</a></li>
                    <a href="/home?category=normal" class="category">Món ăn thông thường</a></li>
                    
                </div>
                <div id="product">
                    <p class="functions_label grid-middle" style="color: #12b54e;"> Các món ăn</p>
                    <div id="image-box">
                        <a id="{function_id}" href="/detail/{function_id}">
                            <div class="col-4" each="{function in opts.functions}">
                                <img class="image" src="{function.fileUrls[0]}" alt="">
                                <p style="color: #12b54e; text-align: center;">{function.title}</p>
                            </div>
                        </a>
                        
                    </div>
                </div>
        </div>
        <div style="display:flex;flex-flow:row;align-self:flex-end;margin-right:50px"> 
            <a class="page-button" href="/home?page={opts.pageNo - 1}" mx-disabled={opts.pageNo==1}><button class="btn">pre</button></a>
            <p style="color: #12b45e;"> {opts.pageNo}/{opts.pageTotal} </p>
            <a class="page-button" href="/home?page={opts.pageNo + 1}" mx-disabled={opts.pageNo>= opts.pageTotal}><button class="btn">next</button></a>
        </div>
    </div>
</homepage>