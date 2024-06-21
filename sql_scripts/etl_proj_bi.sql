select * from "Contacts" c ;
select * from "Categories" c ;
select * from "Crowd_Funding" cf ;
select category, avg(pledged), max(pledged)  from (select * from "Crowd_Funding" cf where cf.outcome = 'successful') as cf join "Categories" c on cf.category_id = c.category_id
group by category;

-- Sum of pledges by category
select c.category, sum(cf.pledged) as total_pledged from "Crowd_Funding" cf join "Categories" c ON cf.category_id = c.category_id group by c.category;

-- Sum of pledges by currency
select cf.currency, sum(cf.pledged) as total_pledged from "Crowd_Funding" cf join "Categories" c ON cf.category_id = c.category_id group by cf.currency;

-- backers count and pledge amount for all campaigns
select cf_id as campaign, backers_count, pledged from "Crowd_Funding" cf ;

-- Frequency of campaigns by country
select country, count(*) from "Crowd_Funding" cf group by country;

-- avg goal and pledge by outcome
with usd_only as (select * from "Crowd_Funding" cf where currency = 'USD')
select outcome, avg(goal) as Avg_goal, avg(pledged) as Avg_pledged from usd_only cf group by cf.outcome, cf.currency having outcome = 'failed' or outcome ='successful';







