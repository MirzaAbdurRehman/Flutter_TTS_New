import 'package:first_app/helper_functions/custom_text_form_feild.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Screen',style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              AppTextField.CustomTextFormFiled(
                  controller: nameController,
                  hintText: 'Enter Name',
                  labelText: 'Name',
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if( value == null || value.isEmpty){
                      return 'Name is required';
                    }
                    if(value.length < 5){
                      return 'Atleast 5 characters';
                    }
                    return null;
                  }
              ),

              SizedBox(
                height: 20,
              ),
              AppTextField.CustomTextFormFiled(
                  controller: emailController,
                  hintText: 'Enter Email',
                  labelText: 'E-mail',
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if( value == null || value.isEmpty){
                      return 'Email is required';
                    }
                    if(!value.contains('@')){
                      return 'Enter Valid Email';
                    }
                    return null;
                  }
              ),

              SizedBox(
                height: 20,
              ),


              AppTextField.CustomTextFormFiled(
                  controller: passwordController,
                  hintText: 'Enter Password.',
                  labelText: 'Password',
                  prefixIcon: Icons.password,
                  validator:  (value) {
                    if (value == null || value.isEmpty){
                      return 'Password is required';
                    }
                    if(value.length < 6){
                      return 'Minimum 6 characters';
                    }
                    return null;
                  }
              ),

              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Form Submitting Successdully'))
                      );
                    }
                  },
                  child: Text('Sign Up')
              )
            ],
          ),
        ),
      ),
    );
  }
}
