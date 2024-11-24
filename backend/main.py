from fastapi import FastAPI, HTTPException, Depends
import mysql.connector
from pydantic import BaseModel
from typing import List

# MySQL connection settings
DATABASE_CONFIG = {
    'host': 'localhost',
    'user': 'username',
    'password': 'password',
    'database': 'audit_db',
}

# Initialize FastAPI app
app = FastAPI()

# Pydantic model to define the expected request body for creating a new patient
class PatientCreate(BaseModel):
    patient_id: str
    height: str
    weight: str
    bmi: str
    bmi_score: int

# Function to create a connection to the MySQL database
def get_db():
    connection = mysql.connector.connect(**DATABASE_CONFIG)
    try:
        yield connection
    finally:
        connection.close()

# POST method to create a new patient
@app.post("/patient")
async def create_patient(patient: PatientCreate, db = Depends(get_db)):
    cursor = db.cursor()
    query = """
        INSERT INTO nutritional_screening (patient_id, height, weight, bmi, bmi_score)
        VALUES (%s, %s, %s, %s, %s)
    """
    values = (patient.patient_id, patient.height, patient.weight, patient.bmi, patient.bmi_score)
    
    try:
        cursor.execute(query, values)
        db.commit()  # Commit the transaction
        return {"message": "Patient created successfully", "patient_id": patient.patient_id}
    except mysql.connector.Error as err:
        db.rollback()  # Rollback in case of error
        raise HTTPException(status_code=500, detail=f"Database error: {err}")
    finally:
        cursor.close()

# GET method to retrieve patient details by patient_id
@app.get("/patient/{patient_id}")
async def get_patient(patient_id: str, db = Depends(get_db)):
    cursor = db.cursor(dictionary=True)
    query = """
        SELECT patient_id, height, weight, bmi, bmi_score
        FROM nutritional_screening
        WHERE patient_id = %s
    """
    try:
        cursor.execute(query, (patient_id,))
        patient = cursor.fetchone()
        if patient is None:
            raise HTTPException(status_code=404, detail="Patient not found")
        return patient
    except mysql.connector.Error as err:
        raise HTTPException(status_code=500, detail=f"Database error: {err}")
    finally:
        cursor.close()

