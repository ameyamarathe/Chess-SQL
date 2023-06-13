# Unleashing : How a SQL Analysis can Revolutionise the Game of Chess

Introduction :

The purpose of analysing the Dataset is to gain insights into the games played and their outcomes, as well as to understand the performance of individual players and different opening moves. This analysis could be useful for various stakeholders, such as chess players, coaches, and organisers, as it can provide valuable information on strategies, trends, and performance metrics that can be used to improve game play and decision-making. Additionally, this analysis can be used to identify patterns and trends that could inform future research and development of the game of chess. The dataset includes various pieces of information such as the game id, ratings of players, victory status, winner, and opening moves, among others.



Data Source

The data was obtained from lichess.org via Maven Analytics, which provided information on the player's moves and their preferred Strategies and their initial moves on the board. The Data contained more than 20,000 records. The data was imported into an Oracle MySQL database and was managed using DBeaver as data management tool.

Data Cleaning

The data needed some cleaning before it could be analyzed. Some of the issues with the data included missing values, inconsistent naming conventions, and different data types. To clean the data, I performed the following steps:

Removed rows with missing values
Renamed some of the columns to have consistent naming conventions
Converted data types to be consistent across the database

Database Design

The database consisted of a single table with 17 Fields ranging from player ID, preferred choices, opening moves and variations, Initial moves, time taken to the game. It also included average number of moves taken by a player for the game.



SQL Queries

To gain insights from the data I ran several SQL queries. Some of the queries and described below with the GITHUB Link Provided at the Botton.

What percentage of games are won by the player with the higher rating? Does this vary by piece colour
Which user won the most amount of games? In what percentage of those games was the user the higher rated player.
What percentage of games were won by white? How many ended in a draw?
Which opening move was most frequently used in games in which black won



Insights:

This dataset provides several impactful insights on the playing habits and success rates of chess players:

Players who prefer to start the game with White Chessman tend to use Sicilian Defence as their most preferred move, while those who play with Black Chessman prefer Queen's Pawn.
Starting the game with White Chessman gives players a higher chance of winning, as 45.8% of the games in the dataset were won by such players.
One particular user stands out for winning 209 games and maintaining a win rate of 41.7%. Furthermore, this user was often the higher rated player in more than 51% of the matches played, indicating a high level of skill and strategic play.



Conclusion:

Overall, this analysis provides insights into various characteristics of the games in the chess dataset. The findings suggest that certain opening moves may have an impact on the outcome of the game, and that the player with a higher rating does not always guarantee a win. Additionally, the analysis provides information on the performance of individual players and teams. These insights may be useful for chess enthusiasts, coaches, and players to improve their gameplay and strategies.



(You can Find the Link to my Repository here for the Full code and Documentation 
