CREATE TABLE trainer_schedule (
  id INT AUTO_INCREMENT PRIMARY KEY,
  schedule_date DATE NOT NULL,
  trainer_name VARCHAR(50) NOT NULL,
  time_range VARCHAR(20) NOT NULL,
  memo TEXT,
  is_checked BOOLEAN DEFAULT FALSE,
  UNIQUE KEY uniq_schedule (schedule_date, trainer_name, time_range)
);

