from .connection import get_connection

# Insert Patient Profile
def insert_patient_profile(patient_id, evaluation_date, admission_date, discharge_date, diagnosis, lifestyle):
    conn = get_connection()
    cursor = conn.cursor()
    query = """
        INSERT INTO patientprofile (patient_id, date_of_admission, date_of_discharge, date_of_evaluation, medical_diagnosis, lifestyle)
        VALUES (%s, %s, %s, %s, %s, %s)
    """
    values = (patient_id, admission_date, discharge_date, evaluation_date, diagnosis, lifestyle)
    try:
        cursor.execute(query, values)
        conn.commit()
        return {"status": "success", "message": "Patient profile saved successfully!"}
    except Exception as e:
        conn.rollback()
        return {"status": "error", "message": str(e)}
    finally:
        cursor.close()
        conn.close()

# Retrieve Patient Profiles
def get_all_patient_profiles():
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    query = "SELECT * FROM patientprofile"
    cursor.execute(query)
    results = cursor.fetchall()
    cursor.close()
    conn.close()
    return results

# Update Patient Profile
def update_patient_profile(patient_id, diagnosis, lifestyle):
    conn = get_connection()
    cursor = conn.cursor()
    query = """
        UPDATE patientprofile SET medical_diagnosis = %s, lifestyle = %s WHERE patient_id = %s
    """
    values = (diagnosis, lifestyle, patient_id)
    try:
        cursor.execute(query, values)
        conn.commit()
        return {"status": "success", "message": "Patient profile updated successfully!"}
    except Exception as e:
        conn.rollback()
        return {"status": "error", "message": str(e)}
    finally:
        cursor.close()
        conn.close()

# Delete Patient Profile
def delete_patient_profile(patient_id):
    conn = get_connection()
    cursor = conn.cursor()
    query = "DELETE FROM patientprofile WHERE patient_id = %s"
    try:
        cursor.execute(query, (patient_id,))
        conn.commit()
        return {"status": "success", "message": "Patient profile deleted successfully!"}
    except Exception as e:
        conn.rollback()
        return {"status": "error", "message": str(e)}
    finally:
        cursor.close()
        conn.close()
