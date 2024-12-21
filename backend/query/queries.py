quries_to_insert__data={

    "pat_prof":
    "insert into patientprofile (patient_id , age, sex,date_of_admission, date_of_discharge, date_of_evaluation,medical_diagnosis,lifestyle) values(%s,%s,%s,%s,%s,%s,%s,%s)"

        ,"nutri_screen":
        "insert into nutritional_screening (patient_id ,height, weight,bmi, bmi_score, weight_loss,chronic_disease,reduced_food, biochemical_parameter) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)"

        ,"conclusion":
        "insert into conclusion_table (patient_id ,ns_id, total_score, dietitian_note,intervention_plan) values(%s,%s,%s,%s,%s)"

        # ,"nutri_reg":
        # "insert into nutri_register (nutri_id ,password, user_role_id, name, phone_num, mail_id, gender ) values(%s,%s,%s,%s,%s,%s,%s)"
        
}

quries_to_fetch_all_data={

    "pat_prof":"SELECT * FROM patientprofile where patient_id = %s"

    ,"nutri_screen":"SELECT * FROM nutritional_screening where patient_id = %s"

    ,"conclusion":"SELECT * FROM conclusion_table where patient_id = %s"

}

quries_to_update_data = {

    "pat_prof": 
    "UPDATE patientprofile SET age = %s, sex = %s, date_of_admission = %s, date_of_discharge = %s, date_of_evaluation = %s, medical_diagnosis = %s, lifestyle = %s WHERE patient_id = %s",

    "nutri_screen": 
    "UPDATE nutritional_screening SET height = %s, weight = %s, bmi = %s, bmi_score = %s, weight_loss = %s, chronic_disease = %s, reduced_food = %s, biochemical_parameter = %s WHERE patient_id = %s",

    "conclusion": 
    "UPDATE conclusion_table SET ns_id = %s, total_score = %s, dietitian_note = %s, intervention_plan = %s WHERE patient_id = %s"

    ,"nutri_reg": 
    "UPDATE nutri_register SET password = %s, user_role_id = %s, name = %s, phone_num = %s, mail_id = %s, gender = %s WHERE nutri_id = %s"

}

quries_to_delete_data = {
    "pat_prof": 
    "DELETE FROM patientprofile WHERE patient_id = %s",

    "nutri_screen": 
    "DELETE FROM nutritional_screening WHERE patient_id = %s",

    "conclusion": 
    "DELETE FROM conclusion_table WHERE patient_id = %s AND ns_id = %s",
    
    "nutri_reg":
    "DELETE FROM nutri_register WHERE nutri_id = %s"

}


data_from_patientprofile = [
    "select patient_id , sex, date_of_admission from patientprofile p where patient_id = %s" 
]

data_from_nutri_screen = [
    "select nutri_id from nutri_register where nutri_id = %s"
]

data_for_progress = [
    
    '''
    SELECT nr.nutri_id, pp.date_of_evaluation,ns.bmi, ns.bmi_score,ns.weight_loss, ns.chronic_disease, ns.reduced_food, ns.biochemical_parameter, ct.total_score, ct.dietitian_note, ct.intervention_plan
     FROM dietician_info.nutri_register nr CROSS JOIN screening_tool.patientprofile pp LEFT JOIN screening_tool.nutritional_screening ns ON pp.patient_id = ns.patient_id LEFT JOIN screening_tool.conclusion_table ct ON pp.patient_id = ct.patient_id AND ns.ns_id = ct.ns_id 
     WHERE nr.nutri_id = %s AND pp.patient_id = %s
    '''
]








   





  