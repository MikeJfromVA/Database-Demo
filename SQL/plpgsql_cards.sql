select * from pg_pltemplate;
select * from pg_available_extensions;

drop function if exists generate_cards();

create function generate_cards() returns table(cardsuit char(1), cardrank char(1))
as $$

declare
  cardsuits char(1)[];
  cardranks char(1)[];
  cs char(1);
  cr char(1);
begin
  cardsuits := '{S, D, C, H}';
  cardranks := '{A, 2, 3, 4, 5, 6, 7, 8, 9, X, J, Q, K}';
  foreach cs in array cardsuits
  loop
    foreach cr in array cardranks
    loop
      cardsuit := cs;
      cardrank := cr;
      return next;
    end loop;
  end loop;

end;

$$ language plpgsql;

select * from generate_cards();



