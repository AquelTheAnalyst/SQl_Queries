

ALTER TABLE   [dbo].[menu]
ADD CONSTRAINT    ck_costTOmake
CHECK        (costTOmake >0)



INSERT INTO dbo.Menu (column1, column2, column3, column4, column5, column6, column7)
SELECT column1, column2, column3, column4, column5, column6, column7
FROM  dbo.AnotherTable;
VALUES ('Big Mac', 'Hamburger',1.25,3.24, 1015, 5000, 15853),
      ('Quarter Pounder / Cheese', 'Hamburger',1.15,3.24, 1000, 4589, 16095),
      ('Half Pounder / Cheese', 'Hamburger',1.35,3.50, 500, 3500, 12589),
      ('Whopper', 'Hamburger', 1.55,3.99,989,4253,13000),
      ('Kobe Cheeseburger', 'Hamburger', 2.25,5.25, 350, 1500, 5000),
      ('Grilled Stuffed Burrito', 'Burrito', .75,5.00, 2000, 7528,17896),
      ('Bean Burrito', 'Burrito', .50, 1.00, 1750, 7000, 18853),
      ('17 layer Burrito', 'Burrito',.78,2.50, 350, 1000, 2563),
      ('Dorrito Burrito', 'Burrito',.85,1.50, 600, 2052,9857),
      ('Turkey and Cheese Sub', 'Sub Sandwich',1.75,5.50,1115,7878, 16853),
      ('Philly Cheese Steak Sub', 'Sub Sandwich',2.50, 6.00,726,2785, 8000),
      ('Tuna Sub', 'Sub Sandwich',1.25,4.50,825, 3214, 13523),
      ('Meatball Sub', 'Sub Sandwich',1.95,6.50,987,4023,15287),
      ('Italian Sub', 'Sub Sandwich',2.25,7.00, 625, 1253,11111),
      ('3 Cheese Sub', 'Sub Sandwich', .25,6.00,815, 3000, 11853);
