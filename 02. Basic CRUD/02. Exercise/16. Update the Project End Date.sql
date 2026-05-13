UPDATE "projects"
-- SET "end_date" = "start_date" + INTERVAL '5 months'
SET "end_date" = "start_date" + '5 months'::interval
WHERE "end_date" IS NULL;
-- RETURNING *; -- Shows the table afterwards