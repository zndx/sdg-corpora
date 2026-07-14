CREATE TABLE childs (
  id INTEGER NOT NULL,
  child_name VARCHAR(32),
  age INTEGER,
  sex VARCHAR(32),
  shirt_size VARCHAR(32),
  pants_size VARCHAR(32),
  shoe_size VARCHAR(32),
  diaper_size VARCHAR(32),
  favorite_color VARCHAR(32),
  aid_recipient_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (aid_recipient_id) REFERENCES aid_recipients (id)
);
