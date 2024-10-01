import 'package:flutter/material.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final TextEditingController emailTEController = TextEditingController();
  final TextEditingController firstNameTEController = TextEditingController();
  final TextEditingController lastNameTEController = TextEditingController();
  final TextEditingController mobileTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final RegExp _emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z]+\.[a-zA-Z]{2,}$');
  final RegExp _firstNameRegExp = RegExp(r'^[a-zA-Z]+$');
  final RegExp _lastNameRegExp = RegExp(r'^[a-zA-Z]+$');
  final RegExp _mobileRegExp = RegExp(r'^(\+880)[ -]?\d{10}$');
  final RegExp _passwordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$');

  bool _obscurePassword = true; /// Password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: _buildTextFormField(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          controller: emailTEController,
          decoration: const InputDecoration(
            hintText: 'Email',
            labelText: 'Enter your email',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your email';
            } else if (!_emailRegExp.hasMatch(value)) {
              return 'Enter a valid email';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.name,
          controller: firstNameTEController,
          decoration: const InputDecoration(
            hintText: 'First Name',
            labelText: 'Enter your first name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your first name';
            } else if (!_firstNameRegExp.hasMatch(value)) {
              return 'Enter a valid first name';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.name,
          controller: lastNameTEController,
          decoration: const InputDecoration(
            hintText: 'Last Name',
            labelText: 'Enter your last name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your last name';
            } else if (!_lastNameRegExp.hasMatch(value)) {
              return 'Enter a valid last name';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: mobileTEController,
          decoration: const InputDecoration(
            hintText: 'Mobile',
            labelText: 'Enter phone number',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your mobile number';
            } else if (!_mobileRegExp.hasMatch(value)) {
              return 'Enter a valid mobile number';
            }
            return null;
          },
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: passwordTEController,
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Enter your password',
            suffixIcon: IconButton(
              icon:
                  Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your password';
            } else if (!_passwordRegExp.hasMatch(value)) {
              return 'Enter a valid password';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        Center(
          child: ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String email = emailTEController.text;
      String firstName = firstNameTEController.text;
      String lastName = lastNameTEController.text;
      String mobile = mobileTEController.text;
      String password = passwordTEController.text;

      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Submitted Form'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email: $email'),
                Text('Name: $firstName $lastName'),
                Text('Mobile: $mobile'),
                Text('Password: $password'),
              ],
            ),

            ///using button clear dialog
            // actions: [
            //   TextButton(
            //       onPressed: () {
            //         emailTEController.clear();
            //         Navigator.pop(context);
            //       },
            //       child: const Text('Clear')),
            // ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),


            backgroundColor: Colors.white,
          );
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pop(context);
        _clearForm();
      });
    }
  }

  void _clearForm() {
    emailTEController.clear();
    firstNameTEController.clear();
    lastNameTEController.clear();
    mobileTEController.clear();
    passwordTEController.clear();
  }
}
