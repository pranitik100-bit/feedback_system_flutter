import 'package:flutter/material.dart';

class Role extends StatelessWidget {
  const Role({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RoleSelect(), debugShowCheckedModeBanner: false);
  }
}

class RoleSelect extends StatelessWidget {
  const RoleSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Choose your role",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Select the Role you want to continue with"),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Icon(Icons.school, color: Colors.indigo, size: 60),

                            Text(
                              "Student",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Access Feedback",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("and History", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(10, 20, 10, 20),
                        child: Column(
                          children: [
                            Icon(
                              Icons.co_present,
                              color: Colors.indigo,
                              size: 60,
                            ),

                            Text(
                              "HOD",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Monitors Department",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("Feedback", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Card(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsetsGeometry.fromLTRB(
                              25,
                              20,
                              25,
                              20,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.business_center,
                                  color: Colors.indigo,
                                  size: 60,
                                ),

                                Text(
                                  "Teacher",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "View Feedback",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "and Analytics",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsetsGeometry.fromLTRB(
                              17,
                              20,
                              17,
                              20,
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.group,
                                  color: Colors.indigo,
                                  size: 60,
                                ),

                                Text(
                                  "Parent",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Access Feedback",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "and History",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

