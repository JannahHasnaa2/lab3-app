import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FactoryScreen(),
    );
  }
}

class FactoryScreen extends StatefulWidget {
  @override
  _FactoryScreenState createState() => _FactoryScreenState();
}

class _FactoryScreenState extends State<FactoryScreen> {
  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
    EngineerListScreen(),
    DashboardScreen(),
    NotificationSettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory 2'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ActivationScreen()),
              );
            },
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Engineer List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            '1549.7 kW',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              _buildGaugeCard('Steam Pressure', '34.19 bar', true),
              _buildGaugeCard('Steam Flow', '22.82 t/h', false),
              _buildGaugeCard('Water Level', '55.41%', true),
              _buildGaugeCard('Power Frequency', '50.08 Hz', true),
            ],
          ),
          SizedBox(height: 16),
          Text(
            '2024-04-26 13:45:25',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.grey,
                  minimumSize: Size(120, 50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FactoryOneScreen()),
                  );
                },
                child: Text('Factory 1'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  minimumSize: Size(120, 50),
                ),
                onPressed: () {},
                child: Text('Factory 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeCard(String title, String value, bool isNormal) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isNormal ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FactoryOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factory 1 Sensor Readings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Missing Sensor Readings for Factory 1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                _buildGaugeCard('Temperature', 'N/A', false),
                _buildGaugeCard('Humidity', 'N/A', false),
                _buildGaugeCard('Pressure', 'N/A', false),
                _buildGaugeCard('Vibration', 'N/A', false),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGaugeCard(String title, String value, bool isNormal) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isNormal ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EngineerListScreen extends StatefulWidget {
  @override
  _EngineerListScreenState createState() => _EngineerListScreenState();
}

class _EngineerListScreenState extends State<EngineerListScreen> {
  List<Map<String, String>> engineers = [
    {'name': 'Jannah', 'phone': '123-456-7890'},
    {'name': 'Qistina', 'phone': '234-567-8901'},
    {'name': 'Allieysa', 'phone': '345-678-9012'}
  ]; // Sample list of engineer names and phone numbers

  void _addEngineer(Map<String, String> newEngineer) {
    setState(() {
      engineers.add(newEngineer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Engineer List'),
      ),
      body: ListView.builder(
        itemCount: engineers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${engineers[index]['name']}'),
            subtitle: Text('Phone: ${engineers[index]['phone']}'), // Display phone number as subtitle
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the InvitationPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InvitationPage(
                addEngineerCallback: _addEngineer,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}




class InvitationPage extends StatelessWidget {
  final Function(Map<String, String>) addEngineerCallback;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  InvitationPage({required this.addEngineerCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invitation', style: TextStyle(fontSize: 24)), // Increased font size for title
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Invite Users',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            _buildInputField('Owner\'s Name', 'Type here', _nameController), // Function to build input fields
            SizedBox(height: 20),
            _buildInputField('Owner\'s Phone Number', 'Type here', _phoneController, isNumeric: true), // Numeric input field
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                final newEngineer = {
                  'name': _nameController.text,
                  'phone': _phoneController.text
                };
                addEngineerCallback(newEngineer);
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hintText, TextEditingController controller, {bool isNumeric = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      keyboardType: isNumeric ? TextInputType.phone : TextInputType.text,
    );
  }
}



class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  double _steamPressureThreshold = 29.0;
  double _steamFlowThreshold = 22.0;
  double _waterLevelThreshold = 53.0;
  double _powerFrequencyThreshold = 48.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notification Settings'),
          centerTitle: true,
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Minimum Thresholds:',
    style: TextStyle(fontSize: 20, fontWeight
        : FontWeight.bold),
    ),
      SizedBox(height: 16),
      _buildThresholdSlider(
        'Steam Pressure',
        _steamPressureThreshold,
            (value) {
          setState(() {
            _steamPressureThreshold = value;
          });
        },
      ),
      _buildThresholdSlider(
        'Steam Flow',
        _steamFlowThreshold,
            (value) {
          setState(() {
            _steamFlowThreshold = value;
          });
        },
      ),
      _buildThresholdSlider(
        'Water Level',
        _waterLevelThreshold,
            (value) {
          setState(() {
            _waterLevelThreshold = value;
          });
        },
      ),
      _buildThresholdSlider(
        'Power Frequency',
        _powerFrequencyThreshold,
            (value) {
          setState(() {
            _powerFrequencyThreshold = value;
          });
        },
      ),
    ],
    ),
        ),
    );
  }

  Widget _buildThresholdSlider(String title, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Slider(
          value: value,
          min: 0,
          max: 100,
          divisions: 100,
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class ActivationScreen extends StatefulWidget {
  @override
  _ActivationScreenState createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  final TextEditingController _otpController = TextEditingController();
  bool _isActivated = false;
  bool _otpSent = false;
  String _otp = '';

  void _generateOtp() {
    setState(() {
      _otp = '123456'; // Simulating OTP generation
      _otpSent = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP has been sent: $_otp')));
    });
  }

  void _activateAccount() {
    setState(() {
      if (_otpController.text == _otp) {
        _isActivated = true;
      } else {
        _isActivated = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid OTP')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Activation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isActivated
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100),
              SizedBox(height: 16),
              Text(
                'Account Successfully Activated',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ],
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Account Activation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _otpSent
                ? Column(
              children: [
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: 'Activation Code',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _activateAccount,
                  child: Text('Activate'),
                ),
              ],
            )
                : ElevatedButton(
              onPressed: _generateOtp,
              child: Text('Get Activation Code'),
            ),
          ],
        ),
      ),
    );
  }
}





