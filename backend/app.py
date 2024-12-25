from flask import Flask, request, jsonify, render_template, redirect, url_for
from flask_mysqldb import MySQL
import datetime

# Initialize Flask App
app = Flask(__name__, static_folder='../frontend/static', template_folder='../frontend/templates')

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

@app.route('/home')
def home():
    return render_template('home.html')

@app.route('/get_patient/<patient_id>', methods=['GET'])
def get_patient(patient_id):
    try:
        # Create a cursor object
        cursor = mysql.connection.cursor()

        # Fetch patient data from the database
        query = "SELECT * FROM audit_patientprofile WHERE patient_id = %s"
        cursor.execute(query, (patient_id,))
        patient = cursor.fetchone()

        # Close the cursor
        cursor.close()

        if patient:
            # Convert the result to a dictionary
            patient_data = {
                'patient_id': patient[1],
                'age': patient[2],
                'gender': patient[3],
                'date_of_admission': patient[4],
                'medical_diagnosis': patient[5],
                'lifestyle': patient[6]
            }
            return jsonify(patient_data), 200
        else:
            return jsonify({'error': 'Patient not found'}), 404

    except Exception as e:
        print("Error:", str(e))  # Print error for debugging
        return jsonify({'error': str(e)}), 500

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
# Rename the second function if needed
@app.route('/get_patient_info/<patient_id>', methods=['GET'])
def get_patient_info(patient_id):
    try:
        cursor = mysql.connection.cursor()
        query = "SELECT * FROM audit_patientprofile WHERE patient_id = %s"
        cursor.execute(query, (patient_id,))
        patient = cursor.fetchone()
        cursor.close()

        if patient:
            patient_data = {
                'audit_pp_id': patient[0],
                'action': patient[1],
                'patient_id': patient[2],
                'age': patient[3],
                'sex': patient[4],
                'date_of_admission': patient[5],
                'date_of_discharge': patient[6],
                'date_of_evaluation': patient[7],
                'medical_diagnosis': patient[8],
                'lifestyle': patient[9],
                'created_datetime': patient[10],
                'updated_datetime': patient[11]
            }
            return jsonify(patient_data), 200
        else:
            return jsonify({'error': 'Patient not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
@app.route('/submit_nutritional_screening', methods=['POST'])
def submit_nutritional_screening():
    try:
        # Retrieve form data from the frontend (this is POST data from the form)
        data = request.json  # assuming the frontend sends a JSON object
        patient_id = data.get('patient_id')
        height = data.get('height')
        weight = data.get('weight')
        bmi = data.get('bmi')
        bmi_score = data.get('bmi_score')
        weight_loss = data.get('weight_loss')
        chronic_disease = data.get('chronic_disease')
        reduced_food = data.get('reduced_food')
        biochemical_parameter = data.get('biochemical_parameter')

        # Create cursor object
        cursor = mysql.connection.cursor()

        # Insert into nutritional screening table
        insert_query = """
            INSERT INTO audit_nutritional_screening (patient_id, height, weight, bmi, bmi_score, weight_loss,
                                                      chronic_disease, reduced_food, biochemical_parameter, audit_ns_created_datetime)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (
            patient_id, height, weight, bmi, bmi_score, weight_loss, chronic_disease, reduced_food, biochemical_parameter,
            datetime.datetime.now()
        ))
        mysql.connection.commit()
        cursor.close()

        return jsonify({'message': 'Nutritional screening data successfully submitted!'}), 200

    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({'error': str(e)}), 500
@app.route('/submit_conclusion', methods=['POST'])
def submit_conclusion():
    try:
        # Retrieve conclusion form data (from frontend)
        data = request.json
        patient_id = data.get('patient_id')
        total_score = data.get('total_score')
        assessment_plan = data.get('assessment_plan')
        dietitian_note = data.get('dietitian_note')
        intervention_plan = data.get('intervention_plan')

        # Create cursor object
        cursor = mysql.connection.cursor()

        # Insert into conclusion table
        insert_query = """
            INSERT INTO audit_conclusion_table (patient_id, total_score, assessment_plan, dietitian_note, intervention_plan, audit_ns_created_datetime)
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (
            patient_id, total_score, assessment_plan, dietitian_note, intervention_plan, datetime.datetime.now()
        ))
        mysql.connection.commit()
        cursor.close()

        return jsonify({'message': 'Conclusion data successfully submitted!'}), 200

    except Exception as e:
        print(f"Error: {str(e)}")
        return jsonify({'error': str(e)}), 500    

if __name__ == '__main__':
    app.run(debug=True)
    