USE gdelt;
WITH tmp as (SELECT eventsparquetlocal.eventcode,
         COUNT(eventsparquetlocal.globaleventid) AS nb_events
    FROM eventsparquetlocal
    WHERE ((actor1name LIKE '%OBAMA' and actor2name LIKE '%PUTIN')
            OR (actor2name LIKE '%OBAMA' and actor1name LIKE '%PUTIN'))
    GROUP BY  eventsparquetlocal.eventcode
    ORDER BY  nb_events DESC)
SELECT eventcode,
         eventcodes.description,
         nb_events
FROM tmp
JOIN eventcodes
    ON eventcode = eventcodes.code
ORDER BY  nb_events DESC;
