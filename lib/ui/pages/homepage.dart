import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randomuser_app/core/model/user.dart';
import 'package:randomuser_app/core/provider/randoumuser.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading;
  List<User> userList;
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    setState(() {
      loading = Provider.of<RandomUser>(context).loading;

      print(loading);
      if (loading) {
        Provider.of<RandomUser>(context).getUsers();
        userList = Provider.of<RandomUser>(context).userList;
      }
    });
    return Scaffold(
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Center(
                          child: TextField(
                            controller: _searchController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                              color: Colors.black87,
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.white38,
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: userList.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    NetworkImage(userList[index].photomedium),
                              ),
                              title: Text(userList[index].name ?? ''),
                              subtitle: Text(userList[index].phone),
                              trailing: Icon(
                                Icons.call_end,
                                color: Colors.green,
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
