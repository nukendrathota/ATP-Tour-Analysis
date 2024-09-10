-- 1. Top 10 Players with Most Wins at the Grand Slams!
SELECT 
	winner_name as player,
	SUM(CASE WHEN tourney_name = 'Australian Open' THEN 1 ELSE 0 END) AS Australian_Open,
	SUM(CASE WHEN tourney_name = 'Roland Garros' THEN 1 ELSE 0 END) AS Roland_Garros,
	SUM(CASE WHEN tourney_name = 'Wimbledon' THEN 1 ELSE 0 END) AS Wimbledon,
	SUM(CASE WHEN tourney_name = 'US Open' THEN 1 ELSE 0 END) AS US_Open,
	COUNT(*) AS total_wins
FROM atp_tour
WHERE 
	score NOT LIKE '%W/O%' AND 
	tourney_level = 'G'
GROUP BY winner_name
ORDER by total_wins DESC
LIMIT 10;

-- 2. US Open Champions in the Past 10 Years
SELECT 
	EXTRACT(YEAR FROM tourney_date) AS year,
	winner_name AS champion
FROM atp_tour
WHERE tourney_name = 'US Open' AND round = 'F'
ORDER by year DESC
LIMIT 10;

-- 3. US Players Who Have reached SF or better at the US Open over the past 25 years!
SELECT
    ROW_NUMBER() OVER() AS Sr_No,
	EXTRACT(YEAR FROM tourney_date) AS year,
    CASE 
        WHEN winner_ioc = 'USA' THEN winner_name
        ELSE loser_name
    END AS american_player,	
    MIN(round) AS highest_round
FROM atp_tour
WHERE 
    tourney_name = 'US Open' 
    AND round IN ('F', 'SF') 
    AND (winner_ioc = 'USA' OR loser_ioc = 'USA')
	AND EXTRACT(YEAR FROM tourney_date) >= 1999
GROUP BY year, american_player
ORDER BY year DESC;

-- 4. Year Wise Grand Slam Champions List
SELECT EXTRACT(YEAR FROM tourney_date) AS year,
	COALESCE(MAX(CASE WHEN tourney_name = 'Australian Open' THEN winner_name END), 'NA') AS Australian_Open,	
	COALESCE(MAX(CASE WHEN tourney_name = 'Roland Garros' THEN winner_name END), 'NA') AS Roland_Garros,
	COALESCE(MAX(CASE WHEN tourney_name = 'Wimbledon' THEN winner_name END), 'NA') AS Wimbledon,
	COALESCE(MAX(CASE WHEN tourney_name = 'US Open' THEN winner_name END), 'NA') AS US_Open
FROM ATP_Tour
WHERE 
	tourney_level = 'G' 
AND round = 'F'
GROUP BY 1
ORDER BY 1 DESC;

-- 5. Last Time None of the Big 3 Won a GS
WITH champs_list AS(
SELECT EXTRACT(YEAR FROM tourney_date) AS year,
	COALESCE(MAX(CASE WHEN tourney_name = 'Australian Open' THEN winner_name END), 'NA') AS Australian_Open,	
	COALESCE(MAX(CASE WHEN tourney_name = 'Roland Garros' THEN winner_name END), 'NA') AS Roland_Garros,
	COALESCE(MAX(CASE WHEN tourney_name = 'Wimbledon' THEN winner_name END), 'NA') AS Wimbledon,
	COALESCE(MAX(CASE WHEN tourney_name = 'US Open' THEN winner_name END), 'NA') AS US_Open
FROM ATP_Tour
WHERE 
	tourney_level = 'G' 
AND round = 'F'
GROUP BY 1
ORDER BY 1 DESC
)
SELECT 
	year,
	Australian_Open,
	Roland_Garros,
	Wimbledon,
	US_Open
FROM champs_list
WHERE
	Australian_Open NOT IN ('Roger Federer', 'Rafael Nadal', 'Novak Djokovic')  AND
	Roland_Garros   NOT IN ('Roger Federer', 'Rafael Nadal', 'Novak Djokovic') AND
	Wimbledon       NOT IN ('Roger Federer', 'Rafael Nadal', 'Novak Djokovic') AND
	US_Open         NOT IN ('Roger Federer', 'Rafael Nadal', 'Novak Djokovic')
ORDER BY year DESC;

-- 6. Players with 1 GS Titles
WITH GS_winners AS (
SELECT winner_name, 
	MAX(EXTRACT (YEAR FROM tourney_date)) AS latest_year,
	SUM(CASE WHEN tourney_name = 'Australian Open' THEN 1 ELSE 0 END) AS Australian_Open,
	SUM(CASE WHEN tourney_name = 'Roland Garros' THEN 1 ELSE 0 END) AS Roland_Garros,
	SUM(CASE WHEN tourney_name = 'Wimbledon' THEN 1 ELSE 0 END) AS Wimbledon,
	SUM(CASE WHEN tourney_name = 'US Open' THEN 1 ELSE 0 END) AS US_Open,
	COUNT(*)AS GS_total
FROM atp_tour
WHERE tourney_level = 'G' AND round = 'F'
GROUP BY winner_name
-- ORDER BY GS_total desc;
)
SELECT 
	latest_year as year, 
	winner_name, 
	Australian_Open, 
	Roland_Garros,
	Wimbledon,
	US_Open,
	GS_total
FROM GS_winners
WHERE GS_total = 1
ORDER BY latest_year DESC
;

-- 7. Players with longest winning streak at the US Open
WITH RR AS (
SELECT 
	winner_name, 
	-- tourney_name, 
	EXTRACT(YEAR FROM tourney_date) AS year,
	round,
	CASE WHEN round = 'F' THEN 7
		 WHEN round = 'SF' THEN 6
		 WHEN round = 'QF' THEN 5
		 WHEN round = 'R16' THEN 4
		 WHEN round = 'R32' THEN 3
		 WHEN round = 'R64' THEN 2
		 WHEN round = 'R128' THEN 1
	END AS round_rank
	-- loser_name
FROM atp_tour
WHERE tourney_name = 'US Open'
ORDER BY winner_name, EXTRACT(YEAR FROM tourney_date) ASC
)
SELECT 
	distinct winner_name,
	year,
	-- round,
	-- round_rank,	
	-- LEAD(round_rank, 1) OVER(PARTITION BY winner_name 
	-- 	ORDER BY year ASC) as next_round,
	MAX(round_rank) OVER (PARTITION BY winner_name, year ORDER BY year ASC) AS highest_round_won
	-- LEAD(round_rank, 1) OVER (PARTITION BY winner_name ORDER BY year ASC) - round_rank AS round_diff
FROM RR
ORDER BY winner_name, year;

-- 7. Last US Open Champion left in the draw!
SELECT 
    winner_name AS player,
    EXTRACT(YEAR FROM tourney_date) AS year
FROM atp_tour
WHERE 
    tourney_name = 'US Open' AND
    round = 'F' AND
    winner_name IN ('David Goffin', 'Tomas Machac',
                    'Botic van de Zandschulp', 'Jack Draper',
                    'Jannik Sinner', 'Christopher O''Connell',
					'Gabriel Diallo', 'Tommy Paul',
					'Nuno Borges', 'Jakub Menšík',
					'Matteo Arnaldi', 'Jordan Thompson',
					'Alex de Minaur', 'Dan Evans',
					'Flavio Cobolli', 'Daniil Medvedev',
					'Andrey Rublev', 'Grigor Dimitrov',
					'Brandon Nakashima', 'Alexander Zverev',
					'Casper Ruud', 'Taylor Fritz',
					'Frances Tiafoe', 'Alexei Popyrin');

-- 8 US Open 2024 Semifinalists Win-Loss Record
WITH wins AS(
SELECT
	winner_name as player_name,
	COUNT(match_num) as matches_won,
	FLOOR(Max(winner_age)) as age,
	winner_ioc as country
FROM atp_tour
WHERE winner_name IN ('Jannik Sinner', 'Frances Tiafoe', 'Taylor Fritz', 'Jack Draper')
AND score NOT LIKE '%W/O%'
GROUP BY winner_name, winner_ioc
),

losses AS(
SELECT
	loser_name as player_name,
	COUNT(match_num) as matches_lost
FROM atp_tour
WHERE loser_name IN ('Jannik Sinner', 'Frances Tiafoe', 'Taylor Fritz', 'Jack Draper')
AND score NOT LIKE '%W/O%'
GROUP BY loser_name
)
SELECT 
	w.player_name,
	country,
	age,
	matches_won::VARCHAR || '-' || matches_lost::VARCHAR as win_loss,
	ROUND(matches_won*100::NUMERIC/(matches_won + matches_lost),2) as win_percentage
FROM wins w
JOIN losses l
USING (player_name)
ORDER BY win_percentage desc
;
	
-- 9. Top 10 Players with the best win percentage
WITH wins AS(
SELECT
	winner_name as player_name,
	COUNT(match_num) as matches_won,
	FLOOR(Max(winner_age)) as age,
	winner_ioc as country
FROM atp_tour
WHERE score NOT LIKE '%W/O%'
GROUP BY winner_name, winner_ioc
),

losses AS(
SELECT
	loser_name as player_name,
	COUNT(match_num) as matches_lost
FROM atp_tour
WHERE score NOT LIKE '%W/O%'
GROUP BY loser_name
)
SELECT 
	w.player_name,
	country,
	-- age,
	matches_won::VARCHAR || '-' || matches_lost::VARCHAR as win_loss,
	ROUND(matches_won*100::NUMERIC/(matches_won + matches_lost),2) as win_percentage
FROM wins w
JOIN losses l
USING (player_name)
WHERE matches_won + matches_lost >= 100
ORDER BY win_percentage desc
LIMIT 10
;

-- 10. Pre-Puke Vs Post-Puke Sinner
WITH Jannik_Sinner AS
(SELECT 
	winner_name, 
	loser_name,
	match_num,
	tourney_date
 FROM
 	atp_tour
 WHERE
 	score NOT LIKE '%W/O%' AND
	(
		winner_name = 'Jannik Sinner' OR
		loser_name = 'Jannik Sinner')
)
,
Pre_Puke AS
(
SELECT 
	'Pre-Puke' as period,
	(SUM(CASE WHEN winner_name = 'Jannik Sinner' THEN 1 ELSE 0 END)::VARCHAR || '-' || SUM(CASE WHEN loser_name = 'Jannik Sinner' THEN 1 ELSE 0 END)) AS win_loss,
	ROUND(SUM(CASE WHEN winner_name = 'Jannik Sinner' THEN 1 ELSE 0 END)::NUMERIC*100/COUNT(*),2) as win_percent
FROM Jannik_Sinner
WHERE tourney_date <= '9/27/2023'
GROUP BY period
),
Post_Puke AS
(
SELECT 
	'Post-Puke' as period,
	(SUM(CASE WHEN winner_name = 'Jannik Sinner' THEN 1 ELSE 0 END)::VARCHAR || '-' || SUM(CASE WHEN loser_name = 'Jannik Sinner' THEN 1 ELSE 0 END)) AS win_loss,
	ROUND(SUM(CASE WHEN winner_name = 'Jannik Sinner' THEN 1 ELSE 0 END)::NUMERIC*100/COUNT(*),2) as win_percent
FROM Jannik_Sinner
WHERE tourney_date > '9/27/2023'
GROUP BY period
)
SELECT *
FROM Pre_Puke
UNION
SELECT *
FROM Post_Puke
;

-- 11. Most titles won in 2023!
SELECT 
	winner_name AS player,
	COUNT(*) AS num_of_titles
FROM 
	atp_tour
WHERE
	EXTRACT(YEAR FROM tourney_date) = 2023
	AND round = 'F'
GROUP BY player
ORDER BY num_of_titles desc
LIMIT 10;

-- 12 Every Season of Novak Djokovic
WITH Novak AS
(SELECT 
	winner_name, 
	loser_name,
	match_num,
	tourney_date
 FROM
 	atp_tour
 WHERE
 	score NOT LIKE '%W/O%' AND
	(
		winner_name = 'Novak Djokovic' OR
		loser_name = 'Novak Djokovic')
)
SELECT 
	EXTRACT(YEAR FROM tourney_date) AS season,
	(SUM(CASE WHEN winner_name = 'Novak Djokovic' THEN 1 ELSE 0 END)::VARCHAR || '-' || SUM(CASE WHEN loser_name = 'Novak Djokovic' THEN 1 ELSE 0 END)) AS win_loss,
	ROUND(SUM(CASE WHEN winner_name = 'Novak Djokovic' THEN 1 ELSE 0 END)::NUMERIC*100/COUNT(*),2) as win_percent
FROM Novak
GROUP BY season
ORDER BY season ASC
;

