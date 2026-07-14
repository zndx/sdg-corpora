CREATE TABLE courses_topics (
  course_id INTEGER NOT NULL,
  bioethical_topic_id INTEGER NOT NULL,
  PRIMARY KEY (course_id, bioethical_topic_id),
  FOREIGN KEY (course_id) REFERENCES courses (id),
  FOREIGN KEY (bioethical_topic_id) REFERENCES bioethical_topics (bioethical_topic_id)
);
