**Making sure missing variables are consistently filled in for wetX variables**
replace wet11 = 2 if wet11==. & age>10 & since10==1 & wetlast6==1
replace wet12 = 2 if wet12==. & age>11 & since10==1 & wetlast6==1
replace wet13 = 2 if wet13==. & age>12 & since10==1 & wetlast6==1
replace wet14 = 2 if wet14==. & age>13 & since10==1 & wetlast6==1
replace wet15 = 2 if wet15==. & age>14 & since10==1 & wetlast6==1
replace wet16 = 2 if wet16==. & age>15 & since10==1 & wetlast6==1

**Constructing enuretic variable**
generate enuretic = .
replace enuretic = 1 if wetlast6==1
replace enuretic = 2 if wetlast6>1 & wetlast6<6
replace enuretic = 1 if wetlast6==. & age==11 & wet11==2
replace enuretic = 2 if wetlast6==. & age==11 & wet11==1
replace enuretic = 1 if wetlast6==. & age==12 & wet12==2
replace enuretic = 2 if wetlast6==. & age==12 & wet12==1
replace enuretic = 1 if wetlast6==. & age==13 & wet13==2
replace enuretic = 2 if wetlast6==. & age==13 & wet13==1
replace enuretic = 1 if wetlast6==. & age==14 & wet14==2
replace enuretic = 2 if wetlast6==. & age==14 & wet14==1
replace enuretic = 1 if wetlast6==. & age==15 & wet15==2
replace enuretic = 2 if wetlast6==. & age==15 & wet15==1
replace enuretic = 1 if wetlast6==. & age==16 & wet16==2
replace enuretic = 2 if wetlast6==. & age==16 & wet16==1
label values enuretic noyes

generate everenuretic = enuretic
replace everenuretic = 2 if age==12 & wet11==1
replace everenuretic = 2 if age==13 & wet11==1 
replace everenuretic = 2 if age==13 & wet12==1
replace everenuretic = 2 if age==14 & wet11==1 
replace everenuretic = 2 if age==14 & wet12==1
replace everenuretic = 2 if age==14 & wet13==1 
replace everenuretic = 2 if age==15 & wet11==1
replace everenuretic = 2 if age==15 & wet12==1
replace everenuretic = 2 if age==15 & wet13==1
replace everenuretic = 2 if age==15 & wet14==1
replace everenuretic = 2 if age==16 & wet11==1
replace everenuretic = 2 if age==16 & wet12==1
replace everenuretic = 2 if age==16 & wet13==1
replace everenuretic = 2 if age==16 & wet14==1
replace everenuretic = 2 if age==16 & wet15==1
replace everenuretic = 2 if age>16 & wet11==1
replace everenuretic = 2 if age>16 & wet12==1
replace everenuretic = 2 if age>16 & wet13==1
replace everenuretic = 2 if age>16 & wet14==1
replace everenuretic = 2 if age>16 & wet15==1
replace everenuretic = 2 if age>16 & wet16==1
label values everenuretic noyes

**Checking for consistency of bedwetting answers**

list id age enuretic agedry since10 wetlast6
*Subject 27 said they were consistetly dry at age 5-7 but still wet the bed at least once per year since age 10
*  This is technically a valid response depending on interpretation

list id age if wet11==1 & wet12==2
list id age if wet11==2 & wet12==1
list id age if wet11==2 & wet13==1
list id age if wet11==2 & wet14==1
list id age if wet11==2 & wet15==1
list id age if wet11==2 & wet16==1
list id age if wet12==2 & wet13==1
list id age if wet12==2 & wet14==1
list id age if wet12==2 & wet15==1
list id age if wet12==2 & wet16==1
list id age if wet13==2 & wet14==1
list id age if wet13==2 & wet15==1
list id age if wet13==2 & wet16==1
list id age if wet14==2 & wet15==1
list id age if wet14==2 & wet16==1
list id age if wet15==2 & wet16==1
*No one reported regression back into wetting the bed once they stopped at a younger age

list id age agedry wetlast6 enuretic if agedry<4 & wetlast6>1
*Again, subject 27 said they were consistetly dry at age 5-7 but still wet the bed 3-4 nights per month in the last 6 months
*  This too is technically a valid response, but I will drop this subject in sensitivity analysis

list id age agedry wetlast6 enuretic if agedry>3 & wetlast6==1
*Responses for subjects 6, 14, 21, 172, 184, 193, 196, 197, and 199 are logically valid
*Subject 18 reported still not consistently dry at night, but never wet the bed in the last 6 months
*  Marking enuretic value as missing for subject 18
replace enuretic = . if id==18

list id age wet11 wetlast6 enuretic if age==11 & wet11==1 & wetlast6==1
list id age wet11 wetlast6 enuretic if age==11 & wet11==2 & wetlast6>1
list id age wet12 wetlast6 enuretic if age==12 & wet12==1 & wetlast6==1
list id age wet12 wetlast6 enuretic if age==12 & wet12==2 & wetlast6>1
*Subject 166 did not wet the bed at age 12 and is listed as not enuretic because he is 12
replace enuretic=1 if id==166
list id age wet13 wetlast6 enuretic if age==13 & wet13==1 & wetlast6==1
*Subject 28 is age 13, wet the bed more than one time at age 13, but not in the last six months
*  Technically valid, but I will drop in sensitivity analysis
list id age agedry wet13 wetlast6 enuretic if age==13 & wet13==2 & wetlast6>1
* Subject 22 is 13, did not wet the bed more than once at age 13, but wet the bed 3-4 nights per month in the last six months
*  Setting enuretic value as missing for subject 22
replace enuretic = . if id==22
list id age wet14 wetlast6 enuretic if age==14 & wet14==1 & wetlast6==1
list id age wet14 wetlast6 enuretic if age==14 & wet14==2 & wetlast6>1
list id age wet15 wetlast6 enuretic if age==15 & wet15==1 & wetlast6==1
list id age wet15 wetlast6 enuretic if age==15 & wet15==2 & wetlast6>1
list id age wet16 wetlast6 enuretic if age==16 & wet16==1 & wetlast6==1
list id age agedry wet16 wetlast6 enuretic if age==16 & wet16==2 & wetlast6>1
*Subject 1 is age 16, Did not wet the bed more than once at age 16, but wet the bed 1-2 nights per week in the last six months
*  Setting enuretic value as missing for subject 1
replace enuretic = . if id==1

list id age wet11 wet12 wetlast6 everenuretic if age==12 & wetlast6==1 & wet11==1
list id age wet12 wet13 wetlast6 everenuretic if age==13 & wetlast6==1 & wet12==1
*As commented above, subject 28 is age 13, wet the bed more than one time at age 13, but not in the last six months
*  Technically valid, but I will drop in sensitivity analysis
list id age wet13 wet14 wetlast6 everenuretic if age==14 & wetlast6==1 & wet13==1
list id age wet14 wet15 wetlast6 everenuretic if age==15 & wetlast6==1 & wet14==1
list id age wet15 wet16 wetlast6 everenuretic if age==16 & wetlast6==1 & wet15==1
list id age wet16 wetlast6 everenuretic if age==17 & wetlast6==1 & wet16==1

generate _feeldown = feeldown
generate _anhedonia = anhedonia
generate _troublesleep = troublesleep
generate _eating = eating
generate _littleenergy = littleenergy
generate _selfbad = selfbad
generate _concentrate = concentrate
generate _psychomotor = psychomotor
generate _suicidal = suicidal

replace _feeldown = 0 if feeldown==.
replace _anhedonia = 0 if anhedonia==.
replace _troublesleep = 0 if troublesleep==.
replace _eating = 0 if eating==.
replace _littleenergy = 0 if littleenergy==.
replace _selfbad = 0 if selfbad==.
replace _concentrate = 0 if concentrate==.
replace _psychomotor = 0 if psychomotor==.
replace _suicidal = 0 if suicidal==.

generate phq9 = _feeldown + _anhedonia + _troublesleep + _eating + _littleenergy + _selfbad + _concentrate + _psychomotor + _suicidal
label variable phq9 "PHQ-9 score"

generate phq9interpret = .
label variable phq9interpret "Interpretation of PHQ-9 Score"
replace phq9interpret = 1 if phq9<5
replace phq9interpret = 2 if phq9>4 & phq9<10
replace phq9interpret = 3 if phq9>9 & phq9<15
replace phq9interpret = 4 if phq9>14 & phq9<20
replace phq9interpret = 5 if phq9>19
label define phq9interpret 1 "Minimal depression" 2 "Mild depression" 3 "Moderate depression" 4 "Moderately severe depression" 5 "Severe depression"
label values phq9interpret phq9interpret

generate putatdepressIV = .
label variable putatdepressIV "Putatively depressed based on PHQ-9 Score according to DSM-IV"
replace putatdepressIV = 1 if phq9<12
replace putatdepressIV = 2 if phq9>11
label values putatdepressIV noyes

generate estmoodIV = .
label variable estmoodIV "Estimated prevalence of mood disorders in study population based on DSM-IV estimation"
replace estmoodIV = 1 if mooddisorder==1 & putatdepressIV==1
replace estmoodIV = 2 if mooddisorder==2 | putatdepressIV==2
label values estmoodIV noyes

generate putatdepressV = .
label variable putatdepressV "Putatively depressed based on PHQ-9 Score according to DSM-V"
replace putatdepressV = 1 if phq9<5
replace putatdepressV = 1 if phq9>4 & _feeldown==0 & _anhedonia==0
replace putatdepressV = 2 if phq9>4 & _feeldown>0
replace putatdepressV = 2 if phq9>4 & _anhedonia>0
label values putatdepressV noyes

generate estmoodV = .
label variable estmoodV "Estimated prevalence of mood disorders in study population based on DSM-V estimation"
replace estmoodV = 1 if mooddisorder==1 & putatdepressV==1
replace estmoodV = 2 if mooddisorder==2 | putatdepressV==2
label values estmoodV noyes

generate _eversnore = eversnore
generate _snoreover50 = snoreover50
generate _snoreloud = snoreloud
generate _heavybreath = heavybreath
generate _troublebreath = troublebreath

replace _eversnore = 0 if eversnore==1 | eversnore==. | eversnore==3
replace _snoreover50 = 0 if snoreover50==1 | snoreover50==. | snoreover50==3
replace _snoreloud = 0 if snoreloud==1 | snoreloud==. | snoreloud==3
replace _heavybreath = 0 if heavybreath==1 | heavybreath==. | heavybreath==3
replace _troublebreath = 0 if troublebreath==1 | troublebreath==. | troublebreath==3

replace _eversnore = 1 if eversnore==2
replace _snoreover50 = 1 if snoreover50==2
replace _snoreloud = 1 if snoreloud==2
replace _heavybreath = 1 if heavybreath==2
replace _troublebreath = 1 if troublebreath==2

generate disordsleepscore = _eversnore + _snoreover50 + _snoreloud + _heavybreath + _troublebreath
label variable disordsleepscore "Composite score of disordered sleep behaviors"

generate disorderedsleep = .
label variable disorderedsleep "Presence of 3 or more sleep disordered behaviors"
replace disorderedsleep = 1 if disordsleepscore<3
replace disorderedsleep = 2 if disordsleepscore>2
label values disorderedsleep noyes

generate _unrefresh = unrefresh
generate _sleepiness = sleepiness
generate _sleepycomment = sleepycomment
generate _nap = nap

replace _unrefresh = 0 if unrefresh==1 | unrefresh==. | unrefresh==3
replace _sleepiness = 0 if sleepiness==1 | sleepiness==. | sleepiness==3
replace _sleepycomment = 0 if sleepycomment==1 | sleepycomment==. | sleepycomment==3
replace _nap = 0 if nap==1 | nap==. | nap==3

replace _unrefresh = 1 if unrefresh==2
replace _sleepiness = 1 if sleepiness==2
replace _sleepycomment = 1 if sleepycomment==2
replace _nap = 1 if nap==2

generate sleepdepscore = _unrefresh + _sleepiness + _sleepycomment + _nap
label variable sleepdepscore "Composite score of sleep deprivation indicators"

generate sleepdepriv = .
label variable sleepdepriv "Presence of 2 or more indicators of sleep deprivation"
replace sleepdepriv = 1 if sleepdepscore<2
replace sleepdepriv = 2 if sleepdepscore>1
label values sleepdepriv noyes

generate constipated = .
label variable constipated "Having a bowel movement 2 times a week or less or the report of hard or very hard stools."
replace constipated = 1 if poopfreq>1 & poopcharacter>2
replace constipated = 2 if poopfreq==1 | poopcharacter<3
label values constipated noyes
