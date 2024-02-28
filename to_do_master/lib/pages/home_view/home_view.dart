import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/network_layer/firebase_utils.dart';
import '../../core/provider/app_provider.dart';
import '../../pages/home_view/widgets/task_item.dart';
import '../../pages/login_view/login_view.dart';
import '../../model/task_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var appProvider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        Stack(
          alignment: const Alignment(0, 2.1),
          children: [
            Container(
              width: mediaQuery.width,
              height: 200,
              padding: const EdgeInsets.only(
                left: 52,
              ),
              color: theme.primaryColor,
              child: Row(
                children: [
                  Text(
                    'To Do List',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(width: 110),
                  IconButton(
                    onPressed: () {
                      selectedDate = DateTime.now();
                      setState(() {});
                    },
                    icon: const Icon(Icons.restart_alt_rounded),
                    color: theme.colorScheme.secondary,
                  ),
                  IconButton(
                    onPressed: () {
                      appProvider.logOut();
                      Navigator.pushReplacementNamed(
                          context, LoginView.routeName);
                    },
                    icon: const Icon(Icons.logout_rounded),
                    color: theme.colorScheme.secondary,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.3),
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.secondary.withOpacity(0.3),
                    theme.colorScheme.background,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CalendarTimeline(
                initialDate: selectedDate,
                firstDate: DateTime(2023, 01, 01),
                lastDate: DateTime(2024, 12, 31),
                onDateSelected: (date) {
                  if (selectedDate != date) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },
                leftMargin: 20,
                monthColor: theme.colorScheme.secondary,
                dayColor: Colors.teal[200],
                activeDayColor: theme.primaryColor,
                dotsColor: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 65,
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FirebaseUtils.getRealTimeDataFromFirestore(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.error.toString()),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => FirebaseUtils.getDataFromFirestore(),
                      child: const Text('Retry'),
                    ),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer.fromColors(
                  baseColor: theme.primaryColor,
                  highlightColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 450),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 33, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        width: mediaQuery.width,
                        height: 115,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Task Title",
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    constraints: const BoxConstraints(
                                        maxHeight: 24, maxWidth: 195),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "Task Description",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                                color: theme
                                                    .colorScheme.onSecondary),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        color: theme.colorScheme.onSecondary
                                            .withOpacity(0.5),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "Task Time",
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          color: theme.colorScheme.onSecondary
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 30,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 60,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: theme.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Image.asset('assets/images/check_icon.png'),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                );
              }

              var tasksList = snapshot.data?.docs
                      .map((element) => element.data())
                      .toList() ??
                  [];

              return ListView.builder(
                itemBuilder: (context, index) =>
                    TaskItem(task: tasksList[index]),
                itemCount: tasksList.length,
                padding: const EdgeInsets.only(
                  top: 0,
                  bottom: 90,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
