SELECT "number", "street"
FROM "addresses"
-- WHERE "id" BETWEEN 50 AND 100
--    OR "number" < 1000;
WHERE ("id" >= 50 and "id" <= 100)
   OR "number" < 1000;