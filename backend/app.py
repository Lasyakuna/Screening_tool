from flask import Flask, request, jsonify, render_template, redirect, url_for
from flask_mysqldb import MySQL
import datetime

# Initialize Flask App
app = Flask(__name__, template_folder='../frontend/templates')

# Database Configuration
app.config['MYSQL_HOST'] = 'localhost'  # Replace with your MySQL host
app.config['MYSQL_USER'] = 'root'  # Replace with your MySQL username
app.config['MYSQL_PASSWORD'] = 'root@123'  # Replace with your MySQL password
app.config['MYSQL_DB'] = 'Screening_tool'  # Replace with your database name

# Initialize MySQL
mysql = MySQL(app)

@app.route('/')
def index():
    # Redirect to the patient registration page
    return redirect(url_for('patient_register'))

@app.route('/patient_register')
def patient_register():
    # Render the patient registration form
    return render_template('patient_register.html')
@app.route('/register', methods=['POST'])
def register():
    try:
        # Retrieve form data
        patient_id = request.form['patient-id']
        age = request.form['age']
        gender = request.form['gender']
        admission_date = request.form['addmissiondate']
        diagnosis = request.form['diagnosis']
        lifestyle = request.form['lifestyle']

        print("Form Data Received:")
        print(f"Patient ID: {patient_id}, Age: {age}, Gender: {gender}, Admission Date: {admission_date}, Diagnosis: {diagnosis}, Lifestyle: {lifestyle}")

        # Create a cursor object
        cursor = mysql.connection.cursor()

        # Insert data into audit_patientprofile table
        insert_query = """
            INSERT INTO audit_patientprofile (
                audit_pp_action, patient_id, age, sex, date_of_admission, medical_diagnosis, lifestyle
            ) VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, ('insert', patient_id, age, gender, admission_date, diagnosis, lifestyle))
        mysql.connection.commit()
        print("Inserted into audit_patientprofile table")

        # Insert into audit_nutritional_screening
        screening_query = """
            INSERT INTO audit_nutritional_screening (
                audit_ns_action, patient_id, audit_ns_created_datetime
            ) VALUES (%s, %s, %s)
        """
        cursor.execute(screening_query, ('insert', patient_id, datetime.datetime.now()))
        mysql.connection.commit()
        print("Inserted into audit_nutritional_screening table")

        # Close the cursor
        cursor.close()

        # Success message
        return jsonify({'message': f'Registration successful for Patient ID: {patient_id}'}), 200

    except Exception as e:
        print("Error:", str(e))  # Print error for debugging
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
    