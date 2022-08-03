use challenges;
select `<ticker>` from sample_dataset1;

DELIMITER //
CREATE procedure show_symbols()
begin
	select `<ticker>` from sample_dataset1;
end//
Delimiter ;

drop procedure show_symbols;

DELIMITER //
CREATE procedure show_symbols(
	IN symboltext varchar(5)
)
begin
	select `<ticker>` from sample_dataset1
    where `<ticker>` like symboltext;
end//
Delimiter ;

drop procedure show_symbols;

DELIMITER //
CREATE procedure show_symbols(
	IN symboltext varchar(5)
)
begin
    set @counter = 0;
    
	select (@counter := @counter +1) as Count, `<ticker>` from sample_dataset1
    where `<ticker>` like symboltext;
end//
Delimiter ;
