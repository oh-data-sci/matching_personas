SELECT
    COUNT(*) AS num_records,
    COUNT(DISTINCT id)       -- 34,916, matches. no redundancies
FROM profiles
;



-- check top users: -- number of applications not in agreement with applications dataset.
SELECT
    p.id,
    p.nb_applications,
    p.nb_sits_completed,
    p.nb_domestic_sits,
    p.nb_local_sits,
    p.nb_sits_booked,
    p.nb_of_sitter_pets
FROM profiles p
WHERE p.id IN (
    1919700, 
    1879767, 
    1079325, 
    718885, 
    2168845, 
    448475, 
    1980180, 
    2279661, 
    104773, 
    1124628
)
ORDER BY nb_applications DESC
;