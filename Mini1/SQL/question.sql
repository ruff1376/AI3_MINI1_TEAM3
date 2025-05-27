-- QnA 테이블 생성
CREATE TABLE qna (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    writer VARCHAR(50),
    date VARCHAR(20),
    answer TEXT
);

-- 샘플 데이터 입력
INSERT INTO qna (title, writer, date, answer) VALUES
('첫번째 문의입니다', '홍길동', '2024-05-28', ''),
('두번째 문의입니다', '김철수', '2024-05-28', ''),
('세번째 문의입니다', '이영희', '2024-05-28', '답변이 등록되었습니다.');
