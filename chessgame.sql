-- chess.chess definition

CREATE TABLE `chess` (
  `game_id` int DEFAULT NULL,
  `rated` blob,
  `turns` int DEFAULT NULL,
  `victory_status` blob,
  `winner` blob,
  `time_increment` blob,
  `white_id` blob,
  `white_rating` blob,
  `black_id` blob,
  `black_rating` int DEFAULT NULL,
  `moves` blob,
  `opening_code` blob,
  `opening_moves` blob,
  `opening_fullname` blob,
  `opening_shortname` blob,
  `opening_response` blob,
  `opening_variation` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/* What is the average rating of all the white players in the dataset,( Round it two nearest 2 decimal places?) */
SELECT ROUND(AVG(white_rating),2) AS Avg_White_Rating
FROM chess 


/* How many games in the dataset were rated? */
SELECT COUNT(*) AS NO_OF_GAMES
FROM chess 
WHERE rated = 'TRUE';


/* Which player had the highest rating in the black team */
SELECT black_id, black_rating 
FROM chess 
ORDER BY black_rating  DESC 
LIMIT 1;


/* How many games in the dataset ended in a draw? */
SELECT COUNT(*) AS NO_OF_GAMES
FROM chess 
where victory_status = 'Draw'


/* What is the average number of turns per game in the dataset? */
SELECT AVG(opening_moves) AS Avg_Turns_Per_Game 
FROM chess

/* Which are the top 5 openings  in the dataset? */
SELECT  opening_fullname,COUNT(opening_fullname) AS Most_no_of_Opening 
FROM chess 
GROUP BY opening_fullname 
ORDER BY Most_no_of_Opening  DESC 


/* Which are the top 5 openings  in the dataset? */
SELECT AVG(SUBSTRING_INDEX(time_increment, '+', 1)) AS Avg_increase_in_time
FROM chess ;


/* How many games in the dataset did not have a winner? */
SELECT COUNT(*) AS Games_with_no_winner
FROM chess 
WHERE victory_status = 'Draw' OR victory_status = 'Out of Time'


/* Which player had the lowest rating in the white team? */
SELECT white_id , white_rating
FROM chess 
ORDER BY white_rating  DESC 
LIMIT 1;



/* What is the longest game in the dataset in terms of the number of moves? */
SELECT *
FROM chess 
ORDER BY turns DESC 
LIMIT 1;
	
			/* OR Alternative using Max function */
			SELECT  MAX(turns) AS Maximum_moves
			FROM chess

			
/* What percentage of games were won by white? How many ended in a draw? */
SELECT 
    COUNT(*) AS total_games,
    COUNT(CASE WHEN victory_status = 'Mate' AND winner = 'White' THEN 1 ELSE NULL END) + 
    COUNT(CASE WHEN victory_status = 'Resign' AND winner = 'White' THEN 1 ELSE NULL END) AS white_wins,
    COUNT(CASE WHEN victory_status = 'Draw' THEN 1 ELSE NULL END) AS draws,
    (COUNT(CASE WHEN victory_status = 'Mate' AND winner = 'White' THEN 1 END) / COUNT(*)) * 100 AS white_win_percentage
FROM chess;


/* Which opening move was most frequently used in games in which black won */
SELECT 
    opening_moves, 
    COUNT(*) AS Winning_frequency 
FROM chess  
WHERE winner = 'Black' 
GROUP BY opening_moves 
ORDER BY Winning_frequency DESC 
LIMIT 1;




/* Which opening move was most frequently used in games in which black won */
SELECT 
	opening_moves,
	COUNT(*) AS Winning_frequency 
FROM chess  
WHERE winner = 'White' 
GROUP BY opening_moves 
ORDER BY Winning_frequency DESC 
LIMIT 1;



/* What percentage of games are won by the player with the higher rating? Does this vary by piece color*/
SELECT
    COUNT(*) AS total_games,
    SUM(CASE WHEN winner = 'White' AND white_rating > black_rating THEN 1 ELSE 0 END) AS white_wins_higher_rating,
    SUM(CASE WHEN winner = 'Black' AND black_rating > white_rating THEN 1 ELSE 0 END) AS black_wins_higher_rating,
    SUM(CASE WHEN winner = 'White' AND black_rating > white_rating THEN 1 ELSE 0 END) AS white_wins_lower_rating,
    SUM(CASE WHEN winner = 'Black' AND white_rating > black_rating THEN 1 ELSE 0 END) AS black_wins_lower_rating,
    (SUM(CASE WHEN (winner = 'White' AND white_rating > black_rating) OR (winner = 'Black' AND black_rating > white_rating) THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percentage_higher_rating_wins
FROM chess 



/* Which user won the most amount of games? In what percentage of those games was the user the higher rated player */
SELECT
    winner AS Player,
    COUNT(*) AS total_games_won,
    ROUND(((SUM(CASE WHEN winner = 'White' AND white_rating > black_rating THEN 1 ELSE 0 END) + 
     SUM(CASE WHEN winner = 'Black' AND black_rating > white_rating THEN 1 ELSE 0 END)) / COUNT(*) * 100), 2) AS percentage_higher_rating_wins

FROM 
    chess
GROUP BY 
    winner
ORDER BY 
    total_games_won DESC
LIMIT 
    1;




