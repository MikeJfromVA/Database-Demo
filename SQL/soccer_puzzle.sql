create table scores (
  match_id	int,
  first_team_score	int,
  second_team_score	int,
  match_host int
  );
  
  insert into scores (match_id	,first_team_score,	second_team_score	,match_host)
  values
  (1,	3	,2,	1),
(2	,2	,1,	2),
(3,	1	,2	,1),
(4	,2	,1,	2)
;




/*Please add ; after each select statement*/
CREATE PROCEDURE soccerGameSeries()
BEGIN
    declare one_wins int;
    declare two_wins int;
    declare one_goals_total int;
    declare two_goals_total int;
    declare one_away_goals int;
    declare two_away_goals int;



    select count(*) into one_wins
    from scores
    where first_team_score > second_team_score;

    select count(*) into two_wins
    from scores
    where first_team_score < second_team_score;

    if one_wins > two_wins then
        select 1 as winner;
    elseif two_wins > one_wins then
        select 2 as winner;
    else
        select sum(first_team_score) into one_goals_total
            from scores;
        select sum(second_team_score) into two_goals_total
            from scores;

        if one_goals_total > two_goals_total then
            select 1 as winner;
        elseif two_goals_total > one_goals_total then
            select 2 as winner;
        else
            select sum(first_team_score) into one_away_goals
            from scores 
            where match_host = 2;

            select sum(second_team_score) into two_away_goals
            from scores 
            where match_host = 1;

            if one_away_goals > two_away_goals then
                select 1 as winner;
            elseif two_away_goals > one_away_goals then
                select 2 as winner;
            else
                select 0 as winner;
            end if;
        end if;
    end if;

END


scores
match_id	first_team_score	second_team_score	match_host
1	3	2	1
2	2	1	2
3	1	2	1
4	2	1	2
Output:
winner
1


scores
match_id	first_team_score	second_team_score	match_host
1	3	2	1
2	2	1	2
3	1	2	1
4	2	1	2
5	2	4	2
6	1	3	1
Output:
winner
2

scores
match_id	first_team_score	second_team_score	match_host
1	3	2	1
2	2	1	2
3	1	2	1
4	2	1	2
5	2	4	2
6	1	3	1
7	4	1	2
8	1	2	1
Output:
winner
1


scores
match_id	first_team_score	second_team_score	match_host
1	3	1	1
2	2	1	2
3	0	2	1
4	2	1	2
5	2	4	2
6	1	3	1
7	4	2	2
8	1	2	1
9	1	2	2
10	3	1	1
11	2	1	1
12	0	1	1
Output:
winner
0
Expected Output:
winner
0

