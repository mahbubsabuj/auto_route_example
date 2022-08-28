import 'package:auto_route/auto_route.dart';
import 'package:auto_route_example/hawle_appbar.dart';
import 'package:flutter/material.dart';
import '../routes/router.gr.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;
  List<IconData> icons = [Icons.home, Icons.add, Icons.campaign_outlined];
  List<String> titles = ['Home', 'Add Device', 'Events'];
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => const HawleAppBar(),
      backgroundColor: Colors.indigo,
      routes: const [
        PostsRouter(),
        UsersRouter(),
        SettingsRouter(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          width: double.infinity,
          height: 72,
          // elevation: 10,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: ListView.builder(
              itemCount: icons.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() {
                  selectedTab = index;
                  tabsRouter.setActiveIndex(index);
                  if (index == 0) {
                    context.navigateTo(const PostsRouter());
                  } else if (index == 1) {
                    context.navigateTo(const UsersRouter());
                  } else {
                    context.navigateTo(const SettingsRouter());
                  }
                }),
                child: Padding(
                  padding: index == 2
                      ? const EdgeInsets.only(right: 0)
                      : EdgeInsets.only(right: ((width - 72 * 3) - 48) / 2),
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      border: index == selectedTab
                          ? Border(
                              top: BorderSide(
                                width: 2.0,
                                color: Colors.blue.shade500,
                              ),
                            )
                          : null,
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        color:
                            index == selectedTab ? Colors.blue.shade100 : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icons[index],
                            size: 32,
                            color: Colors.blue.shade500,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            titles[index],
                            style: TextStyle(
                              color: Colors.blue.shade500,
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
