type date = int * int * int

fun year  (d : date) = #1 d
fun month (d : date) = #2 d
fun day   (d : date) = #3 d

fun is_older (first : date, second : date) =
  let
    fun product (date) =
      year(date) * 365 + month(date) * 31 + day(date)
  in
    product first < product second
  end

fun number_in_month (xs : date list, m : int) = 
    if null xs
    then 0
    else 
	if month(hd xs) = m
	then 1 + number_in_month(tl xs, m)
	else number_in_month(tl xs, m);

fun number_in_months (xs : date list, months : int list) =
    if null months 
    then 0
    else number_in_month(xs, hd months) + number_in_months(xs, tl months)

fun dates_in_month (xs : date list, m : int) = 
    if null xs
    then []
    else
	if month(hd xs) = m
	then (hd xs)::dates_in_month(tl xs, m)
	else dates_in_month(tl xs, m)

fun dates_in_months (xs : date list, months : int list) = 
    if null xs orelse null months
    then []
    else dates_in_month(xs, hd months) @ dates_in_months(xs, tl months)

fun get_nth (xs : string list, idx : int) = 
    if idx = 1
    then hd xs
    else get_nth(tl xs, idx-1)

fun date_to_string (d : date) = 
    let
	val ms = ["January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December"]
    in
	get_nth(ms, month d) ^ " " ^ Int.toString(day d) ^ ", " ^ Int.toString(year d)
    end

fun number_before_reaching_sum (sum : int, xs : int list) = 
    let
	fun acc (count : int, sum : int, xs : int list) = 
	    let
		val diff = sum - hd xs;
	    in	
		if diff <= 0
		then count
		else acc(count + 1, diff, tl xs)
	    end  
    in
	acc(0, sum, xs)
    end

fun what_month (m : int) = 
    let
	val month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(m, month_days) + 1
    end

fun month_range (d1 : int, d2 : int) = 
    if d1 > d2 then
	[ ]
    else
	what_month(d1) :: month_range(d1 + 1, d2)

fun oldest (ds : date list) =
    if null ds
    then NONE
    else     
	let 
	    val old = oldest(tl ds)
	in
	    if isSome old andalso is_older(valOf old, hd ds) 
	    then old
	    else SOME(hd ds)
	end

fun contains (x : int, xs : int list) =
    if null xs 
    then false
    else 
	if hd xs = x 
	then true
	else contains(x, tl xs)

fun remove_dups (xs : int list) =
    let
	fun acc (xs : int list,  ys : int list) =
	    if null xs 
	    then ys
	    else 
		if contains(hd xs, ys) 
		then acc(tl xs, ys)
		else acc(tl xs, ys @ [hd xs])
    in
	acc(xs, [ ])
    end

fun number_in_months_challenge (ds : date list, ms : int list) =
    if null ds orelse null ms
    then 0
    else number_in_months(ds, remove_dups(ms))

fun dates_in_months_challenge (ds : date list, ms : int list) =
    if null ds orelse null ms 
    then []
    else dates_in_months(ds, remove_dups(ms))

fun reasonable_date (d : date) =
    let
	fun leap_year (y : int) =
	    y mod 400 = 0 orelse (y mod 100 <> 0 andalso y mod 4 = 0)

	fun index (xs : int list, n : int) =
	    if n = 1 
	    then hd xs 
	    else index(tl xs, n - 1)

	val m_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	val y = year(d)
	val m = month(d)
	val d = day(d)
    in
	if y < 1 orelse (m < 1 orelse m > 12) orelse (d < 1 orelse d > 31) 
	then false
	else 
	    if leap_year y andalso m = 2 
	    then d <= 29
	    else d <= index(m_days, m)
    end
