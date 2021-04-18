# 프로젝트 서버 구동 전 환경설정

1. 서버 커넥션 풀 세팅
Servers > Tomcat v9.0 Server at localhost-config > context.xml
```
<Resource
  name="jdbc/oracle"
  auth="Container"
  type="javax.sql.DataSource"
  driverClassName="oracle.jdbc.driver.OracleDriver"
  url="jdbc:oracle:thin:@localhost:1521:xe"
  username="helini" 
  password="1234"
  maxActive="50"
  maxWait="-1">
</Resource>
```

2. DB 쿼리 실행

3. 카카오 지도 API
WebContent > view > menu > searchFitCen.jsp 56라인 App Key 수정
포트번호 8080 사용 위해 Oracle 포트번호 다른 번호로 수정