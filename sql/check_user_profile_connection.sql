-- verify uniqueness
SELECT
    u.id,
    COUNT(*) AS num_profiles 
FROM
    users u
    INNER JOIN profiles p ON u.id=p.user_id
GROUP BY u.id
HAVING num_profiles>1
ORDER BY num_profiles DESC
LIMIT 10
;

