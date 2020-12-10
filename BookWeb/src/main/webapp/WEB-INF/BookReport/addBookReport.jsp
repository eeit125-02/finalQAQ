<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
    response.setHeader("Pragma","no-cache"); // HTTP 1.0
    response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>  
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Insert title here</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <style>
            .bd-placeholder-img {
              font-size: 1.  125rem;
              text-anchor: middle;
            }
      
            @media (min-width: 768px) {
              .bd-placeholder-img-lg {
                font-size: 3.5rem;
              }
            }
            
        </style>
    </head>
    <body>
        <!-- 標題及工作列 -->
        <div class="container">
            <header class="blog-header py-3">
                <div class="row flex-nowrap justify-content-between align-items-center">
                    <div class="col-4 text-center">
                        <a class="blog-header-logo text-dark" href="#">圖書資訊網</a>
                    </div>
                    <div class="col-4 d-flex justify-content-end align-items-center">
                        <a class="btn btn-sm btn-outline-secondary" href="#">登入</a>
                    </div>
                </div>
            </header>
        
            <div class="nav-scroller py-1 mb-2">
                <nav class="nav d-flex justify-content-between">
                    <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        圖書漂流瓶
                    </a>
                    <div class="dropdown-menu text-muted" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item text-muted" href="#">Action</a>
                        <a class="dropdown-item text-muted" href="#">Another action</a>
                        <a class="dropdown-item text-muted" href="#">Something else here</a>
                    </div>
                    <a class="p-2 text-muted" href="#">二手書交易系統</a>
                    <a class="p-2 text-muted" href="#">共讀趣／閱讀沙龍</a>
                    <a class="p-2 text-muted" href="#">討論區</a>
                    <a class="nav-link dropdown-toggle text-muted" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        閱讀履歷
                    </a>
                    <div class="dropdown-menu text-muted" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item text-muted" href="#">Action</a>
                        <a class="dropdown-item text-muted" href="#">Another action</a>
                        <a class="dropdown-item text-muted" href="#">Something else here</a>
                    </div>
                </nav>
            </div>
        </div>
        <!-- 標題及工作列 -->
        <form action=".\BookReportServlet" method="post" id="form1">
            <div class="container">
                <div class="media">
                    <img id = "BkPic" src="<%=request.getAttribute("bkPic")%>" class="w-25 p-3" alt="...">
                    <div class="media-body">
                        <h5 class="mt-0">書名：<%=request.getAttribute("bkName")%>></h5>
                        <p class="mt-0">作者：<%=request.getAttribute("bkWriter")%></p>
                        <p class="mt-0">出版社：<%=request.getAttribute("bkPublish")%></p>
                        <p class="mt-0">評分：<%=request.getAttribute("brScore")%>分</p>
                    </div>
                </div>
                <label for="message-text" class="col-form-label">心得:</label>
                <textarea class="form-control" style="height: 350px;" readonly ><%=request.getAttribute("brContent")%></textarea><br>
                <!--<button type="submit" class="btn btn-secondary btn-lg btn-block">返回</button>-->
            </div>
        </form>
    </body>
</html>