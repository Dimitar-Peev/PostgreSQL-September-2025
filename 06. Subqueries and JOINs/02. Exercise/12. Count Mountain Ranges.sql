SELECT "country_code",
       COUNT(DISTINCT "mountain_id") AS "mountain_range_count"
FROM "mountains_countries"
WHERE "country_code" IN ('BG', 'US', 'RU')
GROUP BY "country_code"
ORDER BY "mountain_range_count" DESC;