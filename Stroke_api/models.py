from pydantic import BaseModel

class Stroke_pred(BaseModel):
    #id_num:int
    gender:int
    age:float
    hypertension:int
    heart_disease:int
    work_type:int
    residence_type:int
    avg_glucose_level:float
    bmi:float
    smoking_status:int
    