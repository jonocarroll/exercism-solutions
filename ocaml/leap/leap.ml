let leap_year year = 
    if year mod 4 = 0 then
       if year mod 100 = 0 then
           if year mod 400 = 0 then true else false
       else true
    else false;;

