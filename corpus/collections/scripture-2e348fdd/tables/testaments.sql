CREATE TABLE testaments (
  testament_id INTEGER NOT NULL,
  name VARCHAR(32),
  is_pre_christian BOOLEAN,
  is_post_resurrection BOOLEAN,
  contains_gospels BOOLEAN,
  contains_law BOOLEAN,
  contains_prophecy BOOLEAN,
  PRIMARY KEY (testament_id)
);
