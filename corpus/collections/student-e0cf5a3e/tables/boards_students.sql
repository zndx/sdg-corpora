CREATE TABLE boards_students (
  campus_hearing_board_id INTEGER NOT NULL,
  student_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (campus_hearing_board_id, student_id),
  FOREIGN KEY (campus_hearing_board_id) REFERENCES campus_hearing_boards (campus_hearing_board_id),
  FOREIGN KEY (student_id) REFERENCES students (student_id)
);
