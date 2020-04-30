use ludo;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM message_actions;

INSERT INTO people (person_name, institution_name, username)
/*null values should be actors? as a list, messages sent and Forward? instances that they participated in*/
VALUES ('Bob Brown', 'UMD', 'princesspeach12');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Lonzo Lewinsky', 'UMD', 'llewinsky');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Lonzo Lewinsky: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Lonzo Lewinsky'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO people (person_name, institution_name, username)
VALUES ('Mark Sanchez', 'UMD', 'madscientist2');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Mark Sanchez: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Mark Sanchez'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO people (person_name, institution_name, username)
VALUES ('Tom Bernard', 'UMD', 'tbern0');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Tom Bernard: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Tom Bernard'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);


INSERT INTO people (person_name, institution_name, username)
VALUES ('Chad Hensley', 'UMD', 'hensley92');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Dave Cobb', 'UMD', 'dc_propietor');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Dave Cobb: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Dave Cobb'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO people (person_name, institution_name, username)
VALUES ('Notta Copa', 'UMD', 'copper5_0');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Allie Laud', 'UMD', 'allauded95');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Bernie Standers', 'UMD', 'bernie20');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Jarvis Landry', 'UMD', 'nodropseva');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Sport Dudely', 'UMD', 'allpro88');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Betsy Ross', 'UMD', 'patriot1776');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Alpha Bet', 'UMD', 'asdfjkl44');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Francine Devita', 'UMD', 'fritos66');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Nicholas Ziegler', 'UMD', 'nopiezzz');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Jamarcus Meadows', 'UMD', 'jm334455');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Ursula Brooks', 'UMD', 'ubrook71');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Chris Terry', 'UMD', 'cterry44');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Hillary Osborne', 'UMD', 'hosborne48');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Nate Nathans', 'UMD', 'natenate76');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Howie Liong', 'UMD', 'hlong99');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Megan Sanders', 'UMD', 'megas55');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Seamus Sullivan', 'UMD', 'sully22');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Victor Vitale', 'UMD', 'vvttyl');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Betty Anderson', 'UMD', 'banderson2');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Yazmin Lawrence', 'UMD', 'yla345');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Red Haurbach', 'UMD', 'rhaurxx');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Nadia Opal', 'UMD', 'nadia99');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Veronica Mars', 'UMD', 'vmartian');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Ted Reinholdt', 'UMD', 'tre89');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Teddy Bridgewater', 'UMD', 'tb12');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Jacob Crider', 'UMD', 'jc45');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Henry Hunter', 'UMD', 'hhunter33');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Jade Fleming', 'UMD', 'jfleming1');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Lonzo Lewinsky', 'UMD', 'llewinsky');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Reggie Jackson', 'UMD', 'kewlkat33');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Red Eye', 'UMD', 'luigiman45');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Corona Virus', 'UMD', 'wariorules');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Warrior', 'UMD', 'mariomain1');

INSERT INTO game_versions (version_name)
VALUES ('CIP 1');

INSERT INTO game_instances (term_name, section, course_code, institution_name, version_id)
VALUES ('Spring 2020', '0101', 'INST201', 'UMD', (SELECT version_id FROM game_versions WHERE version_name = 'CIP 1'));

INSERT INTO role_types (role_type, version_id)
VALUES ('Database Administrator', (SELECT version_id FROM game_versions WHERE version_name = 'CIP 1'));

INSERT INTO role_types (role_type, version_id)
VALUES ('Civic Officer', (SELECT version_id FROM game_versions WHERE version_name = 'CIP 1'));

INSERT INTO role_types (role_type, version_id)
VALUES ('IT Associate', (SELECT version_id FROM game_versions WHERE version_name = 'CIP 1'));

INSERT INTO role_types (role_type, version_id)
VALUES ('Emergency Response Specialist', (SELECT version_id FROM game_versions WHERE version_name = 'CIP 1'));

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Bob Brown: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Bob Brown'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,comment, role_type_id, person_id, instance_id)
VALUES('I', 'Red Eye: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Red Eye'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Corona Virus: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Corona Virus'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Warrior: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Warrior'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Blue Team', NULL, NULL, 
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 1), 5);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 2), 5);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 3), 5);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 4), 5);

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Emergency Action Needed for Leak', 'There is a leak on the North side of town that is flooding the street.', 1);

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE comment = 'Red Eye: Civic Officer'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE comment = 'Bob Brown: Database Administrator'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE comment = 'Corona Virus: IT Associate'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE comment = 'Warrior: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Emergency Action Needed for Leak - Response', 'Sent someone. Plumber on his way.', 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak - Response'),
(SELECT actor_id FROM actors WHERE comment = 'Bob Brown: Database Administrator'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak - Response'),
(SELECT actor_id FROM actors WHERE comment = 'Red Eye: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Sushi Time', 'I want fish, team. Let us get sushi.', 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Sushi Time'),
(SELECT actor_id FROM actors WHERE comment = 'Corona Virus: IT Associate'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Sushi Time'),
(SELECT actor_id FROM actors WHERE comment = 'Warrior: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Improve Firewalls', 'Help me find a guy to improve our firewalls.', 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Improve Firewalls'),
(SELECT actor_id FROM actors WHERE comment = 'Bob Brown: Database Administrator'), 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Improve Firewalls'),
(SELECT actor_id FROM actors WHERE comment = 'Corona Virus: IT Associate'), 'Day 2');

/*Second Part of Load Script*/

INSERT INTO people (person_name, institution_name, username)
VALUES ('Adam Applin', 'UMD', 'catchemall890');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Buster Boost', 'UMD', 'gottagofast');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Cinder Crash', 'UMD', 'spinner32');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Draymond DK', 'UMD', 'barrelcountry');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Adam Applin: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Adam Applin'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,comment, role_type_id, person_id, instance_id)
VALUES('I', 'Cinder Crash: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Cinder Crash'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Draymond DK: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Draymond DK'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Buster Boost: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Buster Boost'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Red Team', NULL, NULL, 
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 6), 10);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 7), 10);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 8), 10);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 9), 10);

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Break Plans', 'Let\'s meet up for lunch!', 'Day 1: Early Morning');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE comment = 'Adam Applin: Database Administrator'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE comment = 'Buster Boost: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE comment = 'Cinder Crash: Civic Officer'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE comment = 'Draymond DK: IT Associate'), 'Day 1');


/*Third Part of Load Script*/


INSERT INTO people (person_name, institution_name, username)
VALUES ('Eve Olve', 'UMD', 'nolaughing31');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Contra Ease', 'UMD', 'paradox3');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Kei Kaku', 'UMD', 'doctorright');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Mordecai Simple', 'UMD', 'sheworth100');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Mordecai Simple: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Mordecai Simple'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,comment, role_type_id, person_id, instance_id)
VALUES('I', 'Contra Ease: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Contra Ease'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Kei Kaku: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Kei Kaku'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Eve Olve: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Eve Olve'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Green Team', NULL, NULL, 
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 11), 15);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 12), 15);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 13), 15);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 14), 15);

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Future Reference', 'Please document the emergency I fixed for future reference.', 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Future Reference'),
(SELECT actor_id FROM actors WHERE comment = 'Eve Olve: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Future Reference'),
(SELECT actor_id FROM actors WHERE comment = 'Mordecai Simple: Database Administrator'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Overheated Words', 'I need help calming a debate in the lobby.', 'Day 4');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Overheated Words'),
(SELECT actor_id FROM actors WHERE comment = 'Kei Kaku: IT Associate'), 'Day 4');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Overheated Words'),
(SELECT actor_id FROM actors WHERE comment = 'Contra Ease: Civic Officer'), 'Day 4');



/*Fourth Part of Load Script*/

INSERT INTO people (person_name, institution_name, username)
VALUES ('Hannibal Broly', 'UMD', 'blandsaiyan3');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Barney Miles', 'UMD', 'stonerun50');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Kim Hines', 'UMD', 'fiftycent22');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Rena Logan', 'UMD', 'sheworth100');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Hannibal Broly: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Hannibal Broly'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,comment, role_type_id, person_id, instance_id)
VALUES('I', 'Rena Logan: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Rena Logan'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Barney Miles: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Barney Miles'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Kim Hines: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Kim Hines'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Magenta Team', NULL, NULL, 
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 16), 20);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 17), 20);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 18), 20);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 19), 20);

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Talk to me.', 'Please respond to my emails. We need to talk about future plans.', 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE comment = 'Kim Hines: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE comment = 'Rena Logan: IT Associate'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE comment = 'Barney Miles: Database Administrator'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE comment = 'Hannibal Broly: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Why is no one responding?', 'Hannibal, Rena, Barney, I need to communicate with you three if we are to succeed. Reply back if you read this.', 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE comment = 'Kim Hines: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE comment = 'Rena Logan: IT Associate'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE comment = 'Barney Miles: Database Administrator'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE comment = 'Hannibal Broly: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Stop ignoring me.', 'Why am I being ignored?', 'Day 2: Noon');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE comment = 'Kim Hines: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE comment = 'Rena Logan: IT Associate'), 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE comment = 'Barney Miles: Database Administrator'), 'Day 2');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE comment = 'Hannibal Broly: Civic Officer'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('I told the boss.', 'Screw it, I told DA MAN and he about to fire ya\'ll', 'Day 3');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE comment = 'Kim Hines: Emergency Response Specialist'), 'Day 3');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE comment = 'Rena Logan: IT Associate'), 'Day 3');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE comment = 'Barney Miles: Database Administrator'), 'Day 3');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE comment = 'Hannibal Broly: Civic Officer'), 'Day 3');

/*Fifth Part of Load Script*/

/*This team doesn't talk at all*/
INSERT INTO people (person_name, institution_name, username)
VALUES ('Gangrel', 'UMD', 'blooddrinker4');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Kevin Thorn', 'UMD', 'edwardecai');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Vampiro', 'UMD', 'creepydeepy');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Ariel', 'UMD', 'notbellaswan010');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Ariel: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Ariel'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,comment, role_type_id, person_id, instance_id)
VALUES('I', 'Kevin Thorn: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Kevin Thorn'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Gangrel: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Gangrel'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Vampiro: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Vampiro'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Crimson Team', NULL, NULL, 
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 21), 25);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 22), 25);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 23), 25);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 24), 25);

/*Sixth Part of Load Script*/

INSERT INTO people (person_name, institution_name, username)
VALUES ('Charles Wright', 'UMD', 'godfathershango');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Manfred Von Karma', 'UMD', 'perfectprosecutor');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Speed Racer', 'UMD', 'oah31');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Harold Jordan', 'UMD', 'blingbling2814');

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('I', 'Charles Wright: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Charles Wright'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,comment, role_type_id, person_id, instance_id)
VALUES('I', 'Manfred Von Karma: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Manfred Von Karma'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Speed Racer: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Speed Racer'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id, person_id, instance_id)
VALUES('I', 'Harold Jordan: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Harold Jordan'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, comment, role_type_id , person_id, instance_id)
VALUES('T', 'Purple Team', NULL, NULL, 
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 26), 30);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 27), 30);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 28), 30);

INSERT into groupings (actor_id, team_id)
VALUES ((SELECT actor_id FROM actors WHERE actor_id = 29), 30);

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('What Now?', 'Does anyone know what we are supposed to do?', 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE comment = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE comment = 'Speed Racer: IT Associate'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE comment = 'Manfred Von Karma: Civic Officer'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE comment = 'Charles Wright: Database Administrator'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('What Now? - Response', 'Hal, you have to save the people\'s data, then tell us what happens.', 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now? - Response'),
(SELECT actor_id FROM actors WHERE comment = 'Speed Racer: IT Associate'), 'Day 1');

INSERT INTO message_actions (type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now? - Response'),
(SELECT actor_id FROM actors WHERE comment = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');





