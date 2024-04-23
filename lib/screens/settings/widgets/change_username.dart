import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/settings/widgets/input_label.dart';
import 'package:gym_flair/screens/settings/widgets/submit_button.dart';
import 'package:gym_flair/screens/settings/widgets/text_field.dart';

import '../../../shared/sizes.dart';
import '../../../shared/widgets/backward_button.dart';

class ChangeUsername extends StatefulWidget {
  const ChangeUsername({super.key});

  @override
  State<ChangeUsername> createState() => _ChangeUsernameState();
}

class _ChangeUsernameState extends State<ChangeUsername> {

  final TextEditingController _username = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * ConstantSizes.horizontalPadding,
            right: screenWidth * ConstantSizes.horizontalPadding,
            top: screenHeight * 0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackwardButton(
                  onPressed: (){Navigator.pop(context);},
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Change username',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: screenHeight * 0.03),
            const InputLabel(label: 'New username'),
            SizedBox(height: screenHeight * 0.01),
            Form(
              key: _formKey,
              child: SettingsFormField(
                hintText: 'Enter username',
                controller: _username,
                context: context,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            SubmitButton(
              text: 'Confirm',
              onPressed: () {
                _formKey.currentState!.validate();
              },
            )
          ],
        ),
      ),
    );
  }
}