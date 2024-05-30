// ignore: file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class GuestCounterPage extends StatefulWidget {
  const GuestCounterPage({Key? key}) : super(key: key);

  @override
  _GuestCounterPageState createState() => _GuestCounterPageState();
}

class _GuestCounterPageState extends State<GuestCounterPage> {
  int _guestCount = 0;
  String _selectedDate = '';
  String _selectedTime = '';

  void _incrementGuests() {
    setState(() {
      _guestCount++;
    });
  }

  void _decrementGuests() {
    setState(() {
      if (_guestCount > 0) _guestCount--;
    });
  }

  void _selectDate(String date) {
    setState(() {
      _selectedDate = date;
      _selectedTime = '';
    });
  }

  void _selectTime(String? time) {
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _bookTable() {
    if (_selectedDate.isEmpty || _selectedTime.isEmpty || _guestCount == 0) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Incomplete Information'),
          content:const Text('Please select date, time, and number of guests.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(child: Text('🎉 Success! 🎉')),
          content: Text(
            'Your table has been successfully reserved for $_guestCount guests on $_selectedDate at $_selectedTime. Enjoy your meal!',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  List<Widget> _buildDateButtons() {
    List<Widget> dateButtons = [];
    DateTime now = DateTime.now();
    DateFormat dateFormat = DateFormat('MMMM d, yyyy');

    for (int i = 0; i < 5; i++) {
      DateTime date = now.add(Duration(days: i));
      String dateLabel = i == 0 ? 'Today' : i == 1 ? 'Tomorrow' : dateFormat.format(date);

      dateButtons.add(
        OutlinedButton(
          onPressed: () => _selectDate(dateLabel),
          child: Text(dateLabel),
          style: OutlinedButton.styleFrom(
            foregroundColor: _selectedDate == dateLabel ? Colors.white : Colors.black, backgroundColor: _selectedDate == dateLabel ? Colors.deepOrange : Colors.white,
            side: const BorderSide(color: Colors.deepOrange),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      );

      dateButtons.add(const SizedBox(width: 10));
    }

    return dateButtons;
  }

  List<DropdownMenuItem<String>> _buildTimeDropdownItems() {
    List<DropdownMenuItem<String>> timeItems = [];
    DateTime now = DateTime.now();
    TimeOfDay currentTime = TimeOfDay.fromDateTime(now);

    // Starting time set to 10:30 AM
    TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 30);

    // Ending time set to 10:00 PM
    TimeOfDay endTime = const TimeOfDay(hour: 22, minute: 0);

    while (startTime.hour < endTime.hour || (startTime.hour == endTime.hour && startTime.minute <= endTime.minute)) {
      String timeLabel = startTime.format(context);

      if (_selectedDate == 'Today' &&
          (startTime.hour < currentTime.hour ||
              (startTime.hour == currentTime.hour && startTime.minute <= currentTime.minute))) {
        // Skip past times for today
        startTime = TimeOfDay(hour: startTime.hour + 1, minute: startTime.minute);
        continue;
      }

      timeItems.add(
        DropdownMenuItem<String>(
          value: timeLabel,
          child: Text(timeLabel),
        ),
      );

      // Increment time by 1 hour
      startTime = TimeOfDay(hour: startTime.hour + 1, minute: startTime.minute);
    }

    return timeItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BOOK NOW', style: TextStyle(color: Colors.white, fontSize: 30,
            fontFamily: 'PlayfairDisplay',),)),
        backgroundColor: Colors.deepOrange,
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the back icon color to white
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Number of Guests:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _incrementGuests,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '$_guestCount',
                      style: const TextStyle(fontSize: 36),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: _decrementGuests,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Date:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _buildDateButtons(),
              ),
              const SizedBox(height: 20),
              const Text(
                'Select Time:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedTime.isEmpty ? null : _selectedTime,
                  hint: const Text('Select Time'),
                  items: _buildTimeDropdownItems(),
                  onChanged: _selectTime,
                  underline: const SizedBox(),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: _bookTable,
                  child: const Text('Book Reservation'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.orange[100], // Text color
                            side: BorderSide(color: Colors.deepOrange[800]!, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    textStyle: const TextStyle(fontSize: 20),
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
