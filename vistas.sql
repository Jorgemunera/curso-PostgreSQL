SELECT * FROM rango_view;

--Vista materializada

SELECT *
FROM viaje
WHERE  inicio > '2021-11-01 7:00:00';

SELECT * FROM despues_2021_11_01_at7_mview;
REFRESH MATERIALIZED VIEW despues_2021_11_01_at7_mview;

DELETE FROM viaje WHERE id=9;
SELECT * FROM viaje WHERE inicio > '2021-11-01 7:00:00';