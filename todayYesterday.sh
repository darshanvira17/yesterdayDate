#! /bin/bash

today=$(date +%Y%m%d) #----gives yyyymmdd

#split and get date year and month
year=${today:0:4} 
month=${today:4:2}
day=${today:6:2}

# remove 0s from single digit months                                                                                                                                                  
if (( ${day:0:1} == 0 )); then day=${day:1:1}; fi
if (( ${month:0:1} == 0 )); then month=${month:1:1}; fi
                                                                                                                                       
day=$((day-1))
# First day of the year  
if ((day==0)); then
    month=$((month-1))
    if ((month==0)); then
        year=$((year-1))
        month=12
    fi
    last_day_of_month=$((((62648012>>month*2&3)+28)+(month==2&&(year%4==0&&(year%100!=0||year%400==0)))))
    day=$last_day_of_month
fi
if ((day<10)); then day="0"$day; fi
if ((month<10)); then month="0"$month; fi
yesterday="$year$month$day"
echo $yesterday
 