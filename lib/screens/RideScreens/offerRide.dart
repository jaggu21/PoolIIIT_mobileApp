import 'package:PoolIIIT_mobileApp/models/booking.dart';
import 'package:PoolIIIT_mobileApp/widgets/bookingCard.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class OfferRide extends StatefulWidget {
  static const routeName = '/offerride';
  @override
  _OfferRideState createState() => _OfferRideState();
}

class _OfferRideState extends State<OfferRide> {
  final _focusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _isSubmitted = 0;
  Booking card = new Booking(
    id: DateTime.now()
        .toIso8601String(), //id will be changed in according to firbase later.For now this works
    username: "sOME nAME",
    end: "",
    dateTime: "",
    notes: "",
  );

  void _saveForm() {
    _form.currentState.save();
    _isSubmitted = 1;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Destination',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                onSaved: (value) {
                  card.setEnd(value);
                },
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toIso8601String(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                icon: Icon(
                  Icons.event,
                ),
                dateLabelText: 'Date',
                timeLabelText: 'Time',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (value) {
                  card.setDateTime(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Optional Notes',
                ),
                maxLines: 2,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                focusNode: _focusNode,
                onSaved: (value) {
                  card.setNotes(value);
                },
                onFieldSubmitted: (_) => _saveForm(),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                  child: RaisedButton(
                    onPressed: () => _saveForm(),
                    elevation: 6.0,
                    padding: EdgeInsets.all(10.0),
                    color: Theme.of(context).accentColor,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              if (_isSubmitted == 1)
                Text(
                  "Review Your Ride",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 30,
                  ),
                ),
              if (_isSubmitted == 1)
                BookingCard(
                  title: card.getUsername,
                  date: card.getDateTime.split("T")[0],
                  time: card.getDateTime.split("T")[1],
                  destination: card.getEnd,
                  notes: card.getNotes,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
