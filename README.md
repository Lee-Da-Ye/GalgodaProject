> # 구디아카데미 Semi 프로젝트
<br>

> ## 프로젝트 개요
  - 국비지원 자바 개발자 양성과정에서 진행한 팀 프로젝트
  - 기간 : 2024년 2월 14일 ~ 2024년 3월 29일(최종 발표)
<br>

> ## 팀명: <b>어디갈땐여기조</b>
  - 팀주제: 호텔 예약 사이트
  - 사이트명: GALGODA
<br>

> ## 팀원
  - <b>이다예</b>(조장)
  - <b>노하연</b>
  - <b>이상현</b>
  - <b>임세진</b>
  - <b>황민우</b>

<br>

  
> ## 사용 기술 스택
>> ### 사용 언어
>  - FE(Front End)
>    - JSP
>    - CSS
>    - Javascript
>    - jQuery
>    
>  - BE(Back-End)
>    - Language: Java, Ajax
>    - WAS(Web-Application-Server): Apache Tomcat 9.0
>    - Database
>      - RDBMS: Oracle 
>    - Developer tool
>      - Java: Eclipse
>      - Oracle: SQL-Developer
>
>  - 사용 디자인 패턴: **MVC 패턴**
>
>
>>  ### 사용한 오픈 API
>  - BootStrap
>  - 카카오 주소 찾기 API
>  - 포트원 결제 API
>  - coolSMS 본인인증 API
>  - 카카오 지도 API
<br><br>

> ## 프로젝트 기능 구현

- ### **이다예**
    - 로그인 (FE/BE)
      - 회원가입
      - 휴대폰 본인인증
      - 아이디 찾기
      - 패스워드 재설정
     
    - 마이페이지(고객) (FE/BE)
      - 고객별 예약내역 조회(페이징 처리)
      - 예약 변경/취소
      - 변경금액 결제
      - 개인정보 수정/회원탈퇴
      - 리뷰내역 조회 (FE)
      - 리뷰 등록/수정/삭제 (FE)
   
    - 마이페이지(호텔) (FE/BE)
      - 담당자 정보 수정/회원탈퇴

    - 메인페이지
      - 사이트 소개 페이지 (FE/BE)
      - 예약 상세 조회 (BE)
      - 예약 결제 및 완료 (FE/BE)
   

- ### **노하연**
    - 메인페이지
      - 호텔 검색 (FE)
      - 호텔 선택 (FE)
      - 예약 상세 (FE)
    - 마이페이지(고객)
      - 리뷰 내역 조회 (BE)
      - 리뷰 등록/수정/삭제 (BE)
      
- ### **이상현**
    - 호텔 관리 (FE/BE)
      - 호텔 등록현황 관리
      - 호텔코드 등록
      - 태그 관리
      - 추가 옵션 관리

   - 사용자 관리 (FE/BE)
     - 사용자 계정 조회/수정/삭제
    
   - 홈페이지 관리 (FE/BE)
     - 이용약관 등록/수정/삭제
    
   - 메인페이지
     - 호텔 선택 상세 페이지 (BE)
  
- ### **임세진**
   - 호텔 관리 (FE/BE)
     - 호텔 등록
     - 호텔 정보 수정
     - 객실 등록/수정/삭제
     - 리뷰 조회(사용자/리뷰 신고)
     
  - 예약 관리 (FE/BE)
    - 예약 목록 조회
    - 예약 승인/취소
    - 사용자 신고

  - 메인페이지
    - 호텔 검색 조회 페이지 (BE)

- ### **황민우**
  - 공지사항 관리 (FE/BE)
    - 공지사항 목록 조회
    - 공지사항 등록/수정/삭제
     
  - 문의사항 관리 (FE/BE)
    - 문의사항 목록 조회
    - 일대일 문의 기능
      - 일대일 문의하기
      - 일대일 문의 내역 조회
      - 일대일 문의 답변 등록/수정
    - 자주 묻는 질문

  - 신고 관리 (FE/BE)
    - 신고계정 목록 조회 및 처리
    - 신고리뷰 목록 조회 및 처리

  - 메인페이지
    - 검색 메인페이지 (BE)

<br><br><hr>

> # 결과물

<h4>1. 메인화면</h4>

![메인페이지](https://github.com/Regina0331/GalgodaProject/assets/148595981/f9a69b28-121e-4197-9bd3-5e53ad509e02)

- 호텔 검색 기능 : 호텔명으로 검색 or 사이트 관리자가 등록해 놓은 태그명으로 검색
- 인기 호텔 보여주기 : 예약 건수가 많은 순으로 정렬해서 최대 4개까지 인기 호텔을 보여줌
- 메인 로고 클릭 시 메인 페이지로 이동

<br><br>

<h4>2. 사이트 소개</h4>

![사이트 소개](https://github.com/Regina0331/GalgodaProject/assets/148595981/18aee62d-e61e-4be3-bae0-6026bb0e6d18)

- 푸터바의 GALGODA소개 링크 클릭 시 사이트 소개 페이지로 이동

<br><br>

<h4>3. 회원가입</h4>

<br>

<h4>3.1 회원가입 약관</h4>

 ![회원가입 약관](https://github.com/Regina0331/GalgodaProject/assets/148595981/33026916-6912-458d-bfd1-f40b08c15a46)

- 필수 동의 이용약관에 체크해야만 [본인인증 하기] 버튼 활성화

<br>

<h4>3.2 회원가입 본인인증</h4>

 ![회원가입 본인인증](https://github.com/Regina0331/GalgodaProject/assets/148595981/887c8ed8-6083-4251-849b-a47b6aab0551)

- coolSMS API를 활용하여 휴대폰 번호를 이용한 본인인증 기능 구현
- 인증번호 확인이 완료되어야 [회원가입 화면으로 이동] 버튼 활성화
- 회원가입 화면은 일반회원/호텔회원으로 구분됨


<br>

<h4>3.3 회원가입 (일반회원)</h4>

 ![일반회원 회원가입](https://github.com/Regina0331/GalgodaProject/assets/148595981/60842640-ab1a-41bb-85c1-e841d25cc90d)

- '*'표시 항목은 필수 입력값
- 주소는 카카오 주소찾기 API를 활용
- 이메일, 아이디 중복확인은 실시간 유효성 체크 적용
- 이메일 중복확인, 아이디 중복확인, 비밀번호 일치확인 모두 완료해야 [회원가입 완료] 버튼 활성화

<br>

<h4>3.4 회원가입 (호텔회원)</h4>

 ![호텔회원 회원가입](https://github.com/Regina0331/GalgodaProject/assets/148595981/20860599-92b7-4ace-a782-6a314a21d967)

 - 호텔 회원의 경우, 사이트 관리자가 호텔명에 따른 호텔 코드를 미리 등록해야 해당 계정으로 회원가입이 가능함
 - '*'표시 항목은 필수 입력값
 - 이메일 중복확인, 아이디 중복확인, 비밀번호 일치확인 모두 완료해야 [회원가입 완료] 버튼 활성화
 
<br><br>

<h4>4. 로그인</h4>

<br>

<h4>4.1 유형별 로그인</h4>
 
 ![로그인_유형별](https://github.com/Regina0331/GalgodaProject/assets/148595981/472d1942-0762-42b8-8128-b033b09be599)

- 고객/호텔/관리자 중 로그인 유형 선택 후 아이디 및 비밀번호 입력

<br>
 
<h4>4.2 아이디 찾기</h4>

 ![로그인_아이디찾기](https://github.com/Regina0331/GalgodaProject/assets/148595981/0b6cc789-7115-46d6-b24a-1ddc391bb37b)

- 고객/호텔/관리자 중 로그인 유형 선택 후 이름, 휴대폰 번호, 인증번호로 본인확인
- 회원가입 시 본인인증 때와 동일하게 coolSMS API를 활용하여 인증번호 받기
- 인증번호 확인이 완료되어야 [휴대폰 번호로 아이디 찾기] 버튼 활성화


<br>

<h4>4.3 패스워드 재설정</h4>

 ![로그인_패스워드재설정](https://github.com/Regina0331/GalgodaProject/assets/148595981/770b5e5f-bec8-4332-8aec-6cded0b6ec8c)

- 고객/호텔/관리자 중 로그인 유형 선택 후 아이디, 휴대폰번호, 인증번호로 본인확인
- 회원가입 시 본인인증 때와 동일하게 coolSMS API를 활용하여 인증번호 받기
- 인증번호 확인이 완료되어야 [비밀번호 재설정] 버튼 활성화
- 비밀번호 재설정 완료 시 메인페이지로 이동


<br><br>

<h4>5. 호텔 예약</h4>

<br>

<h4>5.1 호텔 검색</h4>

 ![호텔 검색](https://github.com/Regina0331/GalgodaProject/assets/148595981/f1936373-d10f-4535-a719-2de845867aab)

- 호텔 검색은 호텔명/태그명 둘 중 하나로 선택해서 가능

<br>


<h4>5.2 호텔 위시리스트 추가</h4>

 ![위시리스트 추가](https://github.com/Regina0331/GalgodaProject/assets/148595981/e8777bae-628b-41e2-9bec-096b613b7abc)

- 로그인 한 상태에서 호텔 검색 후 위시리스트에 추가되어 있지 않은 호텔의 하트 이모티콘 클릭 시 위시리스트에 추가됨

<br>


<h4>5.3 예약 호텔 상세 페이지</h4>

 ![호텔 상세 페이지](https://github.com/Regina0331/GalgodaProject/assets/148595981/46337e71-2e41-4f8f-8b19-78a40b6ed564)

- 검색 후 선택한 호텔의 상세 내용을 확인할 수 있는 페이지
- 카카오 지도 API를 활용하여 각 호텔에 등록된 주소를 표시
- 각 호텔별 세부 객실 이미지 및 가격, 세부 내용을 확인할 수 있고 예약 가능 여부를 표시
- 로그인이 되어 있지 않을 경우 [예약하기] 버튼 클릭 시 로그인 화면으로 이동

<br>


<h4>5.4 예약 상세 페이지</h4>

 ![예약 상세 페이지](https://github.com/Regina0331/GalgodaProject/assets/148595981/85d31ca6-ab21-48c2-8f0e-1875ebe2e320)

- 고객이 호텔 검색 후 선택한 사항들이 반영된 예약 상세 페이지
- 로그인한 고객 정보와 별개로 예약자 정보를 입력 가능하며, 이름/E-mail/전화번호 모두 입력 시 [결제하기] 버튼 활성화
- 
<br>


<h4>5.5 결제 & 예약</h4>

 ![결제 및 예약 완료](https://github.com/Regina0331/GalgodaProject/assets/148595981/1f22f521-bc69-422a-8880-9983a391ae8f)

- 결제는 포트원 결제 API를 적용하였으며, 카카오페이로 실결제 없이 테스트 결제만 가능함
- 결제하기 완료 시 [최종 예약 완료하기] 버튼 활성화
- [최종 예약 완료하기] 버튼 클릭 시 예약이 완료되며, 예약 대기 상태로 마이페이지에 반영됨

<br><br>

<h4>6. 마이페이지(고객)</h4>

<br>

<h4>6.1 예약현황 관리 및 상세조회</h4>

 ![마이페이지_예약관리](https://github.com/Regina0331/GalgodaProject/assets/148595981/4c427e0f-6503-40ea-b14d-7bb973b4a945)

- 예약 현황 페이지의 경우, 현재 날짜이거나 현재 날짜 이전의 예약 건은 예약변경/취소 버튼 비활성화
- 상세조회 버튼 클릭 시 호텔 정보 및 예약자 정보 확인 가능

 <br>
 
<h4>6.2 예약변경</h4>

 ![마이페이지_예약변경](https://github.com/Regina0331/GalgodaProject/assets/148595981/c7b4ca74-c7b7-493b-8699-3f03dfa58984)

- 체크인/체크아웃날짜, 예약인원, 객실타입, 객실 수, 추가 옵션, 예약자명, 연락처, 이메일 변경 가능
- 예약인원을 3명으로 선택할 경우 객실타입은 스위트룸만 선택 가능
- 체크인/체크아웃날짜, 객실타입, 객실 수에 따라 하단의 결제금액이 변동됨
- 변경사항 적용 후 [예약변경] 버튼을 클릭해야 변경된 사항이 적용됨
- 예약변경 이후 [예약변경 후 결제하기] 버튼 클릭하여 변경된 금액으로 결제 가능 (포트원 결제 API)

<br>

<h4>6.3 예약 취소</h4>

 ![마이페이지_예약취소](https://github.com/Regina0331/GalgodaProject/assets/148595981/85c68f27-e1ae-40c9-8341-8aa7fe400f39)

- 예약 변경 페이지에서 [예약취소] 버튼 클릭 시 예약 취소를 다시 한번 확인하는 모달창이 뜸
- 해당 모달창에서 [확인] 버튼 클릭 시 예약이 취소되며 마이페이지 예약현황 관리에서 [예약취소]로 표시가 됨


<br>

<h4>6.4 위시리스트</h4>

 ![마이페이지_위시리스트](https://github.com/Regina0331/GalgodaProject/assets/148595981/bf72e165-4a1e-48d6-b513-376f99eda9cf)

- 사용자가 찜한 호텔들을 확인할 수 있는 페이지
- 하트 이모티콘을 클릭하면 하트가 해제되면서 위시리스트 페이지에서도 삭제됨

<br>

<h4>6.5 리뷰관리 및 등록</h4>

 ![마이페이지_리뷰관리 및 등록](https://github.com/Regina0331/GalgodaProject/assets/148595981/29634dbf-76e4-4ede-b9bf-4b2fa799764f)

- 사용자 예약 건 관련 작성 전/작성 완료로 리뷰가 구분됨
- 리뷰 등록 시 평점 기록, 제목 및 내용 작성 가능함


<br>

<h4>6.6 리뷰수정 및 삭제</h4>

 ![마이페이지_리뷰수정및삭제](https://github.com/Regina0331/GalgodaProject/assets/148595981/313e0245-3ba8-4718-8d6a-d93bc2fb826a)

 - 기등록된 리뷰를 수정 가능하며, 삭제 시 해당 예약 건은 다시 리뷰 작성 전 상태로 분류됨

<br>

<h4>6.7 개인정보 수정</h4>

 ![마이페이지_정보수정](https://github.com/Regina0331/GalgodaProject/assets/148595981/d148979b-adee-474a-bee6-c8ad64790de3)

- 비밀번호 입력 후 개인정보 수정 페이지 진입
- 아이디는 변경 불가하며, 비밀번호는 비밀번호 변경 모달창을 통해 변경 가능
- 이메일 중복확인 버튼을 클릭해야 [정보수정] 버튼 활성화 됨

<br><br>

> ## 마이페이지(호텔)
 >> ## 호텔 신규 등록
 
 ![마이페이지_호텔등록](https://github.com/Regina0331/GalgodaProject/assets/148595981/64038e7c-b0ba-404f-9bb5-73789e3809cc)

 >> ## 호텔 객실 등록

 ![마이페이지_객실등록](https://github.com/Regina0331/GalgodaProject/assets/148595981/3c8a7afe-48b6-4a74-85d6-e29b63a3a9f3)

 >> ## 호텔 리뷰 관리 (사용자/리뷰 신고)
 
 ![마이페이지_호텔리뷰관리](https://github.com/Regina0331/GalgodaProject/assets/148595981/01f603d4-3e89-4a67-a282-dddc63aa9e33)

 >> ## 호텔 예약 관리

 ![마이페이지_호텔예약관리](https://github.com/Regina0331/GalgodaProject/assets/148595981/a62ca01d-45bd-464e-84e4-2658f949a89d)

 >> ## 호텔 담당자 정보 수정

 ![마이페이지_담당자정보수정](https://github.com/Regina0331/GalgodaProject/assets/148595981/ea9e38b2-e3aa-4d29-a850-9069ea38f967)

<br><br>

> ## 고객센터
 >> ## 비로그인 상태 고객센터 내용

 ![고객센터_비로그인](https://github.com/Regina0331/GalgodaProject/assets/148595981/b501fb3b-9eab-428a-b7d3-7db41392a443)

 >> ## 로그인 상태 고객센터 & 일대일문의 등록

 ![고객센터_로그인_일대일문의](https://github.com/Regina0331/GalgodaProject/assets/148595981/b2caa786-4f43-4696-b9cb-6d2f1a3cddfe)

 >> ## 호텔 - 고객센터 공지 등록

 ![고객센터_호텔공지등록](https://github.com/Regina0331/GalgodaProject/assets/148595981/75e3acad-550a-46b7-b94a-da199b95afd7)

 >> ## 호텔 - 고객센터 일대일문의 답변 등록

 ![고객센터_일대일문의답변등록](https://github.com/Regina0331/GalgodaProject/assets/148595981/dd53f710-f7a9-452f-ae54-bae33f888dd1)

 >> ## 관리자 - 고객센터 신고계정 관리

 ![고객센터_관리자_신고계정](https://github.com/Regina0331/GalgodaProject/assets/148595981/abda44ed-e378-409e-b318-9f1e2b7dbee4)

 >> ## 관리자 - 고객센터 신고리뷰 관리

 ![고객센터_관리자_신고리뷰](https://github.com/Regina0331/GalgodaProject/assets/148595981/37c26348-f17f-44b9-961b-903b32ee4991)

<br><br>

> ## 관리자 페이지
 >> ## 호텔등록현황 조회

 ![관리자_호텔등록현황 조회](https://github.com/Regina0331/GalgodaProject/assets/148595981/838b8d13-6bcc-4ac7-afa3-94a79b163e2b)

 >> ## 호텔계정 수정 및 삭제

 ![관리자_호텔계정수정및삭제](https://github.com/Regina0331/GalgodaProject/assets/148595981/70589eec-eacd-4e4e-af1b-82824da8602e)

 >> ## 호텔코드등록, 수정 및 삭제

 ![관리자_호텔코드등록](https://github.com/Regina0331/GalgodaProject/assets/148595981/4a800769-0f9a-429e-b039-44745136275f)

 >> ## 호텔 태그관리

 ![관리자_태그관리](https://github.com/Regina0331/GalgodaProject/assets/148595981/49f3ede3-ed19-4e4f-b1b6-c732e73ed624)

 >> ## 호텔 추가옵션 관리 

 ![관리자_추가옵션 관리](https://github.com/Regina0331/GalgodaProject/assets/148595981/7d84ab81-00f7-4036-804f-d25167d03013)

 >> ## 사용자 관리

 ![관리자_사용자관리](https://github.com/Regina0331/GalgodaProject/assets/148595981/d5ca7662-4c7d-44b1-9f6e-a2ded4f85323)

 >> ## 이용약관 관리

 ![관리자_이용약관](https://github.com/Regina0331/GalgodaProject/assets/148595981/d13dc0a1-4851-43ca-b90a-951e9c47c8dc)

 
<br><br><br>





 
