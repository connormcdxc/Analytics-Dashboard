USE ludo;
DROP VIEW message_action_detail;
CREATE VIEW message_action_detail AS
SELECT message_actions.actor_id, type, gameday, comment, actors.role_type_id, actors.person_id, role_type, people.username
FROM message_actions, actors, role_types, people
WHERE message_actions.actor_id = actors.actor_id
AND actors.role_type_id = role_types.role_type_id
AND people.person_id = actors.person_id;

SELECT * FROM message_action_detail;

CREATE VIEW future_graph AS
SELECT actors.person_id, people.person_name, actors.role_type_id, role_type, gameday, type, action_time
FROM actors, people, role_types, message_actions
WHERE actors.person_id = people.person_id
AND actors.role_type_id = role_types.role_type_id
AND message_actions.actor_id = actors.actor_id;

SELECT * FROM future_graph;

CREATE VIEW message_gameday_summary AS
SELECT actor_id, comment, count(*) message_actions, gameday
FROM message_action_detail
GROUP BY message_action_detail.actor_id, gameday
ORDER BY gameday, actor_id;

SELECT * FROM message_gameday_summary;