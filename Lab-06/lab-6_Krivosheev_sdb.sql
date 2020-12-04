DROP TABLE IF EXISTS employee;
CREATE TABLE employee (id INT, name TEXT);

INSERT INTO employee VALUES (1, 'Alexey Krivosheev');
INSERT INTO employee VALUES (2, 'Dezmund');
INSERT INTO employee VALUES (3, 'Erdis');
INSERT INTO employee VALUES (4, 'Torvald');
INSERT INTO employee VALUES (5, 'Deimos');


DROP TABLE IF EXISTS mapping;
CREATE TABLE mapping (idSlave INT, idLanguage INT);

INSERT INTO mapping VALUES (1, 1);
INSERT INTO mapping VALUES (1, 2);
INSERT INTO mapping VALUES (1, 3);
INSERT INTO mapping VALUES (1, 4);

INSERT INTO mapping VALUES (2, 2);
INSERT INTO mapping VALUES (2, 3);

INSERT INTO mapping VALUES (3, 1);
INSERT INTO mapping VALUES (3, 4);
INSERT INTO mapping VALUES (3, 5);

INSERT INTO mapping VALUES (4, 5);
INSERT INTO mapping VALUES (4, 6);

INSERT INTO mapping VALUES (1, 1);
INSERT INTO mapping VALUES (1, 2);
INSERT INTO mapping VALUES (1, 3);
INSERT INTO mapping VALUES (1, 4);
INSERT INTO mapping VALUES (1, 5);


DROP TABLE IF EXISTS language;
CREATE TABLE language (id INT, nameLanguage TEXT);

INSERT INTO language VALUES (1, 'c#');
INSERT INTO language VALUES (2, 'pascal');
INSERT INTO language VALUES (3, 'javascript');
INSERT INTO language VALUES (4, 'lua');
INSERT INTO language VALUES (5, 'html');
INSERT INTO language VALUES (6, '1c');



