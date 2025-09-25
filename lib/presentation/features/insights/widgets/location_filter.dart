import 'package:flutter/material.dart';
import 'package:nextgig/core/theme/app_theme.dart';

class LocationDropdown extends StatefulWidget {
  // A callback function to pass the selected value back to the parent widget
  final ValueChanged<String?> onLocationChanged;

  const LocationDropdown({
    super.key,
    required this.onLocationChanged,
  });

  @override
  State<LocationDropdown> createState() => _LocationDropdownState();
}

class _LocationDropdownState extends State<LocationDropdown> {
  // 1. List of all the available locations
  final List<String> locations = const [
    'Johannesburg (Alexandra)',
    'Durban (Umlazi)',
    'Cape Town (Delft)',
    'Pretoria (Mamelodi)',
    'East London (Mdantsane)',
    'Welkom (Thabong)',
    'Kimberley (Galeshewe)',
    'George',
    'Stellenbosch',
    'Nelspruit (Mbombela)',
    'Rustenburg',
    'Port Alfred',
    'Thohoyandou',
    'Midrand',
    'Paarl',
    'Remote',
    'Soweto (Diepsloot)',
    'Bloemfontein (Botshabelo)',
    'Knysna',
    'Mahikeng',
  ];

  // 2. The currently selected value (initialised to the first item)
  String? _selectedLocation;

  @override
  void initState() {
    super.initState();
    // Set the initial value to the first item in the list
    _selectedLocation = locations.first;
    // Notify the parent widget of the initial selection
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onLocationChanged(_selectedLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Select Location for Insight',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        isExpanded: true,
        value: _selectedLocation,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple, fontSize: 16),

        // This is where you populate the dropdown items
        items: locations.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: AppColors.primaryGreen),
            ),
          );
        }).toList(),

        // This is called when the user selects a new item
        onChanged: (String? newValue) {
          setState(() {
            _selectedLocation = newValue;
          });
          // Pass the selected value back to the widget that will call the Gemini service
          widget.onLocationChanged(newValue);
        },
      ),
    );
  }
}
