use challenges;

drop procedure if exists vwap;

delimiter //
create procedure vwap(in start_date date, in start_time time)
begin
	set @init = cast(start_date as datetime) + cast(start_time as time);
    select `<ticker>` as Ticker, date_format(@init,'%Y %M %d') as 'Start Date',
		SUM( `<vol>` * `<close>` ) / SUM(`<vol>`) as VWAP,
		start_time as 'Start Time', DATE_ADD(start_time, INTERVAL 5 HOUR) as 'End Time'
		from (
				select * from sample_dataset2 
					where str_to_date(`<date>`,'%Y%m%d%H%i') BETWEEN
					str_to_date(@init, '%Y%m%d%H%i') AND 
					DATE_ADD(str_to_date(@init, '%Y%m%d%H%i'), INTERVAL 5 HOUR)
			 ) as ds2
		group by Ticker;
end//
delimiter ;

call vwap('2010-10-11','09:00:00')


