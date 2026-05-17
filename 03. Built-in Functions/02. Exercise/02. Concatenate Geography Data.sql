DROP VIEW IF EXISTS view_continents_countries_currencies_details;

CREATE VIEW view_continents_countries_currencies_details AS
SELECT CONCAT(TRIM(c."continent_name"), ': ', c."continent_code")                   AS "continent_details",
       CONCAT_WS(' - ', ct."country_name", ct."capital", ct."area_in_sq_km", 'km2') AS "country_information",
       CONCAT(cn."description", ' (', cn."currency_code", ')')                      AS "currencies"
FROM continents AS c
         JOIN countries AS ct
              ON c."continent_code" = ct."continent_code"
         JOIN currencies AS cn
              ON ct."currency_code" = cn."currency_code"
ORDER BY country_information, currencies;

SELECT *
FROM view_continents_countries_currencies_details;