USE Emma;
#answer1 
SELECT date, SUM(impressions) AS total_impressions
FROM marketing_performance
GROUP BY date
ORDER BY date;

#answer 2
SELECT state, SUM(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 3;

#Answer 3
SELECT c.name AS campaign_name, 
       SUM(m.cost) AS total_cost, 
       SUM(m.impressions) AS total_impressions, 
       SUM(m.clicks) AS total_clicks, 
       SUM(w.revenue) AS total_revenue
FROM campaign_info c
JOIN marketing_performance m ON c.id = m.campaign_id
JOIN website_revenue w ON c.id = w.campaign_id
GROUP BY c.name;

#answer 4
SELECT m.geo AS state, SUM(m.conversions) AS total_conversions
FROM marketing_performance m
WHERE m.campaign_id = 99058240
GROUP BY m.geo
ORDER BY total_conversions DESC
LIMIT 1;

#Answer 5
SELECT c.name AS campaign_name, 
       AVG(m.cost) AS AVG_cost, 
       AVG(m.impressions) AS AVG_impressions, 
       AVG(m.clicks) AS AVG_clicks, 
       AVG(w.revenue) AS AVG_revenue
FROM campaign_info c
JOIN marketing_performance m ON c.id = m.campaign_id
JOIN website_revenue w ON c.id = w.campaign_id
GROUP BY c.name;

#based on the query above, I beleive campaign 4 was the most efficient due to it having the lowest average cost, but highest average impression and revenue generated.
#Bonus question 6

#Bonus Question
SELECT DAYNAME(date) AS day_of_week, AVG(conversions) AS AVG_conversions
FROM marketing_performance
GROUP BY day_of_week
ORDER BY AVG_conversions DESC
LIMIT 1;

