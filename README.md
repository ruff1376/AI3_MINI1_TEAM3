# 💪 할건해야짐
> 헬스장 통합 관리 웹페이지
--- 

## 👥 프로젝트 참여 인원

| 프로필 | 이름 | 역할 |
|--------|------|------|
| <img src="https://avatars.githubusercontent.com/ruff1376" width="40"> | [한지용](https://github.com/ruff1376) | 메인 화면, 회원 관리 |
| <img src="https://avatars.githubusercontent.com/GUNW-O-O" width="40"> | [고건우](https://github.com/GUNW-O-O) | 기구 현황, 매출 현황 |
| <img src="https://avatars.githubusercontent.com/jjwon55" width="40"> | [전주원](https://github.com/jjwon55) | 예약 관리 |
| <img src="https://avatars.githubusercontent.com/hoodie-kr" width="40"> | [한동훈](https://github.com/hoodie-kr) | 문의사항 |


## 🛠 기술 스택
- **Language**: Java, HTML, CSS, JavaScript
- **Database**: MySQL
- **Framework & Library**: JSP, Servlet, Apache Tomcat, Lombok, Bootstrap, chart.js, choices.js
- **Development Tool**: Eclipse, GitHub


## 📝 주요 기능 (Features)
### 1. 메인
- 트레이너, 날짜 선택 후 이에 맞는 PT 일정, 점검 필요 기구, 미답변 문의사항 목록 표시
- PT 일정 : 트레이너의 PT 일정(날짜, 회원)이 시간 순으로 표시
- 점검 필요 기구 : 기구 상태에 ‘점검’이란 단어가 포함되어 있는 기구 목록 표시
- 미답변 문의사항(미구현) : 답변이 없는 문의사항 목록 표시 및 클릭 시 답변 화면으로 이동

### 2. 회원 관리
- 회원 목록 표시 및 회원명 검색
- 회원 정보 상세 조회

### 3. 기구 관리
- 운동기구 조회, 등록, 수정, 삭제
- 카테고리(유산소, 케이블, 원판, 기타) 별로 리스트를 표시
- 카테고리 버튼을 클릭하면 해당 카테고리로 이동하는 화면
- 상태란에 “점검” 과 같은 키워드 등록시 메인화면 TODO에 노출
- 표의 내용 클릭시 수정, 삭제 화면으로 이동

### 4. 매출 관리
- 차트뷰 에서는 최근1개월, 최근 1주, 전체 매출을 확인가능
- 각 트레이너 별로 다른 색상의 그래프를 토글 가능
- (미구현) 기간별로 묶어서 한점의 데이터로 표현
- 리스트뷰 트레이너별 전체 매출을 확인가능
- 리스트뷰에서는 트레이너 별로 아코디언탭이 생성
- 아코디언탭 내부의 표를 클릭시 매출 확인, 수정, 삭제 화면으로 이동 가능
- (미구현) 트레이너별 매출목록 페이징처리
- (미구현) 트레이너별 매출 날짜 조회기능

### 5. 예약 관리
- 트레이너 스케줄 조회, 등록, 수정, 삭제
- 달력 기반 UI로 트레이너 스케줄 조회
- 날짜 클릭시 해당 날짜에 시간표 출력
- 셀 클릭 → 회원 조회/선택 → 예약 저장
- 중복 방지 / 수정 / 삭제 기능 포함
- 회원 자동완성 (이름 + 전화번호)

### 6. 문의사항
- 관리자용 문의사항 목록 조회
- 페이징 처리 및 제목 클릭 시 상세 페이지로 이동
- 선택된 문의사항 상세 조회
- 답변 조회/등록/수정 기능
- 회원 정보와 트레이너 선택 포함
- 답변 등록시 답변대기에서 답변완료로 전환 업데이트

---

![1](https://github.com/user-attachments/assets/343eb9f9-55c1-46d6-959e-2bacd8bc4806)
![2](https://github.com/user-attachments/assets/68951f9f-ee51-444b-b1a0-ff3410ae401e)
![3](https://github.com/user-attachments/assets/c5912283-532f-4507-a682-2033a8a08b38)
![4](https://github.com/user-attachments/assets/e2ec8767-a53b-4887-9cfc-d4b63b8cd18f)
![5](https://github.com/user-attachments/assets/80007494-6c21-4c30-a0b2-be67f4570a1e)
![6](https://github.com/user-attachments/assets/76b5e74e-7364-42fa-a5b5-47863a1ad1ae)
![7](https://github.com/user-attachments/assets/288b3513-9d8d-4c14-b866-86f4cdd3ad27)
![8](https://github.com/user-attachments/assets/9264ae0e-4486-4a7d-a946-7bbfe3b12469)
![9](https://github.com/user-attachments/assets/c47f27ea-4d57-4756-93c3-0aa066d9db2e)
![10](https://github.com/user-attachments/assets/b2cb5447-57bf-4b7d-ac04-142bf36dbaf9)
![11](https://github.com/user-attachments/assets/8b907097-8fe5-4edf-a810-b94ca002d7e1)
![12](https://github.com/user-attachments/assets/52e0fc3e-b81d-4c5e-95ca-68855f2ec08a)
![13](https://github.com/user-attachments/assets/c0d6fcd3-3fe7-41b6-a2a8-ee3a3bd84570)
![14](https://github.com/user-attachments/assets/b0ca343b-2631-4e25-920f-70f1bb5671e2)
![15](https://github.com/user-attachments/assets/7c770bb7-a63f-4e1d-b18c-75c2240a4824)
![16](https://github.com/user-attachments/assets/7ed4d0eb-bb15-411d-9e3d-3bd8e9d718a3)
![17](https://github.com/user-attachments/assets/9aa2ac76-2bd4-4b1c-9f01-7fad88d035a1)
![18](https://github.com/user-attachments/assets/9afe13f9-564a-4852-b30e-9a01096a87c2)
![19](https://github.com/user-attachments/assets/9af88846-2791-408b-ba88-82e4171bb762)
![20](https://github.com/user-attachments/assets/35fb40f3-4623-41f6-99ed-637755405d26)
![21](https://github.com/user-attachments/assets/7f6802a9-4662-4b23-ac59-3da363e018f2)
![22](https://github.com/user-attachments/assets/efa2933c-7267-406f-b60b-7bb4284a81c0)
![23](https://github.com/user-attachments/assets/db172e06-592d-4375-a5de-4cf4d4d1bfc2)
![25](https://github.com/user-attachments/assets/e7da9a02-a2a6-4241-a5f3-48dba6e2aeb3)
![26](https://github.com/user-attachments/assets/e8e90a21-7111-4c4d-9d8d-fd64a56bfdf9)
![27](https://github.com/user-attachments/assets/2b96eb75-7739-4b5b-9e30-f8d8a0a64006)
![28](https://github.com/user-attachments/assets/903c0de3-ec6d-464a-a8b4-5a6345c83f43)
![29](https://github.com/user-attachments/assets/998b6f74-89c8-4e2a-8f37-f4c0c7306e44)
![30](https://github.com/user-attachments/assets/5f6212cc-487e-4283-9306-4440298b8694)

