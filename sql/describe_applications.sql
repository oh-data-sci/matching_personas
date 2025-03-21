SELECT
    COUNT(*)                         AS num_records,              --  a million applications! 1,067,480
    COUNT(DISTINCT id)               AS num_applications,         -- the two match. there is one id per row
    COUNT(DISTINCT assignment_id)    AS num_assignments,          -- 183,245
    num_assignments/num_applications AS success_rate,             -- 17%
    COUNT(DISTINCT listing_id)       AS num_listings_applied_for, -- 68,494
    COUNT(DISTINCT owner_user_id)    AS num_owners_applied_to,
    COUNT(DISTINCT profile_id)       AS num_sitter_profiles,      -- 67,286 : more than there are sitters?
    COUNT(DISTINCT sitter_user_id)   AS num_sitter_users_applying,
    MIN(created_dt)                  AS earliest_application,
    MAX(created_dt)                  AS lastest_application
FROM applications LIMIT 5
;
-- │ 1,067,480 │ 183,245 │ 68,494 │ 68,493 │ 67,286 │ 67,286 │ 2022-01-01  │ 2024-06-08 │
-- one owner has two listings. let's find out who:

WITH multiple_listings_owner AS
(
    SELECT
        owner_user_id              AS owner_user_id,
        COUNT(*)                   AS num_applications,
        COUNT(DISTINCT listing_id) AS num_listings
    FROM applications
    GROUP BY owner_user_id
    HAVING num_listings>1
)
SELECT * FROM multiple_listings_owner; -- owner user id 12133 has 2 listings with combined 39 applications

SELECT a.*, u.billing_country, u.expires_dt
FROM
    applications a
    INNER JOIN users u ON a.owner_user_id=u.id
WHERE owner_user_id=12133
;

-- applications from profiles not found in the profiles table?
SELECT
    COUNT(*) AS num_applications, -- 169,505 applications!!
    COUNT(DISTINCT profile_id)  AS num_missing_profile_ids, -- 32,371 (that's almost as many as there are profile ids in profiles)
    MIN(a.profile_id) AS example_1,
    MAX(a.profile_id) AS example_2
FROM
    applications a
    LEFT JOIN profiles p ON a.profile_id = p.id
WHERE p.id IS NULL
;

--- applications guaranteed to have a matching profile
SELECT
    COUNT(*)                   AS num_applications,         -- 897,975
    COUNT(DISTINCT profile_id) AS num_matching_profile_ids, --  34,915 profiles have applied (all but one)
    MIN(a.profile_id)          AS example_1,
    MAX(a.profile_id)          AS example_2
FROM
    applications a
    INNER JOIN profiles p ON a.profile_id = p.id
;

-- for each profile id among the profiles we have, how successful was each in terms of ratio of their applications that were successful?
SELECT
    a.profile_id,
    COUNT(*)                                                   AS num_applications,
    SUM(                                                       
        CASE a.assignment_id                                   
            WHEN NULL THEN 0                                   
            WHEN NOT NULL THEN 1                               
            ELSE 0                                             
        END                                                    
    )                                                          AS num_assignments,
    SUM(                                                       
        CASE a.acknowledged                                    
            WHEN TRUE THEN 1                                   
            ELSE 0                                             
        END                                                    
    )                                                          AS num_acknowledged,
    SUM(
        CASE 
            WHEN owner_confirmed AND sitter_confirmed THEN 1
            ELSE 0
        END
    )                                                          AS num_confirmed,
    num_confirmed::FLOAT/num_applications::FLOAT               AS application_confirm_ratio
FROM 
    applications a
    INNER JOIN profiles p ON a.profile_id = p.id
GROUP BY a.profile_id
ORDER BY num_applications DESC
LIMIT 10 -- top 10 most often applying profiles
;

-- lesson: none of the profile ids in profiles had a successful assignment??!