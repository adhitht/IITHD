from typing import Union
from fastapi import FastAPI
import os
import psycopg2
from psycopg2.extras import RealDictCursor
from datetime import datetime


DATABASE = os.getenv('DATABASE')
POSTGRES_USER = os.getenv('POSTGRES_USER')
POSTGRES_PASS = os.getenv('POSTGRES_PASS')
POSTGRES_HOST = os.getenv('POSTGRES_HOST')

conn = psycopg2.connect(
    database=DATABASE,
    user=POSTGRES_USER,
    password=POSTGRES_PASS,
    host=POSTGRES_HOST,
    cursor_factory=RealDictCursor,
)
cur = conn.cursor()
 

app = FastAPI()

# http://127.0.0.1:8000/
@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/events")
def get_events():
    cur.execute("SELECT * FROM events ORDER BY time")
    events = cur.fetchall() 
    result = []
    print(events)
    for i in events:
        temp = {}
        temp['shortname'] = i['shortname']
        temp['title'] = i['title']
        temp['time'] = i['time'].strftime("%I:%M %p")
        temp['date'] = i['date'].strftime("%d-%m-%Y")
        temp['color'] = i['color']
        result.append(temp)
    return result

@app.get("/events/today")
def get_events():
    cur.execute("SELECT * FROM events WHERE date = current_date")
    events = cur.fetchall() 
    result = []
    print(events)
    for i in events:
        temp = {}
        temp['shortname'] = i['shortname']
        temp['title'] = i['title']
        temp['time'] = i['time'].strftime("%I:%M %p")
        temp['date'] = i['date'].strftime("%d-%m-%Y")
        temp['color'] = i['color']
        result.append(temp)
    return result

@app.get("/feed")
def get_events():
    cur.execute("SELECT * FROM feed")
    events = cur.fetchall() 
    result = []
    for i in events:
        temp = {}
        temp['title'] = i['title']
        temp['organiser'] = i['organiser']
        temp['date'] = i['publish_date'].strftime("%d-%m-%Y")
        temp['description'] = i['description'].replace("\\","")
        try:
            temp['button'] = eval(i['buttons'])
        except:
            temp['button'] = ''
        temp['mddescription'] = i['mddescription'].replace("\\","")
        result.append(temp)
    return result

@app.get("/bus")
def get_events():
    result2 = {"Hostel Circle":{"Main Gate": ["07:30", "07:45", "08:00", "08:15", "08:30", "08:40", "08:50", "09:00", "09:10", "09:20", "09:30", "09:40", "09:50", "10:00", "10:10", "10:20", "10:30", "10:45", "11:00", "11:15", "11:40", "12:00", "12:30", "12:40", "12:50", "13:00", "13:10", "13:20", "13:30", "13:40", "13:50", "14:00", "14:10", "14:20", "14:30", "14:45", "15:00", "15:15", "15:30", "16:00", "16:10", "16:20", "16:30", "16:45", "17:00", "17:15", "17:30", "17:40", "17:50", "18:00", "18:10", "18:20", "18:30", "18:40", "18:50", "19:00", "19:10", "19:20", "19:30", "19:40", "19:50", "20:00", "20:10", "20:20", "20:30", "20:45", "21:00", "21:15", "21:40", "22:00", "22:30", "23:00", "23:15", "23:30", "23:45"] },"Main Gate": {"Hostel Circle": ["07:15", "07:30", "07:45", "08:00", "08:15", "08:30", "08:40", "08:50", "09:00", "09:10", "09:20", "09:30", "09:40", "09:50", "10:00", "10:10", "10:20", "10:30", "10:45", "11:00", "11:30", "11:50", "12:15", "12:30", "12:40", "12:50", "13:00", "13:10", "13:20", "13:30", "13:40", "13:50", "14:00", "14:10", "14:20", "14:30", "14:45", "15:00", "15:15", "15:30", "16:00", "16:10", "16:20", "16:30", "16:45", "17:00", "17:15", "17:30", "17:40", "17:50", "18:00", "18:10", "18:20", "18:30", "18:40", "18:50", "19:00", "19:10", "19:20", "19:30", "19:40", "19:50", "20:00", "20:10", "20:20", "20:30", "20:45", "21:00", "21:30", "21:50", "22:15", "22:30", "23:00", "23:15", "23:30"]}}
    return result2

@app.get("cab")
def get_cab():
    result = {"Hello":"World"}
    return result

# Testing Purpose
@app.get("/test/feed")
def get_test_feed():
    result = [{"title":"Recreational room registration form","organiser":"Director","date":"06-03-2023","description":"As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized","button":{"WAChat":"https://chat.whatsapp.com/I2l60BQ48OZ6NMmIscbDR9"},"mddescription":"As you are aware, we are bringing out the institute’s magazine (KIRIITH) every quarter. Each Issue of KIRIITH is dedicated to a particular thrust area at IITH, as summarized"},{"title":"Night Sky Observation Session !!","organiser":"Cepheid","date":"07-03-2023","description":"Hello everyone!! nWe are back again with the night sky observation session. Join us on Sunday for enjoying the magnificent views of the","button":"","mddescription":"      Hello everyone!! nWe are back again with the night sky observation session. Join us on Sunday for enjoying the magnificent views of the"},{"title":"Diesta team selection","organiser":"GS Gymkhana","date":"07-03-2023","description":"Diesta: The Inter-Departmental Sports and Cultural Events 2023 is scheduled soon, We invite nominations for the position of Departmental Representatives...","button":{"GSForm":"https://docs.google.com/forms/d/e/1FAIpQLSd3A141gqD3Z_RfFT9rgoLiktirHMa-WzIn8RMnFjqb9Vkgsw/viewform"},"mddescription":"Dear all,nHope this email finds you well. nDiesta: The Inter-Departmental Sports and Cultural Events 2023 is scheduled soon, We invite nominations for the position of Departmental Representatives for this event. Please fill out FORM 1 by 08-03-2023, 11:59 PM.nEligibility Criteria:nnThe candidate must be a regular, full-time registered student of the institute and should not be a distance/proximate education student.nThe Candidate should hold a CGPA of at least 6/10.nThe Candidate should not have attached any disciplinary actions by the Institute.nThe Candidate should be considered a positive role model, by the student community.nThe nomination of the candidate does not attract any negative feedback in writing from any faculty member or staff member of the Institute.nRoles and Responsibilities:nnShould lead and motivate your department to participate in the event.nResponsible for team selections for sports and cultural competitions.nAct as the point of reference between your department and the organizing committee.nShould act as the face of your department and ensure sportsmanship and fair play."}]
    return result

@app.get("/test/events")
def get_test_events():
    result = [{"shortname":"MA1240","title":"Math Foundation","time":"09:00 AM","date":"26-02-2023","color":"FFFFCDCD"},{"shortname":"MA1120","title":"Vector Calculus","time":"10:00 AM","date":"26-02-2023","color":"D7DBFF"},{"shortname":"Lambda","title":"Intro to Python","time":"11:00 AM","date":"26-02-2023","color":"FFD6FFE4"},{"shortname":"EP1100","title":"Modern Physics","time":"11:00 AM","date":"06-02-2023","color":"FFFFCDCD"},{"shortname":"Glitch","title":"Valorant Gaming Sesh","time":"10:00 PM","date":"26-02-2023","color":"FFC8F9"}]
    return result


@app.get("/test/cab")
def get_test_events():
    result = [
        {"startPoint":"IIT Hyderabad Campus",
        "endPoint":"Rajiv Gandhi International Airport",
        "date":"09 March 2023",
        "time":"09:00 AM",
        "name":"Ajay Krishnan",
        "additionalinfo": "",
        "phone": "+918714081616",
        },
        {"startPoint":"IIT Hyderabad Campus",
        "endPoint":"Secunderabad Railway Station",
        "date":"12 March 2023",
        "time":"05:00 PM",
        "name":"Adhith T",
        "additionalinfo": "Train leaves at 5 PM. SO, planning to leave at 3 PM",
        "phone": "+918714081616",
        },
        {"startPoint":"IIT Hyderabad Campus",
        "endPoint":"Lingampally Railway Station",
        "date":"15 March 2023",
        "time":"05:00 PM",
        "name":"Vikhyath",
        "additionalinfo": "I want to start from the campus between 4.00 and 5.00 pm",
        "phone": "+918714081616",
        },
        {"startPoint":"Rajiv Gandhi International Airport",
        "endPoint":"IIT Hyderabad Campus",
        "date":"13 March 2023",
        "time":"07:00 PM",
        "name":"Ayush",
        "additionalinfo": "Leaving from RGIA to IITH on 2 March around 6pm",
        "phone": "+918714081616",}
        ]
    return result



