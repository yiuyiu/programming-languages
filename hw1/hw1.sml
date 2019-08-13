fun is_older(date1:int*int*int,date2:int*int*int)=
    let 
	val d1 = 365*(#1 date1) + 30*(#2 date1) + (#3 date1)
	val d2 = 365*(#1 date2) + 30*(#2 date2) + (#3 date2)
    in
	if d1 < d2
	then true
	else false
    end
fun number_in_month(dls: (int*int*int) list, month: int)=
    if null dls
    then 0
    else
	if (#2 (hd dls)) = month
	then 1+ number_in_month(tl dls,month)
	else number_in_month(tl dls,month)
(* 3 *)
fun number_in_months(dls: (int*int*int) list,months: int list)=
    if null months
    then 0
    else number_in_month(dls,hd months) + number_in_months(dls, tl months)

(* 4 *)
fun dates_in_month(dls: (int*int*int) list, month: int)=
    if null dls
    then []
    else
	if (#2 (hd dls)) = month
	then (hd dls)::dates_in_month(tl dls, month)
	else dates_in_month(tl dls, month)

(* 5 *)
fun dates_in_months(dls: (int*int*int) list, months: int list)=
    if null months
    then []
    else dates_in_month(dls, hd months) @ dates_in_months(dls, tl months)

(* 6 *)
fun get_nth(strs: string list, n: int)=
    if n =1
    then hd strs
    else get_nth(tl strs, n-1)

fun date_to_string(date: int*int*int)=(* 7 *)
    let val MONTH = ["January","February", "March", "April","May", "June", "July", "August", "September", "October", "November", "December"]
    in get_nth(MONTH, #2 date)^" "^Int.toString(#3 date)^", "^Int.toString(#1 date)
    end
fun number_before_reaching_sum(sum: int, someList: int list)=(* 8 *)
    let
	fun get_index(total: int, index: int, ls: int list)=
	    if total>=sum
	    then index-1
	    else get_index(total+(hd ls),index+1,tl ls)
    in get_index(0,0,someList)
    end

fun what_month(num: int)= (* 9 *)
    let val months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
	number_before_reaching_sum(num, months)+1
    end
fun month_range(day1: int,day2: int)= (* 10 *)
    if day1>day2
    then []
    else
    let fun acc(ls: int list,day: int)=
	    if day<day1
	    then ls
	    else acc(what_month(day)::ls,day-1)
    in
	acc([],day2)
    end
    
fun oldest(dates: (int*int*int) list)=(* 11 *)
    if null dates
    then NONE
    else if (tl dates) = []
    then SOME(hd dates)
    else 
	let val partOld = oldest(tl dates)
	in
	    if is_older(hd dates, valOf partOld)
	    then SOME(hd dates)
	    else partOld
	end
fun deDuplicate(ls: int list)=
    if null ls orelse null (tl ls)
    then ls
    else
	let fun filtered(ls2: int list, num: int)=
		if null ls2
		then []
		else
		    let val nextFiltered = filtered(tl ls2,num)
		    in if num = hd ls2
		       then nextFiltered
		       else (hd ls2)::nextFiltered
		    end
	in
	    (hd ls):: deDuplicate(filtered(tl ls,hd ls))
	end
fun number_in_months_challenge(dls: (int*int*int) list,months: int list)=(* 12 *)
    let val newMonth = deDuplicate(months)
    in number_in_months(dls,newMonth)
    end

fun dates_in_months_challenge(dls: (int*int*int) list, months: int list)=(* 13 *)
    let val newMonth = deDuplicate(months)
    in dates_in_months(dls,newMonth)
    end

fun reasonable_date(date: int*int*int)=(* 14 *)
    let
	val normalMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
	val leapMonth = [31,29,31,30,31,30,31,31,30,31,30,31]
	val year = #1 date
	val month = #2 date
	val day = #3 date
	val isLeapYear = (year mod 400 = 0 ) orelse (year mod 100 <> 0 andalso year mod 4 = 0)
	fun getListFromIndex(index: int, months: int list)=
	    if index = month
	    then months
	    else getListFromIndex(index+1, tl months)	 
    in
	if year > 0 andalso month> 0 andalso month <=12 andalso month>0 andalso day >0 andalso day <=31
	then
	    let val actualDay = if isLeapYear then hd(getListFromIndex(1, leapMonth)) else  hd(getListFromIndex(1, normalMonth))
	    in
		if actualDay< day
		then false
		else true
	    end									    
	else false
    end	
