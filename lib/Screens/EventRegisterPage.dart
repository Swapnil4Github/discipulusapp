import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:im_stepper/stepper.dart';
import 'package:discipulus/Controller/EventRegisterController.dart';
import 'package:get/get.dart';

import '../Modules/Data.dart';
class EventRegisterPage extends GetView<EventRegisterController> {

  GlobalKey<FormState> basicFormKey = GlobalKey<FormState>();

  int activeIndex = 0;
  int totalIndex = 2;
  @override
  Widget build(BuildContext context) {
    Get.put(EventRegisterController());
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          activeIndex--;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
         backgroundColor: KAppColor,
          title: const Text(
            " Event Registration",
          ),
        ),
        //
        body: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    switch (activeIndex) {
      case 0:
        return basicDetails();


      default:
        return basicDetails();
    }
  }

  Widget basicDetails() {
    return Form(
      key: basicFormKey,
      child: ListView(
        padding: const EdgeInsets.all(
          12.0,
        ),
        children: [
          TextFormField(
            controller: controller.NameController,
            decoration: const InputDecoration(
              labelText: "Name",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          TextFormField(
            controller: controller.RegController,
            decoration: const InputDecoration(
              labelText: "Reg No.",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          TextFormField(
            controller: controller.CourseController,
            decoration: const InputDecoration(
              labelText: "Course",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),


          const SizedBox(
            height: 12.0,
          ),
          TextFormField(
              controller: controller.EmailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              validator: MultiValidator([
                RequiredValidator(
                  errorText: "Required *",
                ),
                EmailValidator(
                  errorText: "Not Valid Email",
                ),
              ])),
          TextFormField(
            controller: controller.ContactNumberController,
            decoration: const InputDecoration(
              labelText: "Contact Number",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),
          TextFormField(
            controller: controller.EventName,
            decoration: const InputDecoration(
              labelText: "Event Name",
            ),
            validator: RequiredValidator(
              errorText: "Required *",
            ),
          ),

          const SizedBox(
            height: 12.0,
          ),
          SizedBox(
            height: 40.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: KAppColor),
              onPressed: () {
                controller.saveUpdateEmployee(
                    controller.NameController.text,
                    controller.RegController.text,
                    controller.CourseController.text,
                    controller.EmailController.text,
                    controller.ContactNumberController.text,
                    controller.EventName.text,
                    '',
                    1);
              },
              child: const Text(
                "Register",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }

}
