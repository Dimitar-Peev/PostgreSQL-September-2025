SELECT "name", "start_date"
FROM "projects"
WHERE "name" IN ('Mountain', 'Road', 'Touring')
-- WHERE "name" = 'Mountain'
--    OR "name" = 'Road'
--    OR "name" = 'Touring'
LIMIT 20;