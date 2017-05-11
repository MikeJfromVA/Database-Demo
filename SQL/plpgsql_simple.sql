drop function if exists plusOne(x int);

create function plusOne(x int) returns int
as $$
declare
  y int;
begin
  y := x + 1;
  return y;
end;
$$ language plpgsql;

select plusOne(7);
