import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/meal.dart';
import '../../../common_widgets/show_exception_alert_dialog.dart';
import '../../../services/database.dart';
import '../../../services/auth.dart';
import 'edit_meal_text_form_field.dart';
import 'validators.dart';

class EditMealPage extends StatefulWidget with MealValidators {
  EditMealPage({required this.database, required this.auth, this.meal});
  final Database database;
  final AuthBase auth;
  final Meal? meal;

  static Future<void> show(BuildContext context, {Meal? meal}) async {
    final database = Provider.of<Database>(context, listen: false);
    final auth = Provider.of<AuthBase>(context, listen: false);

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            EditMealPage(database: database, auth: auth, meal: meal),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  _EditMealPageState createState() => _EditMealPageState();
}

class _EditMealPageState extends State<EditMealPage> {
  final _formKey = GlobalKey<FormState>();

  var _isLoading = false;

  var _initialValue = <String, dynamic?>{
    'mealName': '',
    'description': '',
    'price': '',
    'timeToPrep': '',
  };

  @override
  void initState() {
    super.initState();
    if (widget.meal != null) {
      _initialValue = {
        'mealName': widget.meal?.mealName,
        'description': widget.meal?.description,
        'price': widget.meal?.price,
        'timeToPrep': widget.meal?.timeToPrep,
      };
    }
  }

  // String _mealName;
  // String? _description;
  // int? _price;
  // int? _timeToPrep;

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  ////// HELPER METHODS ////////

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        setState(() {
          _isLoading = true;
        });
        final mealId = widget.meal?.mealId ?? documentIdFromCurrentDate();
        final vendorId = widget.auth.currentUser?.uid;
        final meal = Meal(
          mealId: mealId,
          vendorId: vendorId!,
          mealName: _initialValue['mealName'],
          description: _initialValue['description'],
          price: _initialValue['price'],
          imageUrl:
              'https://images.unsplash.com/photo-1592894869086-f828b161e90a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&q=40.png',
          timeToPrep: _initialValue['timeToPrep'],
          distance: 25.5,
          location: 'Stockholm',
        );
          await widget.database.setMeal(meal);
          setState(() {
            _isLoading = false;
          });
        Navigator.of(context).pop();
      } on FirebaseException catch (e) {
        setState(() {
          _isLoading = false;
        });
        showExceptionAlertDialog(
          context,
          title: 'Operation failed',
          exception: e,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(
          widget.meal == null ? 'New Meal' : 'Edit Meal',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : IconButton(
                    icon: Icon(
                      Icons.save,
                      size: 30.0,
                    ),
                    onPressed: _isLoading ? null : _submit,
                  ),
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  ////// WIDGETS METHODS ////////

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 0.8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      EditMealTextFormField(
        context: context,
        initialValue: _initialValue['mealName'],
        labelText: 'Meal name',
        textInputAction: TextInputAction.next,
        onSaved: (value) => _initialValue['mealName'] = value,
        validator: (value) => widget.mealNameValidator.isValid(value!)
            ? null
            : widget.invalidMealNameErrorText,
      ),
      const SizedBox(height: 13.0),
      EditMealTextFormField(
        context: context,
        initialValue: _initialValue['description'],
        labelText: 'Meal description',
        textInputAction: TextInputAction.next,
        maxLines: 4,
        onSaved: (value) => _initialValue['description'] = value,
        validator: (value) => widget.mealDescriptionValidator.isValid(value!)
            ? null
            : widget.invalidMealDescriptionErrorText,
      ),
      const SizedBox(height: 13.0),
      EditMealTextFormField(
        context: context,
        initialValue: _initialValue['price'].toString(),
        labelText: 'Price',
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onSaved: (value) =>
            _initialValue['price'] = double.tryParse(value ?? '0.0')!,
        validator: (value) => widget.priceValidator.isValidPrice(value!)
            ? null
            : widget.invalidPriceErrorText,
      ),
      const SizedBox(height: 13.0),
      EditMealTextFormField(
        context: context,
        initialValue: _initialValue['timeToPrep'].toString(),
        labelText: 'Time to prepare (in minutes)',
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        onSaved: (value) =>
            _initialValue['timeToPrep'] = int.tryParse(value ?? '1')!,
        validator: (value) =>
            widget.timeToPrepValidator.isValidTimeToPrep(value!)
                ? null
                : widget.invalidTimeToPrepErrorText,
      ),
    ];
  }
}
