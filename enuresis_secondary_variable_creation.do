generate enuretic = .
replace enuretic = 1 if agedry<5 & wetlast6==1
replace enuretic = 2 if agedry==5 | wetlast6>1
label values enuretic noyes

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
