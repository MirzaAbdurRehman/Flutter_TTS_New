import 'package:first_app/Model/customer_model.dart';
import 'package:first_app/service/api_service.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {

  final String userId;
  const UserDetailScreen({required this.userId,super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  late Future<CustomerModel> _userDetailData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userDetailData = ApiService().fetchUserDetails(widget.userId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('User Detail',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder(
          future: _userDetailData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}',
                style: TextStyle(color: Colors.red),));
            }
            else if (snapshot.hasData) {
              final userDetail = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${userDetail!.id}', style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Text('Name: ${userDetail.name}',
                      style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Email: ${userDetail.email}',
                      style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Phone: ${userDetail.phone}',
                      style: TextStyle(fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('Address: ${userDetail.address}',
                      style: TextStyle(fontSize: 16),),
                  ],
                ),
              );
            }
            return Container();
          })
    );
  }
}
