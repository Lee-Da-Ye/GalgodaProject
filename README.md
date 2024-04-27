# 호텔 예약 사이트 GALGODA 프로젝트

<p align="center">
  <br>
  <img width="784" alt="GALGODA MAIN" src="https://github.com/Lee-Da-Ye/GalgodaProject/assets/148595981/11526876-b41b-417a-a7bb-fbc126350914">

  <br>
</p>

## 프로젝트 소개
- 프로젝트 이름: GALGODA
- 프로젝트 지속기간: 2024.14-2024.03.29
- 멤버: 팀 어디갈땐여기조(이다예, 노하연, 이상현, 임세진, 황민우)
- 프로젝트 제작 동기 : 기존 호텔 예약 사이트에서 원하는 호텔을 검색할 때까지 많은 시간이 소요되는 점을 개선하고자
  사용자가 원하는 키워드와 태그로 빠르게 원하는 호텔을 검색할 수 있는 사이트를 만들고자 했습니다.

<br>

## 기술 스택

<div align=center> 
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <br>
  
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <br>
  
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <br>
  
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
  <br>

  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
  <br>
  
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <br>
</div>

<br>

## 담당 구현 기능

### 기능 1 : 회원가입
- 본인인증 기능 구현 시 CoolSMS API를 활용
- 회원가입 정보 중 주소 입력 시 카카오 주소찾기 API를 활용
- Youtube Link : https://youtu.be/VXgCZ89Z2v0

### 기능 2 : 로그인
- 일반회원/호텔회원/관리자로 유저 DB를 구분하여 각 유저타입에 맞게 로그인 처리
- Youtube Link : https://youtu.be/YbZjcLhWam0

### 기능 3 : ID 찾기 / PW 재설정
- CoolSMS API를 활용하여 본인인증 완료 시 아이디 찾기 및 비밀번호 재설정 가능하도록 구현
- 비밀번호 재설정 시 유효성 검사를 수행
- Youtube Link : https://youtu.be/AzvJfRGIBuI

### 기능 4 : 마이페이지(고객)
- 고객별 예약 내역 조회 페이징 처리
- 체크인/체크아웃, 객실타입, 객실 수 변경에 따라 예약금액이 변경되도록 JavaScript를 활용하여 구현
- 변경금액 결제는 포트원 API를 활용하여 카카오페이 테스트 결제로 구현
- Youtube Link : https://youtu.be/kBBnRA6ruko

### 기능 5 : 메인페이지(예약 및 결제)
- 사이트 소개 페이지는 텍스트 오버레이, 호버 속성 등을 활용하여 구현
- 예약 금액 결제는 포트원 API를 활용하여 카카오페이 테스트 결제로 구현
- Youtube Link : https://youtu.be/dsaf_erGM88

<br>

## 프로젝트 후기

<p align="justify">
팀 프로젝트의 본격적인 기능 구현 전에 진행하는 체계적인 초기 설계의 중요성을 느꼈습니다. 기능 구현을 하면서 DB가 맞지 않아 변경하는 부분도 많았고, 화면에 데이터를 불러오기 위해 수정한 부분도 있었습니다. 또한, 수업 때 배운 코드를 참고한 부분이 많았다고 생각이 되어서 다음 프로젝트에서는 보다 더 체계적으로 설계하고, 코드 참고를 최소화해서 직접 고민해보는 시간을 많이 가져보고 싶습니다. 계획했던 기능을 모두 구현하는 것이 목표였기 때문에 목표 달성을 위해 빠르게 작업을 진행하면서 팀원들과 함께 해결한 이슈가 어떤 이슈이며 어떻게 해결했는지에 대해 자세히 기록하지 못한 점은 다음 프로젝트에서 보완해야 할 점이라고 생각합니다.
</p>

<br>
