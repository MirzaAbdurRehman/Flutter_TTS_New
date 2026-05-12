import 'dart:convert';
import 'package:first_app/Model/customer_model.dart';
import 'package:first_app/Model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{

  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<UserModel>> fetchAllUsersData() async {
    try{
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if(response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((items) =>
            UserModel.fromJson(items as Map<String, dynamic>)).toList();
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }catch(error){
      throw Exception('Failed to fetch data: $error');
    }
  }


  Future<List<CustomerModel>> fetchAllCustomerData() async {
    try{
      final response = await http.get(Uri.parse('$baseUrl/users'));
      if(response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((items) =>
            CustomerModel.fromJson(items as Map<String, dynamic>)).toList();
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }catch(error){
      throw Exception('Failed to fetch data: $error');
    }
  }


  Future<CustomerModel> fetchUserDetails(String id) async {
    try{
      final response = await http.get(Uri.parse('$baseUrl/users/$id'));
      if(response.statusCode == 200){
        final Map<String, dynamic> jsonMap = json.decode(response.body);
        return CustomerModel.fromJson(jsonMap);
      }
      else{
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    }catch(error){
      throw Exception('Failed to fetch data: $error');
    }
  }


}