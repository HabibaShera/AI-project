import 'package:ai_project/Layout/tools/input_controller.dart';
import 'package:flutter/material.dart';

import '../../Widgets/form_check_item.dart';
import '../../Widgets/form_selector.dart';
import '../../constants.dart';

class InputFieldsWidget extends StatefulWidget {
  const InputFieldsWidget(this.context,{
    Key? key,

  }) : super(key: key);
  final BuildContext context;
  @override
  State<InputFieldsWidget> createState() => _InputFieldsWidgetState();
}

class _InputFieldsWidgetState extends State<InputFieldsWidget> {
  InputController controller = InputController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //================================================== Personal Data
              //================= Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Personal Data",
                  style: cTextStyleTitle,
                ),
              ),

              Row(children: [
                //================= Id Field
                Expanded(child: TextFormField(decoration: kInputDecorationDataField("Id"))),
                const SizedBox(width: 10),
                //================= Age Field
                Expanded(
                  child: TextFormField(
                    decoration: kInputDecorationDataField("Age"),
                    onChanged: (value) => controller.data["age"] = int.parse(value),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    //================= Gendeer Field
                    Expanded(child: FormSelector<String>(cGenders, "Gender", (value) => controller.data["gender"] = (value == "Male") ? 1 : 0)),

                    //================= Residence Type Field
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: FormSelector<String>(cResidenceTypes, "Residence Type", (value) => controller.data["residence_type"] = (value == "Rural") ? 0 : 1),
                      ),
                    ),

                    //================= Work Type Field
                    Expanded(
                      child: FormSelector(
                        cWorkTypes,
                        "Work Type",
                        (value) {
                          late int cashe;
                          switch (value) {
                            case "Govt jov":
                              cashe = 0;
                              break;
                            case "Never Worked":
                              cashe = 1;
                              break;
                            case "Private":
                              cashe = 2;
                              break;
                            case "Self-employed":
                              cashe = 3;
                              break;
                            case "Children":
                              cashe = 4;
                              break;
                          }
                          controller.data["work_type"] = cashe;
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // //================= Married Field
              // const FormChekItem("Married",(value) => controller.data[""])),
              //================================================== Medical Data Fields
              //================= Title
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Medical Data",
                  style: cTextStyleTitle,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    //================= Average of Glucose level Field
                    Expanded(
                      child: TextFormField(
                        decoration: kInputDecorationDataField("Average of Glucose level"),
                        onChanged: (value) => controller.data["avg_glucose_level"] = int.parse(value),
                      ),
                    ),

                    //================= BMI Field
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: kInputDecorationDataField("BMI"),
                          onChanged: (value) => controller.data["bmi"] = int.parse(value),
                        ),
                      ),
                    ),

                    //================= Smoke Status Field
                    Expanded(
                        child: FormSelector(cSmokingStates, "Smoking State", (value) {
                      late int cashe;
                      if (value == "Formelly smoking")
                        cashe = 1;
                      else if (value == "Never smoked")
                        cashe = 2;
                      else
                        cashe = 3;
                      controller.data["smoking_status"] = cashe;
                    }))
                  ],
                ),
              ),
              Row(
                children: [
                  //================= Hyper Tension Field
                  Expanded(child: FormChekItem("Hyper Tension", (value) => controller.data["hypertension"] = (value) ? 1 : 0)),

                  const SizedBox(width: 10),
                  //================= Heart Disease Field
                  Expanded(child: FormChekItem("Heart Disease", (value) => controller.data["heart_disease"] = (value) ? 1 : 0)),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () async => await controller.sendData(),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text("Click", style: TextStyle(color: Colors.white)),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: cColorMain,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
