use challenges;

select `<ticker>` as Ticker,ROUND((`<close>` - `<open>`)/`<open>`*100,2) as Percentage_Gain
	from sample_dataset1
    order by Percentage_Gain
    desc
    limit 5;

