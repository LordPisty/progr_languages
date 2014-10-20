val d1  = (1988, 9, 29);
val d2  = (2001, 9, 11);
val d3  = (2013, 1, 14);
val d4  = (1997, 7, 17);
val ds  = [d1, d2, d3, d4];
val ms1 = [1, 9];
val ms2 = [9, 11, 6];
val ms3 = [2, 3, 4, 6, 8, 10];
val ms4 = [10, 7];

val test11 = is_older(d1, d2) = true;
val test12 = is_older(d2, d1) = false;
val test13 = is_older(d1, d1) = false;
val test14 = is_older(d3, d2) = false;
val test15 = is_older(d2, d3) = true;
val test16 = is_older(d4, d1) = false;

val test21 = number_in_month(ds, 9) = 2;
val test22 = number_in_month(ds, 1) = 1;
val test23 = number_in_month(ds, 3) = 0;

val test31 = number_in_months(ds, ms1) = 3;
val test32 = number_in_months(ds, ms2) = 2;
val test33 = number_in_months(ds, ms3) = 0;

val test41 = dates_in_month(ds, 9) = [d1, d2];
val test42 = dates_in_month(ds, 1) = [d3];
val test43 = dates_in_month(ds, 3) = [ ];

val test51 = dates_in_months(ds, ms1) = [d3, d1, d2];
val test52 = dates_in_months(ds, ms2) = [d1, d2];
val test53 = dates_in_months(ds, ms3) = [ ];
val test54 = dates_in_months(ds, ms4) = [d4];

val ss1     = ["one", "two", "three", "four", "five"];
val test61 = get_nth(ss1, 2) = "two";
val test62 = get_nth(ss1, 1) = "one";

val test71 = date_to_string(d1) = "September 29, 1988";
val test72 = date_to_string(d2) = "September 11, 2001";
val test73 = date_to_string(d3) = "January 14, 2013";
val test74 = date_to_string(d4) = "July 17, 1997";

val numbers = [1, 6, 9, 4, 2, 19];
val test81 = number_before_reaching_sum (8, numbers)  = 2;
val test82 = number_before_reaching_sum (17, numbers) = 3;
val test83 = number_before_reaching_sum (21, numbers) = 4;
val test84 = number_before_reaching_sum (1, numbers)  = 0;

val test91 = what_month (10)  = 1;
val test92 = what_month (360) = 12;
val test93 = what_month (150) = 5;
val test94 = what_month (290) = 10;
val test95 = what_month (60)  = 3; (* no leap years *)

val test101 = month_range(29,34)   = [1, 1, 1, 2, 2, 2];
val test102 = month_range(20,19)   = [ ];
val test103 = month_range(101,101) = [4];
val test104 = month_range(304,305) = [10, 11];

val test111 = oldest([ ])  = NONE;
val test112 = oldest([d2]) = SOME(d2);
val test113 = oldest(ds)   = SOME(d1);

val test121 = number_in_months_challenge(ds, ms1) = number_in_months(ds, ms1);
val test122 = number_in_months_challenge(ds, ms2) = number_in_months(ds, ms2);
val test123 = number_in_months_challenge(ds, ms3) = number_in_months(ds, ms3);
val test124 = number_in_months_challenge(ds, ms1 @ ms1) = number_in_months(ds, ms1);
val test125 = number_in_months_challenge(ds, ms2 @ ms2) = number_in_months(ds, ms2);
val test126 = number_in_months_challenge(ds, ms3 @ ms3) = number_in_months(ds, ms3);

val test127 = dates_in_months_challenge(ds, ms1) = dates_in_months(ds, ms1);
val test128 = dates_in_months_challenge(ds, ms2) = dates_in_months(ds, ms2);
val test129 = dates_in_months_challenge(ds, ms3) = dates_in_months(ds, ms3);
val test12A = dates_in_months_challenge(ds, ms4) = dates_in_months(ds, ms4);
val test12B = dates_in_months_challenge(ds, ms1 @ ms1)=dates_in_months(ds, ms1);
val test12C = dates_in_months_challenge(ds, ms2 @ ms2)=dates_in_months(ds, ms2);
val test12D = dates_in_months_challenge(ds, ms3 @ ms3)=dates_in_months(ds, ms3);
val test12E = dates_in_months_challenge(ds, ms4 @ ms4)=dates_in_months(ds, ms4);

val test133 = reasonable_date(d1) = true;
val test134 = reasonable_date(d2) = true;
val test135 = reasonable_date(d3) = true;
val test136 = reasonable_date(d4) = true;
val test137 = reasonable_date((~10, 1, 1))   =false;
val test138 = reasonable_date((1900, 2, 29)) = false;
val test139 = reasonable_date((1904, 2, 29)) = true;