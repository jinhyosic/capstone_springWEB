![header](https://capsule-render.vercel.app/api?type=waving&color=auto&height=300&section=header&text=ToyFileBoard&fontSize=90&animation=fadeIn&fontAlignY=38&desc=파일_게시판_서브_프로젝트&descAlignY=51&descAlign=62)
<div align="center">
	<img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java&logoColor=white" />
	<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat&logo=HTML5&logoColor=white" />
	<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat&logo=CSS3&logoColor=white" />
    <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white" />
    <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat&logo=Spring Boot&logoColor=white" />
    <img src="https://img.shields.io/badge/Spring Security-6DB33F?style=flat&logo=Spring Security&logoColor=white" />
    <img src="https://img.shields.io/badge/Maven-1572B6?style=flat&logoColor=white" />
    <img src="https://img.shields.io/badge/Thymeleaf-005F0F?style=flat&logo=Thymeleaf&logoColor=white" />
    <img src="https://img.shields.io/badge/IntelliJ IDEA-000000?style=flat&logo=IntelliJ IDEA&logoColor=white" />
</div>

<br/>

## ⚙️ Skill & Library
JAVA (1.8.0)  
MySQL (8.0.30)  
Spring boot (2.7.4)  
Spring Security (2.6.8)  
Maven  
spring-boot-starter-data-jpa  
spring-boot-starter-web  
spring-boot-devtools  
mysql-connector-java  
lombok (1.18.24)  
thymeleaf (2.7.3)  
thymeleaf-extras-springsecurity5  

<br/>

## 💿 IDE

Intellij

<br/>

## 🗄 DB Tool

Mysql WorkBench

<br/>

## 📁 Table DDL
schema는 file입니다  

- **[Member]**  
>create table member (  
id BIGINT(20) auto_increment primary key,  
username varchar(200) not null,  
password varchar(200) not null,  
name varchar(200));
  

- **[storage]**  
>file_id BIGINT(20) auto_increment primary key,  
org_nm varchar(200),  
name varchar(200),  
saved_nm varchar(200),  
saved_path varchar(200));  

<br/>

## 🔗 API
**1. Main View**  
> GET "/"  

**2. 회원가입 page**  
> GET "/member/signup"  

**3. 회원가입 feature(기능)**  
> POST "/member/signup"  

**4. 로그인 page**  
> GET "/member/login"  

**5. 파일 업로드 page**  
> GET "/file/upload"  

**6. 파일 업로드 feature(기능)**  
> POST "/file/upload"  

**7. 업로드 된 파일 리스트 page**  
> GET "/file/listAll"  

**8. 파일의 이미지 불러오는 feature(기능)**  
 - fileId : storage 테이블의 id  
> GET /file/image/{fileId}"  

**9. 파일 다운로드 feature(기능)**  
 - id : storage 테이블의 id  
> GET "/file/attach/{id}"  

<br/>  

## 📒 Note
- application.properties의 file.dir은 로컬 환경에 맞게 수정(대신 프로젝트내의 files폴더로 향하게 수정)  
  - ex) windows : C:/{기타 등등}
  - ex) maxOS : file.dir=/Users/{macbook-id}/torProject/ToyFileBoard/src/main/resources/files/  
  
- application.properties의 spring.datasource url, username, password는 로컬 환경에 맞게 변경  
  
- src/main/resources 아래에 files 폴더를 생성  
  
- csrf는 사용하지 않습니다