CREATE TABLE staffs_recipients (
  care_staff_id INTEGER NOT NULL,
  care_recipient_id INTEGER NOT NULL,
  PRIMARY KEY (care_staff_id, care_recipient_id),
  FOREIGN KEY (care_staff_id) REFERENCES care_staffs (care_staff_id),
  FOREIGN KEY (care_recipient_id) REFERENCES care_recipients (id)
);
