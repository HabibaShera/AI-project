import pickle
from fastapi import FastAPI
import joblib
from models import Stroke_pred
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder

app = FastAPI()
model = joblib.load("pickled_model.pkl")
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def root():
    return {"ok":5,"headers": {
  "Access-Control-Allow-Origin": "*", 
  "Access-Control-Allow-Credentials": True, 
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
},"statusCode": 200}

@app.post('/predict')
async def predict(req:dict):
    gender = req.get("gender")
    age = req.get("age")
    hypertension = req.get("hypertension")
    heart_disease = req.get("heart_disease")
    work_type = req.get("work_type")
    residence_type = req.get("residence_type")
    avg_glucose_level = req.get("avg_glucose_level")
    bmi = req.get("bmi")
    smoking_status = req.get("smoking_status")
    
    features = list([gender, age, hypertension,
                     heart_disease, work_type,
                     residence_type, avg_glucose_level,
                     bmi, smoking_status
                     ])

    predict = model.predict([features])
    predict_prob = model.predict_proba([features])
    
    #sa
    if predict == 0:
        json_compatible_item_data = jsonable_encoder({"result":f'{predict[0]}'})
        return JSONResponse(content=json_compatible_item_data)
    else:
        json_compatible_item_data = jsonable_encoder({"result":f'{predict[0]}'})
        return JSONResponse(content=json_compatible_item_data)




    