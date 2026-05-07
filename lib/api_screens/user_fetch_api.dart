import 'package:flutter/material.dart';

import '../Model/user_model.dart';
import '../service/api_service.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  late Future<List<UserModel>> _usersListData;

  @override
  void initState() {
    // TODO: implement initState
    _usersListData = ApiService().fetchAllUsersData();;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
          future: _usersListData,
          
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                  child: CircularProgressIndicator()
              );
            }

            else if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error}',style: TextStyle(color: Colors.red),));
            }
            else if(snapshot.hasData){
              final userList = snapshot.data;
              return ListView.builder(
                itemCount: userList!.length,
                  itemBuilder: (context, index) {
                   return ListTile(
                     leading: Text('${userList[index].id}'),
                     title: Text('${userList[index].userId}'),
                     subtitle: Text('${userList[index].title}'),
                     
                   );
                }
              );
            }
            return Container();
          }
          
      ),
    );
  }
}
