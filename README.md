# ATP Tour Analysis

## Introduction
A fun and passionate ongoing project exploring the rich history of ATP Tour data from 1968 to May 2024. Through PstGRE SQL queries this project uncovers key insights such as top players, American performances at the US Open etc. Combining a love for tennis with data analytics, it showcases skills in data cleaning, analysis, and sports analytics.

## Table Preview
Here's a preview of the ATP dataset. This dataset is a collation. Jeff Sackmann's original [dataset](https://github.com/JeffSackmann/tennis_atp) is a collection of several datasets - one each for each season from 1968-2024. I used Tableau Prep to collate them all into one big file - The ATP Tour 1968 - 2024. This dataset is updated to May 2024. If the data is further updated in the future, I plan to update along. I plan to keep adding queries too. Just keep the fun going. This is a big dataset with 193,337 rows, with each row representing a match. 

You can find a the link to the data dictionary describing each column [here](https://github.com/JeffSackmann/tennis_atp/blob/master/matches_data_dictionary.txt).

### ATP Tour First 10 Rows
| winner_name        | tourney_id                       | tourney_name                                      | surface | draw_size | tourney_level | tourney_date | match_num | winner_id | winner_seed | winner_entry | winner_hand | winner_ht | winner_ioc | winner_age | loser_id | loser_seed | loser_entry | loser_name                 | loser_hand | loser_ht | loser_ioc | loser_age | score               | best_of | round | minutes | w_ace | w_df | w_svpt | w_1stin | w_1stwon | w_2ndwon | w_svgms | w_bpsaved | w_bpfaced | l_ace | l_df | l_svpt | l_1stin | l_1stwon | l_2ndwon | l_svgms | l_bpsaved | l_bpfaced | winner_rank | winner_rank_points | loser_rank | loser_rank_points |
|--------------------|----------------------------------|--------------------------------------------------|---------|-----------|---------------|--------------|-----------|-----------|-------------|--------------|-------------|-----------|------------|------------|-----------|-------------|--------------|----------------------------|------------|-----------|------------|------------|---------------------|---------|-------|---------|-------|------|--------|----------|-----------|-----------|---------|------------|-----------|-------|------|--------|----------|-----------|-----------|---------|------------|-----------|--------------|-------------------|------------|-------------------|
| Renzo Olivo        | 2016-0506                        | Buenos Aires                                     | Clay    | 32        | A             | 2016-02-08   | 271       | 105952    | NULL        | WC           | R           | 180       | ARG        | 23.9       | 105487    | NULL        | Q            | Facundo Bagnis              | L          | 183       | ARG        | 25.9       | 7-6(9) 7-5          | 3       | R32   | 132     | 6     | 5    | 111    | 65       | 44        | 21        | 12      | 8          | 11        | 4     | 4    | 77     | 44       | 27        | 18        | 12      | 3          | 7         | 151          | 391               | 97         | 589               |
| Taro Daniel        | 2016-7290                        | Estoril                                          | Clay    | 32        | A             | 2016-04-25   | 283       | 106121    | NULL        | NULL         | R           | 191       | JPN        | 23.2       | 105731    | NULL        | Q            | Steven Diez                 | R          | 180       | CAN        | 25.1       | 7-5 6-1             | 3       | R32   | 92      | 1     | 2    | 56     | 31       | 22        | 11        | 10      | 2          | 5         | 3     | 2    | 56     | 34       | 15        | 8         | 9       | 2          | 8         | 90           | 611               | 264        | 195               |
| Horacio Zeballos   | 2016-7480                        | Los Cabos                                        | Hard    | 32        | A             | 2016-08-08   | 282       | 104547    | NULL        | NULL         | L           | 188       | ARG        | 31.2       | 105238    | 5           | NULL         | Alexandr Dolgopolov         | R          | 180       | UKR        | 27.7       | 6-3 6-3             | 3       | R32   | 61      | 7     | 1    | 61     | 38       | 27        | 12        | 9       | 1          | 2         | 7     | 4    | 63     | 28       | 22        | 12        | 9       | 5          | 9         | 73           | 726               | 38         | 1180              |
| Reda El Amrani     | 2017-M-DC-2017-G2-EPA-M-MAR-DEN-01 | Davis Cup G2 R1: MAR vs DEN                       | Carpet  | 4         | D             | 2017-02-03   | 2         | 105149    | NULL        | NULL         | R           | 185       | MAR        | 28.7       | 126526    | NULL        | NULL         | Soren Hess Olesen           | R          | NULL      | DEN        | 26         | 6-2 3-6 6-2 7-6(5)  | 5       | RR    | 146     | 8     | 7    | 122    | 72       | 56        | 23        | 19      | 6          | 9         | 4     | 4    | 132    | 82       | 54        | 24        | 18      | 9          | 15        | 682          | 36                | NULL       | NULL              |
| Henri Laaksonen    | 2018-0316                        | Bastad                                           | Clay    | 32        | A             | 2018-07-16   | 297       | 105967    | NULL        | LL           | R           | 185       | SUI        | 26.2       | 104620    | NULL        | Q            | Simone Bolelli              | R          | 183       | ITA        | 32.7       | 3-6 6-2 6-4         | 3       | QF    | 113     | 3     | 2    | 78     | 61       | 35        | 12        | 13      | 4          | 8         | 0     | 3    | 83     | 59       | 35        | 9         | 14      | 4          | 10        | 148          | 382               | 153        | 361               |
| Hady Habib         | 2018-M-DC-2018-G2-AO-M-THA-LBN-01 | Davis Cup G2 R3: THA vs LBN                       | Hard    | 4         | D             | 2018-09-15   | 1         | 200273    | NULL        | NULL         | U           | NULL      | LBN        | 20         | 106397    | NULL        | NULL         | Wishaya Trongcharoenchaikul | R          | 193       | THA        | 23.4       | 4-6 7-6(2) 5-3 RET  | 3       | RR    | 128     | 10    | 7    | 99     | 65       | 52        | 18        | 15      | 6          | 8         | 10    | 3    | 81     | 44       | 37        | 19        | 15      | 1          | 3         | 643          | 40                | 453        | 82                |
| Marius Copil       | 2018-M-DC-2018-G2-EPA-M-ROU-POL-01 | Davis Cup G2 R3: ROU vs POL                       | Clay    | 4         | D             | 2018-09-15   | 1         | 105657    | NULL        | NULL         | R           | 193       | ROU        | 27.8       | 111794    | NULL        | NULL         | Kamil Majchrzak             | R          | 183       | POL        | 22.6       | 6-2 6-4             | 3       | RR    | 75      | 6     | 0    | 48     | 28       | 21        | 16        | 9       | 1          | 1         | 1     | 1    | 59     | 40       | 26        | 9         | 9       | 4          | 7         | 81           | 700               | 187        | 297               |
| Casper Ruud        | 2019-6242                        | Winston-Salem                                    | Hard    | 64        | A             | 2019-08-19   | 279       | 134770    | 12          | NULL         | R           | 183       | NOR        | 20.6       | 144750    | NULL        | NULL         | Lloyd Harris                | R          | 193       | RSA        | 22.4       | 6-1 0-0 RET         | 3       | R32   | 31      | 2     | 0    | 20     | 10       | 9         | 7         | 4       | 0          | 0         | 4     | 1    | 31     | 20       | 13        | 7         | 4       | 1          | 3         | 54           | 970               | 100        | 587               |
| Robin Haase        | 2019-M-DC-2019-G1-AO-M-LTU-NED-01 | Davis Cup G1 PO: LTU vs NED                       | Hard    | 4         | D             | 2019-09-13   | 2         | 104918    | NULL        | NULL         | R           | 191       | NED        | 32.3       | 105837    | NULL        | NULL         | Laurynas Grigelis            | R          | 185       | LTU        | 28.2       | 6-7(4) 6-3 6-4 6-4 | 5       | RR    | 68      | 4     | 5    | 87     | 45       | 34        | 15        | 14      | 5          | 6         | 8     | 7    | 110    | 60       | 45        | 15        | 16      | 4          | 11        | 163          | 346               | 472        | 75                |
| Tommy Paul         | 2019-6208                        | Atlanta                                          | Hard    | 28        | A             | 2019-07-22   | 276       | 200282    | NULL        | WC           | R           | 185       | USA        | 22.2       | 106432    | 7           | NULL         | Hyeon Chung                 | R          | 188       | KOR        | 23.3       | 4-6 6-2 6-3         | 3       | R16   | 115     | 9     | 7    | 85     | 54       | 41        | 15        | 14      | 4          | 5         | 5     | 2    | 77     | 42       | 31        | 12        | 12      | 5          | 10        | 129          | 431               | 166        | 349               |

## Queries
### 1. Top 10 Players with Most Wins at the Grand Slams!

```sql
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
;
```
| Player           | Australian_Open | Roland_Garros | Wimbledon | US_Open | total_wins |
|------------------|-----------------|---------------|-----------|---------|------------|
| Roger Federer    | 102             | 73            | 105       | 89      | 369        |
| Novak Djokovic   | 94              | 92            | 92        | 88      | 366        |
| Rafael Nadal     | 77              | 112           | 58        | 67      | 314        |
| Jimmy Connors    | 11              | 40            | 84        | 98      | 233        |
| Andre Agassi     | 48              | 51            | 46        | 79      | 224        |
| Ivan Lendl       | 48              | 53            | 48        | 73      | 222        |
| Pete Sampras     | 45              | 24            | 63        | 71      | 203        |
| Andy Murray      | 51              | 39            | 61        | 49      | 200        |
| Stefan Edberg    | 56              | 30            | 49        | 43      | 178        |
| John McEnroe     | 18              | 25            | 59        | 65      | 167        |


### 2. US Open Champions in the Past 10 Years.

```sql
SELECT 
	EXTRACT(YEAR FROM tourney_date) AS year,
	winner_name AS champion
FROM atp_tour
WHERE tourney_name = 'US Open' AND round = 'F'
ORDER by year DESC
LIMIT 10;
```
| Year | Champion          |
|------|-------------------|
| 2023 | Novak Djokovic     |
| 2022 | Carlos Alcaraz     |
| 2021 | Daniil Medvedev    |
| 2020 | Dominic Thiem      |
| 2019 | Rafael Nadal       |
| 2018 | Novak Djokovic     |
| 2017 | Rafael Nadal       |
| 2016 | Stan Wawrinka      |
| 2015 | Novak Djokovic     |
| 2014 | Marin Cilic        |

### 3. US Players Who Have reached SF or better at the US Open over the past 25 years!

```sql
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
```
| Sr. No | Year | American Player  | Highest Round |
|--------|------|------------------|---------------|
| 1      | 2023 | Ben Shelton       | SF            |
| 2      | 2022 | Frances Tiafoe    | SF            |
| 3      | 2006 | Andy Roddick      | F             |
| 4      | 2005 | Andre Agassi      | F             |
| 5      | 2003 | Andre Agassi      | SF            |
| 6      | 2003 | Andy Roddick      | F             |
| 7      | 2002 | Andre Agassi      | SF            |
| 8      | 2002 | Pete Sampras      | F             |
| 9      | 2001 | Pete Sampras      | F             |
| 10     | 2000 | Pete Sampras      | F             |
| 11     | 2000 | Todd Martin       | SF            |
| 12     | 1999 | Andre Agassi      | F             |
| 13     | 1999 | Todd Martin       | SF            |

### 4. Year Wise Grand Slam Champions List
```sql
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
;
```
| Year | Australian Open       | Roland Garros       | Wimbledon          | US Open           |
|------|-----------------------|---------------------|--------------------|-------------------|
| 2024 | Jannik Sinner          | NA                  | NA                 | NA                |
| 2023 | Novak Djokovic         | Novak Djokovic      | Carlos Alcaraz     | Novak Djokovic    |
| 2022 | Rafael Nadal           | Rafael Nadal        | Novak Djokovic     | Carlos Alcaraz    |
| 2021 | Novak Djokovic         | Novak Djokovic      | Novak Djokovic     | Daniil Medvedev   |
| 2020 | Novak Djokovic         | Rafael Nadal        | NA                 | Dominic Thiem     |
| 2019 | Novak Djokovic         | Rafael Nadal        | Novak Djokovic     | Rafael Nadal      |
| 2018 | Roger Federer          | Rafael Nadal        | Novak Djokovic     | Novak Djokovic    |
| 2017 | Roger Federer          | Rafael Nadal        | Roger Federer      | Rafael Nadal      |
| 2016 | Novak Djokovic         | Novak Djokovic      | Andy Murray        | Stan Wawrinka     |
| 2015 | Novak Djokovic         | Stan Wawrinka       | Novak Djokovic     | Novak Djokovic    |
| 2014 | Stan Wawrinka          | Rafael Nadal        | Novak Djokovic     | Marin Cilic       |
| 2013 | Novak Djokovic         | Rafael Nadal        | Andy Murray        | Rafael Nadal      |
| 2012 | Novak Djokovic         | Rafael Nadal        | Roger Federer      | Andy Murray       |
| 2011 | Novak Djokovic         | Rafael Nadal        | Novak Djokovic     | Novak Djokovic    |
| 2010 | Roger Federer          | Rafael Nadal        | Rafael Nadal       | Rafael Nadal      |
| 2009 | Rafael Nadal           | Roger Federer       | Roger Federer      | Juan Martin del Potro |
| 2008 | Novak Djokovic         | Rafael Nadal        | Rafael Nadal       | Roger Federer     |
| 2007 | Roger Federer          | Rafael Nadal        | Roger Federer      | Roger Federer     |
| 2006 | Roger Federer          | Rafael Nadal        | Roger Federer      | Roger Federer     |
| 2005 | Marat Safin            | Rafael Nadal        | Roger Federer      | Roger Federer     |
| 2004 | Roger Federer          | Gaston Gaudio       | Roger Federer      | Roger Federer     |
| 2003 | Andre Agassi           | Juan Carlos Ferrero | Roger Federer      | Andy Roddick      |
| 2002 | Thomas Johansson       | Albert Costa        | Lleyton Hewitt     | Pete Sampras      |
| 2001 | Andre Agassi           | Gustavo Kuerten     | Goran Ivanisevic   | Lleyton Hewitt    |
| 2000 | Andre Agassi           | Gustavo Kuerten     | Pete Sampras       | Marat Safin       |
| 1999 | Yevgeny Kafelnikov     | Andre Agassi        | Pete Sampras       | Andre Agassi      |
| 1998 | Petr Korda             | Carlos Moya         | Pete Sampras       | Patrick Rafter    |
| 1997 | Pete Sampras           | Gustavo Kuerten     | Pete Sampras       | Patrick Rafter    |
| 1996 | Boris Becker           | Yevgeny Kafelnikov  | Richard Krajicek   | Pete Sampras      |
| 1995 | Andre Agassi           | Thomas Muster       | Pete Sampras       | Pete Sampras      |
| 1994 | Pete Sampras           | Sergi Bruguera      | Pete Sampras       | Andre Agassi      |
| 1993 | Jim Courier            | Sergi Bruguera      | Pete Sampras       | Pete Sampras      |
| 1992 | Jim Courier            | Jim Courier         | Andre Agassi       | Stefan Edberg     |
| 1991 | Boris Becker           | Jim Courier         | Michael Stich      | Stefan Edberg     |
| 1990 | Ivan Lendl             | Andres Gomez        | Stefan Edberg      | Pete Sampras      |
| 1989 | Ivan Lendl             | Michael Chang       | Boris Becker       | Boris Becker      |
| 1988 | Mats Wilander          | Mats Wilander       | Stefan Edberg      | Mats Wilander     |
| 1987 | Stefan Edberg          | Ivan Lendl          | Pat Cash           | Ivan Lendl        |
| 1986 | NA                     | Ivan Lendl          | Boris Becker       | Ivan Lendl        |
| 1985 | Stefan Edberg          | Mats Wilander       | Boris Becker       | Ivan Lendl        |
| 1984 | Mats Wilander          | Ivan Lendl          | John McEnroe       | John McEnroe      |
| 1983 | Mats Wilander          | Yannick Noah        | John McEnroe       | Jimmy Connors     |
| 1982 | Johan Kriek            | Mats Wilander       | Jimmy Connors      | Jimmy Connors     |
| 1981 | Johan Kriek            | Bjorn Borg          | John McEnroe       | John McEnroe      |
| 1980 | Brian Teacher          | Bjorn Borg          | Bjorn Borg         | John McEnroe      |
| 1979 | Guillermo Vilas        | Bjorn Borg          | Bjorn Borg         | John McEnroe      |
| 1978 | Guillermo Vilas        | Bjorn Borg          | Bjorn Borg         | Jimmy Connors     |
| 1977 | Vitas Gerulaitis       | Guillermo Vilas     | Bjorn Borg         | Guillermo Vilas   |
| 1976 | NA                     | Adriano Panatta     | Bjorn Borg         | Jimmy Connors     |
| 1975 | Mark Edmondson         | Bjorn Borg          | Arthur Ashe        | Manuel Orantes    |
| 1974 | John Newcombe          | Bjorn Borg          | Jimmy Connors      | Jimmy Connors     |
| 1973 | Jimmy Connors          | Ilie Nastase        | Jan Kodes          | John Newcombe     |
| 1972 | John Newcombe          | Andres Gimeno       | Stan Smith         | Ilie Nastase      |
| 1971 | Ken Rosewall           | Jan Kodes           | John Newcombe      | Stan Smith        |
| 1970 | Arthur Ashe            | Jan Kodes           | John Newcombe      | Ken Rosewall      |
| 1969 | Rod Laver              | Rod Laver           | Rod Laver          | Rod Laver         |
| 1968 | Bill Bowrey            | Ken Rosewall        | Rod Laver          | Arthur Ashe       |

### 5. Last Time None of the Big 3 Won a GS.
```sql
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
```
| Year | Australian Open       | Roland Garros       | Wimbledon          | US Open           |
|------|-----------------------|---------------------|--------------------|-------------------|
| 2024 | Jannik Sinner          | NA                  | NA                 | NA                |
| 2002 | Thomas Johansson       | Albert Costa        | Lleyton Hewitt     | Pete Sampras      |
| 2001 | Andre Agassi           | Gustavo Kuerten     | Goran Ivanisevic   | Lleyton Hewitt    |
| 2000 | Andre Agassi           | Gustavo Kuerten     | Pete Sampras       | Marat Safin       |
| 1999 | Yevgeny Kafelnikov     | Andre Agassi        | Pete Sampras       | Andre Agassi      |
| 1998 | Petr Korda             | Carlos Moya         | Pete Sampras       | Patrick Rafter    |
| 1997 | Pete Sampras           | Gustavo Kuerten     | Pete Sampras       | Patrick Rafter    |
| 1996 | Boris Becker           | Yevgeny Kafelnikov  | Richard Krajicek   | Pete Sampras      |
| 1995 | Andre Agassi           | Thomas Muster       | Pete Sampras       | Pete Sampras      |
| 1994 | Pete Sampras           | Sergi Bruguera      | Pete Sampras       | Andre Agassi      |
| 1993 | Jim Courier            | Sergi Bruguera      | Pete Sampras       | Pete Sampras      |
| 1992 | Jim Courier            | Jim Courier         | Andre Agassi       | Stefan Edberg     |
| 1991 | Boris Becker           | Jim Courier         | Michael Stich      | Stefan Edberg     |
| 1990 | Ivan Lendl             | Andres Gomez        | Stefan Edberg      | Pete Sampras      |
| 1989 | Ivan Lendl             | Michael Chang       | Boris Becker       | Boris Becker      |
| 1988 | Mats Wilander          | Mats Wilander       | Stefan Edberg      | Mats Wilander     |
| 1987 | Stefan Edberg          | Ivan Lendl          | Pat Cash           | Ivan Lendl        |
| 1986 | NA                     | Ivan Lendl          | Boris Becker       | Ivan Lendl        |
| 1985 | Stefan Edberg          | Mats Wilander       | Boris Becker       | Ivan Lendl        |
| 1984 | Mats Wilander          | Ivan Lendl          | John McEnroe       | John McEnroe      |
| 1983 | Mats Wilander          | Yannick Noah        | John McEnroe       | Jimmy Connors     |
| 1982 | Johan Kriek            | Mats Wilander       | Jimmy Connors      | Jimmy Connors     |
| 1981 | Johan Kriek            | Bjorn Borg          | John McEnroe       | John McEnroe      |
| 1980 | Brian Teacher          | Bjorn Borg          | Bjorn Borg         | John McEnroe      |
| 1979 | Guillermo Vilas        | Bjorn Borg          | Bjorn Borg         | John McEnroe      |
| 1978 | Guillermo Vilas        | Bjorn Borg          | Bjorn Borg         | Jimmy Connors     |
| 1977 | Vitas Gerulaitis       | Guillermo Vilas     | Bjorn Borg         | Guillermo Vilas   |
| 1976 | NA                     | Adriano Panatta     | Bjorn Borg         | Jimmy Connors     |
| 1975 | Mark Edmondson         | Bjorn Borg          | Arthur Ashe        | Manuel Orantes    |
| 1974 | John Newcombe          | Bjorn Borg          | Jimmy Connors      | Jimmy Connors     |
| 1973 | Jimmy Connors          | Ilie Nastase        | Jan Kodes          | John Newcombe     |
| 1972 | John Newcombe          | Andres Gimeno       | Stan Smith         | Ilie Nastase      |
| 1971 | Ken Rosewall           | Jan Kodes           | John Newcombe      | Stan Smith        |
| 1970 | Arthur Ashe            | Jan Kodes           | John Newcombe      | Ken Rosewall      |
| 1969 | Rod Laver              | Rod Laver           | Rod Laver          | Rod Laver         |
| 1968 | Bill Bowrey            | Ken Rosewall        | Rod Laver          | Arthur Ashe       |

### 6. Players with 1 GS Title!
```sql
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
```
| Year | Winner Name            | Australian Open | Roland Garros | Wimbledon | US Open | GS Total |
|------|-------------------------|-----------------|---------------|-----------|---------|----------|
| 2024 | Jannik Sinner           | 1               | 0             | 0         | 0       | 1        |
| 2021 | Daniil Medvedev         | 0               | 0             | 0         | 1       | 1        |
| 2020 | Dominic Thiem           | 0               | 0             | 0         | 1       | 1        |
| 2014 | Marin Cilic             | 0               | 0             | 0         | 1       | 1        |
| 2009 | Juan Martin del Potro   | 0               | 0             | 0         | 1       | 1        |
| 2004 | Gaston Gaudio           | 0               | 1             | 0         | 0       | 1        |
| 2003 | Andy Roddick            | 0               | 0             | 0         | 1       | 1        |
| 2003 | Juan Carlos Ferrero     | 0               | 1             | 0         | 0       | 1        |
| 2002 | Thomas Johansson        | 1               | 0             | 0         | 0       | 1        |
| 2002 | Albert Costa            | 0               | 1             | 0         | 0       | 1        |
| 2001 | Goran Ivanisevic        | 0               | 0             | 1         | 0       | 1        |
| 1998 | Carlos Moya             | 0               | 1             | 0         | 0       | 1        |
| 1998 | Petr Korda              | 1               | 0             | 0         | 0       | 1        |
| 1996 | Richard Krajicek        | 0               | 0             | 1         | 0       | 1        |
| 1995 | Thomas Muster           | 0               | 1             | 0         | 0       | 1        |
| 1991 | Michael Stich           | 0               | 0             | 1         | 0       | 1        |
| 1990 | Andres Gomez            | 0               | 1             | 0         | 0       | 1        |
| 1989 | Michael Chang           | 0               | 1             | 0         | 0       | 1        |
| 1987 | Pat Cash                | 0               | 0             | 1         | 0       | 1        |
| 1983 | Yannick Noah            | 0               | 1             | 0         | 0       | 1        |
| 1980 | Brian Teacher           | 1               | 0             | 0         | 0       | 1        |
| 1977 | Vitas Gerulaitis        | 1               | 0             | 0         | 0       | 1        |
| 1977 | Roscoe Tanner           | 1               | 0             | 0         | 0       | 1        |
| 1976 | Adriano Panatta         | 0               | 1             | 0         | 0       | 1        |
| 1975 | Mark Edmondson          | 1               | 0             | 0         | 0       | 1        |
| 1975 | Manuel Orantes          | 0               | 0             | 0         | 1       | 1        |
| 1972 | Andres Gimeno           | 0               | 1             | 0         | 0       | 1        |
| 1968 | Bill Bowrey             | 1               | 0             | 0         | 0       | 1        |

### 7. Last US Open Champion left in the draw!
```sql
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
;
```
| Player          | Year |
|-----------------|------|
| Daniil Medvedev | 2021 |

### 8. US Open 2024 Semifinalists Win-Loss Record
```sql
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

```
| Player Name   | Country | Age | Win-Loss | Win Percentage |
|---------------|---------|-----|----------|----------------|
| Jannik Sinner | ITA     | 22  | 218-76   | 74.15          |
| Taylor Fritz  | USA     | 26  | 252-177  | 58.74          |
| Jack Draper   | GBR     | 22  | 53-40    | 56.99          |
| Frances Tiafoe| USA     | 26  | 187-176  | 51.52          |

### 9. Top 10 Players with the Best Career Win Percentage!
```sql
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
```
| Player Name      | Country | Win-Loss  | Win Percentage |
|------------------|---------|-----------|----------------|
| Novak Djokovic   | SRB     | 1101-219  | 83.41          |
| Rafael Nadal     | ESP     | 1075-224  | 82.76          |
| Bjorn Borg       | SWE     | 650-140   | 82.28          |
| Roger Federer    | SUI     | 1251-275  | 81.98          |
| Jimmy Connors    | USA     | 1276-288  | 81.59          |
| John McEnroe     | USA     | 881-199   | 81.57          |
| Ivan Lendl       | USA     | 1068-242  | 81.53          |
| Rod Laver        | AUS     | 576-146   | 79.78          |
| Carlos Alcaraz   | ESP     | 173-48    | 78.28          |
| Pete Sampras     | USA     | 762-222   | 77.44          |

### 10. Pre-Puke Vs Post-Puke Sinner
```sql
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
UNION ALL 
SELECT *
FROM Post_Puke;
```
| Period      | Win-Loss | Win Percentage |
|-------------|----------|----------------|
| Pre-Puke    | 175-72   | 70.85          |
| Post-Puke   | 43-4     | 91.49          |

### 11. Most Titles Won in 2023!

```sql
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
;
```
| Player              | Number of Titles |
|---------------------|------------------|
| Novak Djokovic      | 7                |
| Carlos Alcaraz      | 6                |
| Daniil Medvedev     | 5                |
| Jannik Sinner       | 4                |
| Taylor Fritz        | 3                |
| Adrian Mannarino    | 3                |
| Frances Tiafoe      | 3                |
| Sebastian Baez      | 3                |
| Alexander Bublik    | 2                |
| Andrey Rublev       | 2                |

### 12 Every Season of Novak Djokovic
```sql
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
	(SUM(CASE WHEN winner_name = 'Novak Djokovic' THEN 1 ELSE 0 END)::VARCHAR || '-' || SUM(CASE WHEN loser_name = 	 
         'Novak Djokovic' THEN 1 ELSE 0 END)) AS win_loss,
	ROUND(SUM(CASE WHEN winner_name = 'Novak Djokovic' THEN 1 ELSE 0 END)::NUMERIC*100/COUNT(*),2) as win_percent
FROM Novak
GROUP BY season
ORDER BY season ASC
;
```
| Season | win_loss | win_percent |
|--------|----------|----------------|
| 2004   | 2-3      | 40.00       |
| 2005   | 11-11    | 50.00        |
| 2006   | 40-18    | 68.97       |
| 2007   | 68-19    | 78.16      |
| 2008   | 64-17    | 79.01         |
| 2009   | 78-19    | 80.41         |
| 2010   | 61-18    | 77.22         |
| 2011   | 70-6     | 92.11         |
| 2012   | 75-12    | 86.21         |
| 2013   | 74-9     | 89.16         |
| 2014   | 61-8     | 88.41         |
| 2015   | 82-6     | 93.18         |
| 2016   | 65-9     | 87.84         |
| 2017   | 32-8     | 80.00         |
| 2018   | 56-14    | 80.00         |
| 2019   | 54-10    | 84.38         |
| 2020   | 41-5     | 89.13         |
| 2021   | 55-7     | 88.71         |
| 2022   | 42-7     | 85.71         |
| 2023   | 56-7     | 88.89         |
| 2024   | 14-6     | 70.00         |
