use "hw1.sml";
val test1_1 = is_older ((1,2,3),(2,3,4)) = true
val test1_2 = is_older ((1,1,1),(1,1,1)) = false
val test1_3 = is_older ((2017,1,1),(2017,2,1)) = true
val test1_4 = is_older ((2017,1,1),(2017,1,2)) = true
val test2_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2_2 = number_in_month ([(1,1,1),(1,2,3),(1,2,3),(1,1,2)],1) = 2
val test3_1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val test3_2 = number_in_months([(1,2,3),(1,3,4),(1,4,4)],[2,3])=2
val test4_1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test5_1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"
val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val test8_1 = number_before_reaching_sum (10, [3,4,5,6,7]) = 2
val test9 = what_month 70 = 3
val test9_1 = what_month 32 = 2
val test10 = month_range (31, 34) = [1,2,2,2]			 
val test10_1 = month_range (28,34) = [1,1,1,1,2,2,2]
val test10_2 = month_range (10,9) = [] 
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11_1 = oldest([]) = NONE
val test12_1 =  number_in_months_challenge([(1,2,3),(1,3,4),(1,4,4)],[2,2,2])=1
val test13 = dates_in_months_challenge([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,2,3,4,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val test14 = reasonable_date(2012,1,2) = true
val test14_1 = reasonable_date(2006,13,12) = false
