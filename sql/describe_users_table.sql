SELECT
    billing_country AS country_slug,
    COUNT(*)        AS num_users
FROM users
GROUP BY billing_country
ORDER BY num_users DESC
;

SELECT
    COUNT(*)           AS num_records,
    COUNT(DISTINCT id) AS num_ids
FROM users
;
-- -- user ids 