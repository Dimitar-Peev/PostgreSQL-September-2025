SELECT "name", "start_date"
FROM "projects"
WHERE "name" LIKE 'MOUNT%' -- the text must begin with MOUNT
-- WHERE "name" ILIKE 'MOUNT%' -- the text must begin with MOUNT case-insensitive
ORDER BY "id" ASC;