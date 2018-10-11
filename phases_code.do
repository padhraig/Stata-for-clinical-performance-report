capture log close
log using phases_analysis, replace text

// phases.do
// OBJECTIVE: Create monthly SFH report
// PROJECT: SFH Phases performance metrics with Dr. sarah mclean
// Padhraig Ryan  3march2018

version 13.0
clear all
macro drop _all
set linesize 160


************************************************ STEP 1: number of patients
include phases_number_of_px.doi

************************************************ STEP 1-2: AGE // SEX // DIAGNOSIS.
 
include phases_demograph.doi



************************************************ STEP 2: consultations per patient (TOTAL AND BY SITE)
include phases_consultations_per_px.doi

************************************************************************************************************************************************
************************************************ RESULTS LOG for steps 1&2. I.E. "phases_results"
************************************************************************************************************************************************

include phases_results_step1to2.doi


************************************************************************************************************************************************
************************************************************************************************************************************************

capture log close
************************************************ STEP 3: phases of illness
include phases_of_illness.doi 


************************************************ STEP 4:  Total Problem severity score & mean pain/other/spiritual/carer

********************************************************************* MEAN SCORE: PAIN / other / spiritual:
include phases_problemX4.doi

********************************************************************* SYMPTOMS
include phases_symptoms.doi


************************************************************************************************************************************************
************************************************ RESULTS STEPS 3-4:  ************************************************************************************************
************************************************************************************************************************************************

log close

quietly {
log using phases_results, append text

include phases_results_step3to4.doi

log close
	}
	*

log using phases_analysis, append text



************************************************************************************************************************************************
************************************************************************************************************************************************


************************************************ STEP 5: number of consultations (and mean per patient)
include phases_num_consults.doi

************************************************ STEP 6: setting
include phases_setting.doi

************************************************ STEP 7: visit by hcp (nurse / doctor etc)
include phases_visits_hcp.doi

************************************************ STEP 8: Functional status.
include phases_func_status.doi

************************************************ STEP 9: HCP stress
include phases_hcp_stress.doi

************************************************ STEP 10: VISIT DURATION
include phases_visit_duration.doi

************************************************************************************************************************************************
************************************************ RESULTS STEPS 5-10:  ************************************************************************************************
************************************************************************************************************************************************

log close

quietly {
log using phases_results, append text

include phases_results_step5to10.doi

log close
	}
	*

log using phases_analysis, append text

************************************************************************************************************************************************
************************************************************************************************************************************************

************************************************ STEP 11: "length of stay" los in cpc --- i.e. days in service
include phases_days_in_service.doi

************************************************************************************************************************************************
************************************************ RESULTS STEP 11.  ************************************************************************************************
************************************************************************************************************************************************


log close
quietly {
log using phases_results, append text
			include phases_results_step11.doi
log close
	}
	*

log using phases_analysis, append text


************************************************************************************************************************************************
************************************************************************************************************************************************
************************************************ STEP 12: days in unstable phase [WITH RESULTS]

include phases_days_unstable.doi


************************************************ STEP 13: Percentage of patients with moderate or severe physical symptoms (2 -3 / 3) at the beginning 
*************************************************** 	of phase who have absent or mild symptoms (0-1 /3) at the end of the phase.
***************************************************  	x4 categories  =  pain // other // spirit // carer
***************************************************  [WITH RESULTS]

include phases_dropfromhigh.doi


************************************************ STEP 14: Percentage of patients with absent / mild physical symptoms (0-1 / 3) at the beginning 
*************************************************** 	of the phase who stay that way (0-1 / 3)
***************************************************    x4 categories  =  pain // other // spirit // carer
***************************************************  [WITH RESULTS]

include phases_staylow.doi



exit
