<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
   href="/picok_project/assets/css/bootstrap.min.css">
<link rel="stylesheet" href="/picok_project/assets/css/templatemo.css">
<link rel="stylesheet" href="/picok_project/assets/css/custom.css">
<link rel="stylesheet"
   href="/picok_project/assets/css/fontawesome.min.css">
<link rel="stylesheet" href="/picok_project/assets/css/liststyle.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="icon" href="assets/img/ms-icon-310x310.png"
   type="image/x-icon">
   
<style type="text/css">
   html, div, body, h3 {
      margin: 0;
      padding: 0;
   }
   h3 {
      display: inline-block;
      padding: 0.6em;
   }
</style>


<script type="text/javascript">
   $(() => {
      let name = ${result}.response.name;
      let email = ${result}.response.email;
      $('#name').html(name + '님 환영합니다.');
      $('#email').html(email);
   });
</script>
 
</head>
<body>

   <!-- 헤더 include -->
   <jsp:include page="common/header.jsp"></jsp:include>
   
   <div class="container-fluid bg-light py-5">
      <div class="row py-3">
         <div class="col-md-6 m-auto text-center">
         <h2 id="name" style="text-align: center;"></h2>
         <h4 id="email" style="text-align: center;"></h4>
         </div>
      </div>
   </div><br/>

<form action="index" method="POST">
    <span style="display: none;">${sessionId}</span>
<!-- 
    ${id}</span><br/>
    ${name}
    ${email}
     ${nickname}
   ${phone_num} -->

   <div style="display: flex; justify-content: center; align-items: center; height: 50px;">
      <input type="submit" class="btn btn-info" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="logout" class="btn btn-outline-info">로그아웃</a>
   </div>
</form>
   <br/><br/>

      <!-- 푸터 include -->
      <jsp:include page="common/footer.jsp"></jsp:include>

      <!-- Script -->
      <script src="https://kit.fontawesome.com/a5f5e6fa14.js"></script>
      <script src="/picok_project/assets/js/jquery-1.11.0.min.js"></script>
      <script src="/picok_project/assets/js/jquery-migrate-1.2.1.min.js"></script>
      <script src="/picok_project/assets/js/bootstrap.bundle.min.js"></script>
      <script src="/picok_project/assets/js/templatemo.js"></script>
      <script src="/picok_project/assets/js/custom.js"></script>
</body>
</html>