CREATE TABLE student_profiles (
  student_profile_id INTEGER NOT NULL,
  student_id VARCHAR(32),
  admission_status VARCHAR(32),
  high_school_g_p_a DECIMAL,
  class_rank INTEGER,
  has_g_e_d BOOLEAN,
  enrollment_date DATE,
  institution_code VARCHAR(32),
  is_developmental_required BOOLEAN,
  created_at TIMESTAMP,
  PRIMARY KEY (student_profile_id)
);
