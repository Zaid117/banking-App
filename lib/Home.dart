import 'package:flutter/material.dart';
import 'transactions.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();


}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  bool _showAccountNumber = false;
  bool _showBalance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB283F7),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: []),
        leading: Container(
          margin: const EdgeInsets.all(6),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              print('User icon pressedvfff');
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              print('Menu icon pressed');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Upper Container
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFFB283F7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[200],
                            image: const DecorationImage(
                              image: AssetImage('assets/images/img_5.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Mohammed Zaid',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'sbad7372@gmail.com',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Overlapping Card
            Transform.translate(
              offset: const Offset(0, -30),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF909090), Color(0xFF707070)],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.wifi,
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 32,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFFD4AF37),
                                            Color(0xFFF9D423),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/visa_logo.png',
                                  height: 30,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: const Text(
                                '2725 0006 0960 1920',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  letterSpacing: 2.0,
                                  fontFamily: 'Courier',
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'VALID \nTHRU ',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 8,
                                      ),
                                    ),
                                    const Text(
                                      '12/28',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                Text(
                                  'ZAID REHMATPURE',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                  ),
                                ),
                                const Text(
                                  'Debit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Center(
                          child: Text(
                            'Savings Account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            // Account Number Row
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Account Number :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        _showAccountNumber
                                            ? '1234 5678 9012 833'
                                            : 'xxxx xxxx xxxx 833',
                                        style: const TextStyle(
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _showAccountNumber
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showAccountNumber =
                                                !_showAccountNumber;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(thickness: 1, height: 1),
                            // Check Balance Row
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Check Balance :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        _showBalance ? '₹48,345.00' : '•••••',
                                        style: const TextStyle(
                                          letterSpacing: 1.5,
                                        ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          _showBalance
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _showBalance = !_showBalance;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(thickness: 1, height: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Mini Statement:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(children: [Text('04/03 - 05/03')]),
                                ],
                              ),
                            ),
                            const Divider(thickness: 1, height: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Detailed Statement :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(children: [Text('04/03 - 05/03')]),
                                ],
                              ),
                            ),
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });

              // Handle navigation for specific tabs
              if (index == 3) { // Transactions is at index 3
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TransactionsPage()),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.real_estate_agent),
                label: 'Policies',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.currency_rupee),
                label: 'Pay',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'Transactions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
