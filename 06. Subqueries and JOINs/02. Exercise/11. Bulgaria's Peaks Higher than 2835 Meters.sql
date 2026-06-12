SELECT mc."country_code",
       m."mountain_range",
       p."peak_name",
       p."elevation"
FROM "mountains" AS m
         INNER JOIN "peaks" AS p
                    ON m."id" = p."mountain_id"
         INNER JOIN "mountains_countries" AS mc
                    ON mc."mountain_id" = m."id"
WHERE mc."country_code" = 'BG'
  AND p."elevation" > 2835
ORDER BY p."elevation" DESC;