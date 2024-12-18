from flask import Flask, request, jsonify
from fastapi import FastAPI, HTTPException
from fastapi.responses import JSONResponse
from threading import Thread
import mysql.connector
from mysql.connector import pooling

# Flask and FastAPI instances
flask_app = Flask(__name__)
fastapi_app = FastAPI()

# Database connection pool
db_config = {
    "pool_name": "mypool",
    "pool_size": 32,
    "host": "localhost",
    "user": "your_user",
    "password": "your_password",
    "database": "your_database",
    "port": 3306,
    "auth_plugin": "mysql_native_password",
    "charset": "utf8",
}
connection_pool = pooling.MySQLConnectionPool(**db_config)

# Utility function to get DB connection
def get_connection():
    return connection_pool.get_connection()

### FLASK API ###
@flask_app.route('/add-patient', methods=['POST'])
def add_patient():
    """Add a new patient and calculate BMI."""
    data = request.json
    patient_id = data.get("patient_id")
    name = data.get("name")
    age = data.get("age")
    

    if not all([patient_id, name, age, height, weight]):
        return jsonify({"error": "Missing required fields"}), 400

    try:
        connection = get_connection()
        cursor = connection.cursor()

        # Calculate BMI
        bmi = round(weight / ((height / 100) ** 2), 2)

        # Insert patient record
        insert_query = """
            INSERT INTO patients (patient_id, name, age,)
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (patient_id, name, age, height, weight, bmi))
        connection.commit()

        return jsonify({"message": "Patient added successfully", "bmi": bmi}), 201
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)}), 500
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()


@flask_app.route('/get-bmi/<int:patient_id>', methods=['GET'])
def get_bmi(patient_id):
    """Retrieve the BMI score of a patient."""
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)

        query = "SELECT bmi FROM patients WHERE patient_id = %s"
        cursor.execute(query, (patient_id,))
        result = cursor.fetchone()

        if not result:
            return jsonify({"error": "Patient not found"}), 404

        return jsonify({"patient_id": patient_id, "bmi": result["bmi"]}), 200
    except mysql.connector.Error as err:
        return jsonify({"error": str(err)}), 500
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()


### FASTAPI ###
@fastapi_app.post("/update-patient/")
async def update_patient(patient_id: int, name: str = None, age: int = None, height: float = None, weight: float = None):
    """Update patient details."""
    try:
        connection = get_connection()
        cursor = connection.cursor()

        # Update patient details
        updates = []
        params = []

        if name:
            updates.append("name = %s")
            params.append(name)
        if age:
            updates.append("age = %s")
            params.append(age)
        if height:
            updates.append("height = %s")
            params.append(height)
        if weight:
            updates.append("weight = %s")
            params.append(weight)

        if not updates:
            raise HTTPException(status_code=400, detail="No data to update")

        query = f"UPDATE patients SET {', '.join(updates)} WHERE patient_id = %s"
        params.append(patient_id)

        cursor.execute(query, tuple(params))
        connection.commit()

        if cursor.rowcount == 0:
            raise HTTPException(status_code=404, detail="Patient not found")

        return {"message": "Patient details updated successfully"}
    except mysql.connector.Error as err:
        raise HTTPException(status_code=500, detail=str(err))
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()


@fastapi_app.get("/patient-info/{patient_id}")
async def get_patient_info(patient_id: int):
    """Retrieve full details of a specific patient."""
    try:
        connection = get_connection()
        cursor = connection.cursor(dictionary=True)

        query = "SELECT * FROM patients WHERE patient_id = %s"
        cursor.execute(query, (patient_id,))
        result = cursor.fetchone()

        if not result:
            raise HTTPException(status_code=404, detail="Patient not found")

        return JSONResponse(content=result)
    except mysql.connector.Error as err:
        raise HTTPException(status_code=500, detail=str(err))
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()


### RUNNING BOTH SERVERS ###
def run_flask():
    flask_app.run(port=5000, debug=True)


def run_fastapi():
    import uvicorn
    uvicorn.run(fastapi_app, host="127.0.0.1", port=8000)


if __name__ == "__main__":
    # Run Flask and FastAPI in parallel
    flask_thread = Thread(target=run_flask)
    fastapi_thread = Thread(target=run_fastapi)

    flask_thread.start()
    fastapi_thread.start()

    flask_thread.join()
    fastapi_thread.join()
