import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipet/shared/cubit/cubit.dart';
import 'package:ipet/shared/cubit/states.dart';
import 'package:ipet/shared/styles/icon_broken.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key key,
    TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        if (cubit.userModel != null)
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                title: Text(
                  cubit.titles[cubit.currentIndex],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconBroken.Notification),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(IconBroken.Search),
                  ),
                ],
              ),
              body: TabBarView(
                physics: BouncingScrollPhysics(),
                // children: <Widget>[
                //   Icon(Icons.flight, size: 350),
                //   Icon(Icons.directions_transit, size: 350),
                //   Icon(Icons.directions_car, size: 350),
                //   Icon(Icons.directions_bike, size: 350),
                //   Icon(Icons.directions_boat, size: 350),
                // ],
                children: cubit.screens,
              ),
              // bottomNavigationBar: BottomNavigationBar(
              //   currentIndex: cubit.currentIndex,
              //   onTap: (index) {
              //     cubit.changeBottomNavIndex(index);
              //   },
              //   items: [
              //     BottomNavigationBarItem(
              //         icon: Icon(FontAwesomeIcons.paw), label: 'Home'),
              //     BottomNavigationBarItem(
              //         icon: Icon(IconBroken.Chat), label: 'Chat'),
              //     // BottomNavigationBarItem(
              //     //     icon: Icon(IconBroken.Paper_Upload,), label: 'Post'),
              //     BottomNavigationBarItem(
              //         icon: Icon(IconBroken.Heart), label: 'Favorites'),
              //     BottomNavigationBarItem(
              //         icon: Icon(IconBroken.Setting), label: 'Settings'),
              //   ],
              // ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.fromLTRB(16, 27, 16, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AnimatedContainer(
                    duration: new Duration(milliseconds: 500),
                    height: cubit.show ? 45.0 : 0.0,
                    color: Colors.black45,
                    child: TabBar(
                      onTap: (index) {
                        cubit.changeBottomNavIndex(index);
                      },
                      indicatorColor: Colors.cyan,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          icon: FaIcon(
                            FontAwesomeIcons.paw,
                          ),
                        ),
                        Tab(
                          icon: FaIcon(
                            IconBroken.Category,
                          ),
                        ),
                        Tab(
                          icon: FaIcon(
                            IconBroken.Heart,
                          ),
                        ),
                        Tab(
                          icon: FaIcon(
                            IconBroken.Chat,
                          ),
                        ),
                        Tab(
                          icon: FaIcon(
                            IconBroken.Setting,
                          ),
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              ),
            ),
          );
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}