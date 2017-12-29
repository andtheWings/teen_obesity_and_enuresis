generate agedry_since10 = .
generate agedry_wetlast6 = .
generate wetage_wetlast6 = .

replace agedry_since10 = 1 if agedry<4 & since10==2 

replace agedry_wetlast6 = 1 if agedry<4 & wetlast6>1
replace agedry_wetlast6 = 1 if agedry>3 & wetlast6==1

replace wetage_wetlast6 = 1 if age==11 & wet11==1 & wetlast6==1
replace wetage_wetlast6 = 1 if age==11 & wet11==2 & wetlast6>1
replace wetage_wetlast6 = 1 if age==12 & wet12==1 & wetlast6==1
replace wetage_wetlast6 = 1 if age==12 & wet12==2 & wetlast6>1
replace wetage_wetlast6 = 1 if age==13 & wet13==1 & wetlast6==1
replace wetage_wetlast6 = 1 if age==13 & wet13==2 & wetlast6>1
replace wetage_wetlast6 = 1 if age==14 & wet14==1 & wetlast6==1
replace wetage_wetlast6 = 1 if age==14 & wet14==2 & wetlast6>1
replace wetage_wetlast6 = 1 if age==15 & wet15==1 & wetlast6==1
replace wetage_wetlast6 = 1 if age==15 & wet15==2 & wetlast6>1
replace wetage_wetlast6 = 1 if age==16 & wet16==1 & wetlast6==1
replace wetage_wetlast6 = 1 if age==16 & wet16==2 & wetlast6>1

list id age if age<10 | age>18
list id bmipercent if bmipercent<95
list id if agedry_since10==1
list id if agedry_wetlast6==1
list id if wetage_wetlast6==1
