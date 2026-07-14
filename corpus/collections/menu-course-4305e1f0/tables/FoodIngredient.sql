CREATE TABLE FoodIngredient (
  ingredientId VARCHAR(42) NOT NULL,
  ingredientName VARCHAR(32),
  category VARCHAR(32),
  allergenFlag BOOLEAN,
  originRegion VARCHAR(32),
  courseId INTEGER,
  PRIMARY KEY (ingredientId),
  FOREIGN KEY (courseId) REFERENCES MenuCourse (id)
);
