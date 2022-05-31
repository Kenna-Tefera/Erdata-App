import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/blocs.dart';
import '../../custom_widget/drawers.dart';

class ChildrenList extends StatelessWidget {
  ChildrenList({Key? key}) : super(key: key);
  PageController pageController = PageController(viewportFraction: 0.90);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) => 
      
           Scaffold(
        appBar: AppBar(
          title: Text("CHILDREN LIST"),
          centerTitle: true,
        ),
        drawer: const DrawerExtends(
          color: Colors.black,
        ),
        body: BlocConsumer<ChildrenBloc, ChildrenState>(
          listener: (_, ChildrenState state) {},
          builder: (_, ChildrenState state) {
            if (state is ChildrenLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ChildrenOperationFailure) {
              return Center(
                child: Text("Couldnot fetch children list"),
              );
            }
            if (state is ChildrenOperationSuccess) {
              final children = state.childrens;
              return PageView.builder(
                  itemCount: children.length,
                  itemBuilder: (_, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment(1.0, 1.0),
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 250,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/profile_image1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 220,
                            right: 10,
                            left: 10,
                            child: Container(
                              margin: EdgeInsets.only(left: 30, right: 30),
                              width: 300,
                              height: 270,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Name: ${children.elementAt(index).first_name + " " + children.elementAt(index).last_name}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "BirthDate: ${children.elementAt(index).birth_date}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Gender: ${children.elementAt(index).gender}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Kebele: ${children.elementAt(index).region}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Short Story: ${children.elementAt(index).kebele}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Short Story: ${children.elementAt(index).woreda}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
            return Text("Not handled State");
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              return context.goNamed("child_suggestion");
            },
            child: Icon(Icons.add)),
      
           )
      ),
    );
  }
}
