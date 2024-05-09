# GALGODA 호텔 예약 사이트

## 소개
GALGODA는 GALGODA 호텔 계열이 소유하고 있는 호텔을 예약 및 관리하는 사이트입니다.
일반 고객은 특정 키워드와 미리 등록된 태그로 호텔을 빠르게 검색해 예약이 가능합니다.
일반 고객 및 호텔 회원은 회원가입, 로그인, 목록 조회, 정보 수정이 가능합니다.
호텔 회원은 호텔의 이미지를 포함한 각종 정보를 등록, 조회, 수정, 삭제가 가능합니다. 
호텔명 등 키워드로 검색, 등록된 태그로 검색, 위시리스트 추가 등 다양한 편의 기능을 추가하였습니다.

### 목표
회원 및 호텔 정보를 생성, 읽기, 업데이트, 삭제할 수 있는 시스템을 Eclipse를 사용하여 개발하고, 
이를 통해 CRUD 기능을 활용한 웹 프로그래밍의 기본 개념을 습득하고자 하였으며,
결제하기, 주소찾기 등에 API를 활용하여 외부 API 활용의 기초적인 방식을 배우고자 했습니다.

### 기능
1. 사용자(고객)
   - 로그인 : 회원가입, 로그인, ID/PW 찾기
   - 호텔 : 태그/키워드 검색, 찜하기, 리뷰 조회
   - 예약/결제 : 호텔 선택, 이용금액 결제
   - 마이페이지 : 예약 조회/변경/취소, 리뷰 등록/삭제, 정보수정/회원탈퇴, 위시리스트 관리
2. 사용자(호텔)
   - 로그인 : 회원가입, 로그인, ID/PW 찾기
   - 호텔 : 호텔 정보 수정, 리뷰관리, 사용자 신고, 객실 등록/수정
   - 예약 : 예약 현황 조회, 예약 승인/취소
   - 마이페이지 : 정보수정/회원탈퇴
   - 고객센터 : 공지사항, 문의사항 확인/답변
3. 관리자(사이트)
   - 홈페이지 : 이용약관 관리
   - 호텔 관리 : 태그 관리, 등록 현황 조회, 호텔 계정 관리
   - 사용자 관리 : 개인정보 조회, 사용자 계정 관리, 회원 수정
   - 고객센터 : 문의사항 관리, 공지사항 관리, 신고 관리
   
### 스택
| 언어 | DB | IDE | 배포 | 기술 |
| --- | --- | --- | --- | --- |
|<img src="https://img.shields.io/badge/java-%23ED8B00.svg?style=flat-square&logo=openjdk&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/html5-%23E34F26.svg?style=flat-square&logo=html5&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/css3-%231572B6.svg?style=flat-square&logo=css3&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/javascript-%23323330.svg?style=flat-square&logo=javascript&logoColor=%23F7DF1E">|<img src="https://img.shields.io/badge/Oracle-F80000?style=flat-square&logo=oracle&logoColor=white">|<img src="https://img.shields.io/badge/Eclipse-FE7A16.svg?style=flat-square&logo=Eclipse&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=flat-square&logo=visual-studio-code&logoColor=white">|<img src="https://img.shields.io/badge/apache%20tomcat-%23F8DC75.svg?style=flat-square&logo=apache-tomcat&logoColor=black">&nbsp;<img src="https://img.shields.io/badge/github-%23121011.svg?style=flat-square&logo=github&logoColor=white">|<img src="https://img.shields.io/badge/jquery-%230769AD.svg?style=flat-square&logo=jquery&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/bootstrap-%238511FA.svg?style=flat-square&logo=bootstrap&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/JSP-3776AB.svg?style=flat-square&logo=JSP&logoColor=white">&nbsp;<img src="https://img.shields.io/badge/JSON-3776AB.svg?style=flat-square&logo=JSON&logoColor=white">|

### DB구성
<img width="461" alt="GALGODA_ERD" src="https://github.com/Lee-Da-Ye/GalgodaProject/assets/148595981/3a4be9d4-3ac3-4279-907a-7c8589038d17">
