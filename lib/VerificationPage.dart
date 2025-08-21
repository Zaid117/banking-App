import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home.dart';

class VerificationPage extends StatefulWidget {
  final String phoneNumber;
  final String otp;

  const VerificationPage({
    super.key,
    required this.phoneNumber,
    required this.otp,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),

  );
  bool _otpShown = false;
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap button to close
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Success Image
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/img_4.png'), // Add your success image
                ),
                SizedBox(height: 20),

                // Congratulations Text
                Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 10),

                // Registration Complete Text
                Text(
                  'You are now registered',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),

                // Start Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7A66FF),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => Home(),
                        ),
                      );
                    },
                    child: Text(
                      'Start Now',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  void initState() {
    super.initState();
    // Show OTP toast only once when page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_otpShown) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your OTP is: ${widget.otp}'),
            duration: Duration(seconds: 5),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.1,
              left: 20,
              right: 20,
            ),
          ),
        );
        setState(() {
          _otpShown = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 130),
              child: Text(
                'Step 2',
                style: TextStyle(fontSize: 20, color: Color(0xFF7A66FF)),
              ),
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
                  child: Image.asset('assets/images/img_3.png'),
                ),
                // Title
                Text(
                  'Verification',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                // Subtitle
                Padding(
                  padding: EdgeInsets.all(6),
                  child: Text(
                    'Enter the OTP sent to your number',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                // Phone Number Display
                Text(
                  widget.phoneNumber,
                  // Changed from phoneNumber to widget.phoneNumber
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                SizedBox(height: 50),

                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _otpControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 3) {
                            FocusScope.of(context).nextFocus();
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),

                SizedBox(height: 40),

                // Verify Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7A66FF),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      String enteredOtp = _otpControllers.map((c) => c.text).join();
                      if (enteredOtp.length == 4) {
                        if (enteredOtp == widget.otp) {
                          _showSuccessDialog(context); // Show the success modal
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Incorrect OTP. Please try again')),
                          );
                        }
                      }
                    },
                    child: Text(
                      'Verify',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Resend OTP Option
                TextButton(
                  onPressed: () {
                    // Add resend OTP logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('New OTP sent to ${widget.phoneNumber}'),
                      ), // Changed phoneNumber to widget.phoneNumber
                    );
                  },
                  child: Text(
                    "Didn't receive OTP? Resend",
                    style: TextStyle(color: Color(0xFF7A66FF)),
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
