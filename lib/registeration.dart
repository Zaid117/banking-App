import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'VerificationPage.dart';

class Registration extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  Registration({super.key});

  // Generates a 4-digit random OTP (1000-9999)
  String _generateOTP() {
    return (1000 + Random().nextInt(9000)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed:
              () => Navigator.pop(context), // Goes back to previous screen
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 130),
              child: Text('Step 1', style: TextStyle(fontSize: 20,color: Color(0xFF7A66FF))),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                // Registration Image
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(top: 50, bottom: 40),
                  child: Image.asset('assets/images/img_1.png'),
                ),
                Text(
                  'Registration',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Enter Your Phone Number\nWe will Send you OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              prefix: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/img_2.png',
                                    width: 24,
                                    height: 16,
                                  ),
                                  Text(
                                    ' (+91)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              labelText: 'Enter Your Phone Number',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter phone number';
                              if (value.length != 10)
                                return 'Must be 10 digits';
                              if (!value.startsWith(RegExp(r'[89]')))
                                return 'Must start with 8 or 9';
                              return null;
                            },
                          ),

                          SizedBox(height: 30),

                          // Continue Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF7A66FF),
                                padding: EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => VerificationPage(
                                            phoneNumber: _phoneController.text,
                                            otp: _generateOTP(),
                                          ),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
