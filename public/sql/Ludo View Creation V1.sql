USE ludo;
DROP VIEW message_action_detail;
CREATE VIEW message_action_detail AS
SELECT message_actions.actor_id, action_type, game_position, actor_name, actors.role_action_type_id, actors.person_id, role_action_type, people.username
FROM message_actions, actors, role_action_types, people
WHERE message_actions.actor_id = actors.actor_id
AND actors.role_action_type_id = role_action_types.role_action_type_id
AND people.person_id = actors.person_id;

SELECT * FROM message_action_detail;

CREATE VIEW future_graph AS
SELECT actors.person_id, people.person_name, actors.role_action_type_id, role_action_type, game_position, action_type, action_time
FROM actors, people, role_action_types, message_actions
WHERE actors.person_id = people.person_id
AND actors.role_action_type_id = role_action_types.role_action_type_id
AND message_actions.actor_id = actors.actor_id;

SELECT * FROM future_graph;

CREATE VIEW message_gameday_summary AS
SELECT actor_id, actor_name, count(*) message_actions, game_position
FROM message_action_detail
GROUP BY message_action_detail.actor_id, game_position
ORDER BY game_position, actor_id;

SELECT * FROM message_gameday_summary;