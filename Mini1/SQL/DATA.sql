-- 외래키 제약조건 비활성화
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE program_record;
TRUNCATE TABLE inbody;
TRUNCATE TABLE gym_machine;
TRUNCATE TABLE pt_reservation;
TRUNCATE TABLE comment;
TRUNCATE TABLE sales;
TRUNCATE TABLE pt_schedule;
TRUNCATE TABLE macro_comment;
TRUNCATE TABLE macro_record;
TRUNCATE TABLE question;
TRUNCATE TABLE pt_history;
TRUNCATE TABLE trainer;
TRUNCATE TABLE member;

-- 외래키 제약조건 활성화
SET FOREIGN_KEY_CHECKS = 1;

-- member
INSERT INTO member (name, member_id, password, phone, join_date, expire_date, admin) VALUES
('홍길동', 'hong123', 'pass1', '010-1111-1111', '2024-01-01', '2024-12-31', 0),
('김철수', 'kimcs', 'pass2', '010-2222-2222', '2024-02-01', '2024-12-31', 0),
('이영희', 'leeyh', 'pass3', '010-3333-3333', '2024-03-01', '2024-12-31', 1);

-- trainer
INSERT INTO trainer (name, phone, admin) VALUES
('김트레이너', '010-1111-1111', 0),
('박트레이너', '010-2222-2222', 0),
('이트레이너', '010-3333-3333', 0),
('최트레이너', '010-4444-4444', 0),
('정트레이너', '010-5555-5555', 0),
('한트레이너', '010-6666-6666', 0);


-- pt_history
INSERT INTO pt_history (member_no, total_count, used_count, remain_count) VALUES
(1, 20, 5, 15),
(2, 10, 2, 8);

-- question
INSERT INTO question (member_no, title, question, question_date, status) VALUES
(1, '운동 문의', '운동 루틴 추천 부탁드립니다.', '2024-06-01', 0),
(2, '식단 문의', '다이어트 식단 알려주세요.', '2024-06-02', 1);

-- macro_record
INSERT INTO macro_record (member_no, title, record_date, content, comment) VALUES
(1, '아침 식단', '2024-06-01', '닭가슴살, 고구마', NULL),
(2, '점심 식단', '2024-06-01', '현미밥, 계란', '좋아요');

-- macro_comment
INSERT INTO macro_comment (trainer_id, comment, comment_date) VALUES
(1, '식단 잘 짜셨네요.', '2024-06-01'),
(2, '단백질을 더 추가하세요.', '2024-06-02');

-- pt_schedule
INSERT INTO pt_schedule (trainer_id, member_no, book_date, book_time, note) VALUES
(1, 1, '2024-06-05', '10:00:00', '상체 운동'),
(2, 2, '2024-06-06', '14:00:00', '하체 운동');

-- sales
INSERT INTO sales (trainer_id, date, amount, note) VALUES
-- 트레이너 1
(1, '2025-05-01', 300, 'PT 수업'),
(1, '2025-05-03', 500, '식단 상담'),
(1, '2025-05-05', 700, 'PT 수업'),
(1, '2025-05-07', 200, '보충제 판매'),
(1, '2025-05-10', 450, 'PT 수업'),
(1, '2025-05-12', 600, '운동 기구 구매'),
(1, '2025-05-14', 350, '식단 상담'),
(1, '2025-05-17', 800, 'PT 수업'),
(1, '2025-05-20', 250, 'PT 수업'),
(1, '2025-05-25', 400, '식단 상담'),
(2, '2025-05-01', 1000, 'PT 수업'),
(2, '2025-05-04', 300, '보충제'),
(2, '2025-05-06', 700, '식단'),
(2, '2025-05-08', 600, 'PT 수업'),
(2, '2025-05-11', 500, '운동복 판매'),
(2, '2025-05-15', 400, '식단'),
(2, '2025-05-18', 700, 'PT 수업'),
(2, '2025-05-21', 300, 'PT 수업'),
(2, '2025-05-24', 200, '상담'),
(2, '2025-05-28', 900, 'PT 수업'),
(3, '2025-05-01', 500, '운동 상담'),
(3, '2025-05-03', 300, 'PT 수업'),
(3, '2025-05-06', 400, 'PT 수업'),
(3, '2025-05-09', 600, 'PT 수업'),
(3, '2025-05-13', 700, '식단 코칭'),
(3, '2025-05-16', 800, '보충제 판매'),
(3, '2025-05-19', 550, 'PT 수업'),
(3, '2025-05-22', 450, '상담'),
(3, '2025-05-26', 600, 'PT 수업'),
(3, '2025-05-30', 750, '식단'),
(4, '2025-05-02', 200, '식단'),
(4, '2025-05-05', 500, 'PT 수업'),
(4, '2025-05-07', 300, '상담'),
(4, '2025-05-10', 600, '운동'),
(4, '2025-05-13', 400, 'PT 수업'),
(4, '2025-05-16', 700, '보충제'),
(4, '2025-05-19', 800, 'PT 수업'),
(4, '2025-05-22', 650, 'PT 수업'),
(4, '2025-05-25', 350, '식단'),
(4, '2025-05-29', 500, 'PT 수업'),
(5, '2025-05-01', 900, '식단'),
(5, '2025-05-04', 400, '보충제'),
(5, '2025-05-07', 600, 'PT 수업'),
(5, '2025-05-09', 700, '식단 상담'),
(5, '2025-05-12', 800, 'PT 수업'),
(5, '2025-05-15', 300, 'PT 수업'),
(5, '2025-05-18', 650, '운동'),
(5, '2025-05-21', 550, 'PT 수업'),
(5, '2025-05-24', 400, '보충제'),
(5, '2025-05-27', 350, 'PT 수업'),
(6, '2025-05-02', 500, 'PT 수업'),
(6, '2025-05-05', 300, '식단'),
(6, '2025-05-08', 600, 'PT 수업'),
(6, '2025-05-11', 700, '보충제'),
(6, '2025-05-14', 800, 'PT 수업'),
(6, '2025-05-17', 200, '상담'),
(6, '2025-05-20', 400, 'PT 수업'),
(6, '2025-05-23', 450, 'PT 수업'),
(6, '2025-05-26', 300, '식단'),
(6, '2025-05-29', 500, 'PT 수업');


-- comment
INSERT INTO comment (trainer_id, comment, comment_date) VALUES
(1, '답변드립니다.', '2024-06-01'),
(2, '문의 감사합니다.', '2024-06-02');

-- pt_reservation
INSERT INTO pt_reservation (member_no, trainer_id, book_date, book_time) VALUES
(1, 1, '2024-06-10', '09:00:00'),
(2, 2, '2024-06-11', '15:00:00');

-- gym_machine
INSERT INTO gym_machine (name, brand, category, status) VALUES
('벤치프레스', 'Hammer Strength', '웨이트', '정상'),
('런닝머신', 'Life Fitness', '유산소', '정상');

-- inbody
INSERT INTO inbody (member_no, record_date, weight, muscle_mass, fat_percent, note) VALUES
(1, '2024-06-01', 70.5, 30.2, 18.5, '정상'),
(2, '2024-06-01', 65.0, 28.0, 20.0, '체지방 감소 필요');

-- program_record
INSERT INTO program_record (member_no, gym_machine_id, history_id, name, weight, reps, volume) VALUES
(1, 1, 1, '벤치프레스', 60, 10, 600),
(2, 2, 2, '런닝머신', 0, 30, 0);