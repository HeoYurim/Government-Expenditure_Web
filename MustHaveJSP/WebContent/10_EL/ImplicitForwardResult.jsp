<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!DOCTYPE html><html><head><meta charset="UTF-8">
<title>FormResult.jsp</title>
</head>
<body>
   <h3>EL로 폼 값 받기</h3>
   <ul>
      <li>이름 : ${ param.name }</li>
      <li>성별 : ${ param.gender }</li>
      <li>학력 : ${ param.grade }</li>
      <li>관심 사항 : ${ param.inter[0] }
      ${ param.inter[1] }
      ${ param.inter[2] }
      ${ param.inter[3] }</li>
   </ul>
</body>
</html>