import 'package:ai_project/Layout/tools/device_screen_listner.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../tools/input_controller.dart';
import 'input_field_part.dart';
import 'result_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InputController controller = InputController();

  bool? check;
  @override
  Widget build(BuildContext context) {
    DeviceScreenListner screenListner = DeviceScreenListner(context);
    print("object");
    return Scaffold(
      // appBar: AppBar(),

      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("Assets/image1.png"))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //================= Page Title
                          Padding(padding: const EdgeInsets.only(bottom: 40), child: Text("Stroke Detector", style: cTextStylePageTitle)),
                          if (screenListner.type != ScreenSizeType.mobile)
                            Row(
                              children: [
                                Expanded(flex: 2, child: InputFieldsWidget(controller,(value) => setState(() => check = value))),
                                Expanded(child: ResultWidget(check)),
                              ],
                            ),
                          if (screenListner.type == ScreenSizeType.mobile)
                            Column(
                              children: [
                                InputFieldsWidget(controller,(value) => setState(() => check = value)),
                                const SizedBox(height: 20),
                                ResultWidget(check),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
