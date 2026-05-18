SELECT "capital",
       TRANSLATE("capital", 'áãåçéíñóú', 'aaaceinou') AS "translated_name"
FROM "countries";