import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final List<Map<String, dynamic>>  users = [
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    {
      'name': 'Huzaifa',
      'role': 'Developer'
    },
    {
      'name': 'Ali',
      'role': 'Designer'
    },
    {
      'name': 'Ahmed',
      'role': 'Tester'
    },
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.person,color: Colors.blue,),
      //       title: Text('Huzaifa'),
      //       subtitle: Text('Developer'),
      //     ),
      //
      //     ListTile(
      //       leading: Icon(Icons.person,color: Colors.blue,),
      //       title: Text('Ali'),
      //       subtitle: Text('Designer'),
      //     ),
      //
      //     ListTile(
      //       leading: Icon(Icons.person,color: Colors.blue,),
      //       title: Text('Ahmed'),
      //       subtitle: Text('Tester'),
      //     ),
      //   ],
      // ),
      
      
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context , index){
          return ListTile(
            leading: Icon(Icons.phone,color: Colors.blue,),
            title: Text(users[index]['name']),
            subtitle: Text(users[index]['role']),
          );
        },
      )
    );
  }
}
