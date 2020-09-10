import 'package:PoolIIIT_mobileApp/models/booking.dart';
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
  Booking card = new Booking(
    id: "",
    username: "Amanda",
    end: "",
    dateTime: "",
    notes: "",
  );

  void _saveForm() {
    _form.currentState.save();
    print(card.dateTime);
    print(card.end);
    print(card.notes);
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
                  card.end = value;
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
                  card.dateTime = value;
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
                  card.notes = value;
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
                    color: Colors.limeAccent,
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
            ],
          ),
        ),
      ),
    );
  }
}
