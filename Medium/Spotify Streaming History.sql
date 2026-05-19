-- Problem Statement: Spotify Streaming History | Company: Spotify
WITH SONG_CTE AS
  (
    SELECT 
      user_id,
      song_id,
      song_plays
    FROM songs_history 
    
    UNION ALL
    
    SELECT
      user_id,
      song_id,
      COUNT(song_id) AS song_plays
    FROM songs_weekly
    WHERE DAY(listen_time) <= 4 AND YEAR(listen_time) = 2022
    GROUP BY user_id, song_id
  )

SELECT 
  user_id,
  song_id,
  SUM(song_plays) AS song_plays
FROM SONG_CTE AS csc
GROUP BY user_id, song_id
ORDER BY song_plays DESC
