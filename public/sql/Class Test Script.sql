use ludo;
SET SQL_SAFE_UPDATES = 0;

INSERT INTO people (person_name, institution_name, username)
/*null values should be actors? as a list, messages sent and Received? instances that they participated in*/
VALUES ('Bob Brown', 'UMD', 'princesspeach12');

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

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('I', 'Bob Brown: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Bob Brown'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Red Eye: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Red Eye'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Corona Virus: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Corona Virus'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Warrior: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Warrior'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
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
VALUES('Emergency Action Needed for Leak', 'There is a leak on the North side of town that is flooding the street.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE actor_name = 'Bob Brown: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE actor_name = 'Corona Virus: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Emergency Action Needed for Leak - Response', 'Sent someone. Plumber on his way.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak - Response'),
(SELECT actor_id FROM actors WHERE actor_name = 'Bob Brown: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Emergency Action Needed for Leak - Response'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Sushi Time', 'I want fish, team. Let us get sushi.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Sushi Time'),
(SELECT actor_id FROM actors WHERE actor_name = 'Corona Virus: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Sushi Time'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Improve Firewalls', 'Help me find a guy to improve our firewalls.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Improve Firewalls'),
(SELECT actor_id FROM actors WHERE actor_name = 'Bob Brown: Database Administrator'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Improve Firewalls'),
(SELECT actor_id FROM actors WHERE actor_name = 'Corona Virus: IT Associate'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Keep the peace.', 'Calm the people', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Keep the peace.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Keep the peace.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Here, have these docs.', 'Use this data.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Here, have these docs.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Corona Virus: IT Associate'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Here, have these docs.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Document these, dude.', 'Dude! Here you go!', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Here, have these docs.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Here, have these docs.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Bob Brown: Database Administrator'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('We almost good!', 'Right to da end, babies!', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We almost good!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Corona Virus: IT Associate'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We almost good!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We almost good!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We almost good!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Bob Brown: Database Administrator'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Liberty.', 'Almost free to be me!', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Here, have these docs.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Here, have these docs.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Done! We did it!', 'Time to send this to the boss!', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Done! We did it!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Corona Virus: IT Associate'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Done! We did it!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Eye: Civic Officer'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Done! We did it!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Warrior: Emergency Response Specialist'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Done! We did it!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Bob Brown: Database Administrator'), 'Day 5');


/*Second Part of Load Script*/

INSERT INTO people (person_name, institution_name, username)
VALUES ('Adam Applin', 'UMD', 'catchemall890');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Buster Boost', 'UMD', 'pokemart21');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Cinder Crash', 'UMD', 'gymbattler32');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Draymond DK', 'UMD', 'dynamaximum');

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('I', 'Adam Applin: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Adam Applin'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Cinder Crash: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Cinder Crash'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Draymond DK: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Draymond DK'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Buster Boost: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Buster Boost'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
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
VALUES('Break Plans', 'Let\'s meet up for lunch!', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Send the plans', 'I need the emergency plans.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Send the plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Send the plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Encouragement', 'We can.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Encouragement'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Encouragement'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Break Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Four Score...', 'I hate history.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Four Score...'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Four Score...'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Gossip', 'Look at Magenta and Crimson', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Gossip'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Gossip'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Gossip 2', 'I know, right?', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Gossip 2'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Gossip 2'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('DB', 'How is it looking, Adam?', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'DB'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'DB'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('DB 2', 'Fine, Buster. More data came in.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'DB 2'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'DB 2'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Hotel Plans', 'Let\'s make some money.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Hotel Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Hotel Plans'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('We got it.', 'Let\'s make some money.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We got it.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We got it.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We got it.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We got it.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Coincidence?', 'Anyone notice that our names are all alliterative and go ABCD?', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Coincidence?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Coincidence?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Coincidence?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Coincidence?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('We noticed.', 'Yes, Buster. We noticed. Boss did it on purpose.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We noticed.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We noticed.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('We defeated this project.', 'It\'s game over. We WIN!', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We defeated this project.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Cinder Crash: Civic Officer'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We defeated this project.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Draymond DK: IT Associate'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We defeated this project.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Buster Boost: Emergency Response Specialist'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'We defeated this project.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Adam Applin: Database Administrator'), 'Day 5');


/*Third Part of Load Script*/

INSERT INTO people (person_name, institution_name, username)
VALUES ('Eve Olve', 'UMD', 'metroidfan22');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Contra Ease', 'UMD', 'zerosuit09');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Kei Kaku', 'UMD', 'ridleyistoobig');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Mordecai Simple', 'UMD', 'samuswins365');

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('I', 'Mordecai Simple: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Mordecai Simple'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Contra Ease: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Contra Ease'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Kei Kaku: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Kei Kaku'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Eve Olve: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Eve Olve'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
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

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Future Reference'),
(SELECT actor_id FROM actors WHERE actor_name = 'Eve Olve: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Future Reference'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Overheated Words', 'I need help calming a debate in the lobby.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Overheated Words'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kei Kaku: IT Associate'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Overheated Words'),
(SELECT actor_id FROM actors WHERE actor_name = 'Contra Ease: Civic Officer'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('I am bored.', 'Give me something to do.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I am bored.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kei Kaku: IT Associate'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I am bored.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Forward', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I am bored.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I am bored.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Contra Ease: Civic Officer'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Another Emergency?!', 'Emergency worst, same as the first.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Another Emergency?!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Eve Olve: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Another Emergency?!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day One Ish', 'Let us do our best!', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One Ish'),
(SELECT actor_id FROM actors WHERE actor_name = 'Contra Ease: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One Ish'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One Ish'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kei Kaku: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One Ish'),
(SELECT actor_id FROM actors WHERE actor_name = 'Eve Olve: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('All According to Cake', 'Cake Means Keikaku. Keikaku Means Plan', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'All According to Cake'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kei Kaku: IT Associate'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'All According to Cake'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'All According to Cake'),
(SELECT actor_id FROM actors WHERE actor_name = 'Contra Ease: Civic Officer'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'All According to Cake'),
(SELECT actor_id FROM actors WHERE actor_name = 'Eve Olve: Emergency Response Specialist'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('All According to Cake - Response', 'Must you? Must you really?', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'All According to Cake - Response'),
(SELECT actor_id FROM actors WHERE actor_name = 'Eve Olve: Emergency Response Specialist'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'All According to Cake - Response'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kei Kaku: IT Associate'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Money in the budget?', 'I need money to pay for new defenses.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Money in the budget?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Eve Olve: Emergency Response Specialist'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Money in the budget?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Mordecai Simple: Database Administrator'), 'Day 4');


/*Fourth Part of Load Script*/

INSERT INTO people (person_name, institution_name, username)
VALUES ('Hannibal Broly', 'UMD', 'kingofevil1');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Barney Miles', 'UMD', 'windwaker45');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Kim Hines', 'UMD', 'mastersword22');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Rena Logan', 'UMD', 'triforce100');

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('I', 'Hannibal Broly: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Hannibal Broly'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Rena Logan: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Rena Logan'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Barney Miles: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Barney Miles'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Kim Hines: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Kim Hines'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
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

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Rena Logan: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Barney Miles: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Talk to me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Hannibal Broly: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Why is no one responding?', 'Hannibal, Rena, Barney, I need to communicate with you three if we are to succeed. Reply back if you read this.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Rena Logan: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Barney Miles: Database Administrator'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Why is no one responding?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Hannibal Broly: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Stop ignoring me.', 'Why am I being ignored?', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Rena Logan: IT Associate'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Barney Miles: Database Administrator'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Stop ignoring me.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Hannibal Broly: Civic Officer'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('I told the boss.', 'Screw it, I told DA MAN and he about to fire ya\'ll', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Rena Logan: IT Associate'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Barney Miles: Database Administrator'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I told the boss.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Hannibal Broly: Civic Officer'), 'Day 3');

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

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('I', 'Ariel: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Ariel'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Kevin Thorn: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Kevin Thorn'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Gangrel: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Gangrel'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Vampiro: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Vampiro'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
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
VALUES ('Charles Wright', 'UMD', 'chaoscontroller7');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Manfred Von Karma', 'UMD', 'worldrings7');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Speed Racer', 'UMD', 'superemerald7');

INSERT INTO people (person_name, institution_name, username)
VALUES ('Harold Jordan', 'UMD', 'solemeralds7');

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('I', 'Charles Wright: Database Administrator',
(SELECT role_type_id FROM role_types WHERE role_type = 'Database Administrator'),
(SELECT person_id FROM people WHERE person_name = 'Charles Wright'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type,actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Manfred Von Karma: Civic Officer',
(SELECT role_type_id FROM role_types WHERE role_type = 'Civic Officer'),
(SELECT person_id FROM people WHERE person_name = 'Manfred Von Karma'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Speed Racer: IT Associate',
(SELECT role_type_id FROM role_types WHERE role_type = 'IT Associate'),
(SELECT person_id FROM people WHERE person_name = 'Speed Racer'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id, person_id, instance_id)
VALUES('I', 'Harold Jordan: Emergency Response Specialist',
(SELECT role_type_id FROM role_types WHERE role_type = 'Emergency Response Specialist'),
(SELECT person_id FROM people WHERE person_name = 'Harold Jordan'),
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
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

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Speed Racer: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Charles Wright: Database Administrator'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('What Now? - Response', 'Hal, you have to save the people\'s data, then tell us what happens.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now? - Response'),
(SELECT actor_id FROM actors WHERE actor_name = 'Speed Racer: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now? - Response'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Nuisance', 'You are a nuisance. Do what I say and we will achieve victory.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Nuisance'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Nuisance'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Never!', 'Green Lantern stands his ground.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Nuisance'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Nuisance'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Keep secrets', 'No one tell the boss that we have internal issues. We will look perfect.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Speed Racer: IT Associate'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Charles Wright: Database Administrator'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Fool', 'Give me your loyalty.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Fool'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Fool'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Nah.', 'Nah.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Nah.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Nah.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Failure', 'Give me your soul.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Failure'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Failure'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('You can be so stupid.', 'You have lovely charisma. \s', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'You can be so stupid.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'You can be so stupid.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Perfection', 'Give me the evidence for the guilty verdict. Also, thank you for the compliment', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfection'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfection'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Fine.', 'You do not have to be so demanding. Also, you must not know what \s means...', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Fine.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Fine.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Thank God, it\'s over.', 'That tension was unbearable. Let us submit and be done with it.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Speed Racer: IT Associate'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Manfred Von Karma: Civic Officer'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Harold Jordan: Emergency Response Specialist'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'What Now?'),
(SELECT actor_id FROM actors WHERE actor_name = 'Charles Wright: Database Administrator'), 'Day 5');


/*Seventh Part of the Load Script - The Boss Bot*/
INSERT INTO role_types (role_type, version_id)
VALUES ('Big Bad Boss', (SELECT version_id FROM game_versions WHERE version_name = 'CIP 1'));

INSERT INTO actors (actor_type, actor_name, role_type_id , person_id, instance_id)
VALUES('B', 'The Big Bad Boss',
(SELECT role_type_id FROM role_types WHERE role_type = 'Big Bad Boss'),
NULL,
(SELECT instance_id FROM game_instances WHERE section = '0101')
);

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Get to work', 'Start the projects. Send me a message every day.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'Magenta Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Get to work'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Start working together!', 'Talk to each other!', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Start working together!'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Start working together!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('YOU\'RE FIRED!', 'Only one of you is trying, so I\'ll pass her and FIRE YOU!', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'YOU\'RE FIRED!'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'YOU\'RE FIRED!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Rena Logan: IT Associate'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'YOU\'RE FIRED!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Barney Miles: Database Administrator'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'YOU\'RE FIRED!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Hannibal Broly: Civic Officer'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Submit!', 'Give me what you have done.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Magenta Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Submit!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('No teamwork. Goodbye', 'I do not see your work. Did you even do it? Crimson Team is also FIRED!!! No work no collaboration', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'No teamwork. Goodbye'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'No teamwork. Goodbye'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day One is done.', 'Day 1 is done.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day One.', 'Dia Uno.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Divide the Day One.', 'See you tomorrow.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Divide the Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Divide the Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Perfect Day One.', 'Not a second wasted.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Not So Perfect Day One.', 'Just got it!', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Not So Perfect Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Not So Perfect Day One.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');


INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Two is done.', 'Day 2 is done.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Two is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Two is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Two.', 'Dia Dos.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Two.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Two.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Twoday is here.', 'Here.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Twoday is here.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Twoday is here.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Perfect Day Two.', 'Please.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Two.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Two.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Forever alone.', 'Just got it!', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Forever alone.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Forever alone.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Forever alone - Response.', 'Are you okay?', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Forever alone - Response.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Forever alone - Response.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES(':}', 'Never better?', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = ':}'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = ':}'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');


INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Three is done.', 'Day 3 is done.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Three is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Three is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Three.', 'Dia Tres.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Three.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Three.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('R.E.S.P.E.C.THREE.', 'Halfway done.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'R.E.S.P.E.C.THREE.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'R.E.S.P.E.C.THREE.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Perfect Day Three.', 'As expected', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Three.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Three.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Help.', 'I am done for the day. But I need your help. My group is not talking or working with me or showing up. Please do something.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('On the way.', 'I will do what I can', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'On the way.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'On the way.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Help Kim', 'Only one of you is working. Help her now.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help Kim'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help Kim'),
(SELECT actor_id FROM actors WHERE actor_name = 'Rena Logan: IT Associate'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help Kim'),
(SELECT actor_id FROM actors WHERE actor_name = 'Barney Miles: Database Administrator'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help Kim'),
(SELECT actor_id FROM actors WHERE actor_name = 'Hannibal Broly: Civic Officer'), 'Day 3');


INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Four is done.', 'Day 4 is done.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Four is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Four is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Four.', 'Dia Cuatro.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Four.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Four.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Press F to Signal Day Four\'s End', 'Almost done.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Press F to Signal Day Four\'s End'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Press F to Signal Day Four\'s End'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Perfect Day Four.', 'We are great.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Four.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Four.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('No response from them.', 'I am overworking myself, boss. But today is done.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'No response from them.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'No response from them.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Last one more day', 'Just finish, Kim. I will give you their salaries if they do not help tomorrow.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Last one more day'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Last one more day'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Warning', 'I got nothing from you, today. Why?', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Warning'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Warning'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 1');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Second warning', 'Still nothing. Do not ignore me.', 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Second warning'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Second warning'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 2');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('No hope for you.', 'You cannot pass at this point. This shall be my last message to you. Well, besides your pink slip.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'No hope for you.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'No hope for you.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 4');



INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Five is done.', 'Day 5 is done.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Five is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Five is done.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Day Five.', 'Dia Cinco.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Five.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Day Five.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Return of the Five', 'It is done', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Return of the Five'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Return of the Five'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Perfect Day Five.', 'Perfectly finished, as is all things we do.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Five.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Perfect Day Five.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('I\'m done...', 'I finished finally. Can I go home and sleep?', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I\'m done...'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'I\'m done...'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Take five, soldier.', 'You will have their money, their jobs, and their praise.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Take five, soldier.'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Take five, soldier.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 5');

/*Eighth Part of the Load Script - Team to Team Messages*/

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Data Transfer', 'Send us the data, please.', 'Day 1');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Data Transfer'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Data Transfer'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 2');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Data Transfer'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 2');


INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Communicate', 'You all should really speak to each other.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Communicate'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Communicate'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Help each other!', 'You have to work together.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help each other!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Magenta Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Help each other!'),
(SELECT actor_id FROM actors WHERE actor_name = 'Crimson Team'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Your account', 'Kim, just use your individual account. We know your team is not helping you.', 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Your account'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 3');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Your account'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 3');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Deadline incoming', 'Send us the papers. We got the rest.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Deadline incoming'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Deadline incoming'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Take these.', 'Here. It was nice working with you.', 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Take these.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 4');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Take these.'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 4');

INSERT INTO messages (message_subject, message_text, game_position)
VALUES('Until We Meet Again', 'Here. It was nice working with you.', 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Sent', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Until We Meet Again'),
(SELECT actor_id FROM actors WHERE actor_name = 'Kim Hines: Emergency Response Specialist'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Until We Meet Again'),
(SELECT actor_id FROM actors WHERE actor_name = 'Blue Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Until We Meet Again'),
(SELECT actor_id FROM actors WHERE actor_name = 'Green Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Until We Meet Again'),
(SELECT actor_id FROM actors WHERE actor_name = 'Red Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Until We Meet Again'),
(SELECT actor_id FROM actors WHERE actor_name = 'Purple Team'), 'Day 5');

INSERT INTO message_actions (action_type, action_time, message_id, actor_id, game_position)
VALUES('Received', unix_timestamp(),
(SELECT message_id FROM messages WHERE message_subject = 'Until We Meet Again'),
(SELECT actor_id FROM actors WHERE actor_name = 'The Big Bad Boss'), 'Day 5');