import 'package:dotted_border/dotted_border.dart';

import 'package:dtask/Ui/widgets/task_card.dart';
import 'package:dtask/Utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils/labels.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;
    return Scaffold(
      backgroundColor: scheme.surfaceVariant,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Assets.two),
                size: 38,
              ),
              label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting')
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(Labels.welcomeBack),
                        Text(
                          Labels.carolinaTerner,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Stack(alignment: Alignment.center, children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(Assets.photo),
                    ),
                    Transform.translate(
                      offset: const Offset(-18, 18),
                      child: const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.white70,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF001F2A),
                          child: Text(
                            '2',
                            style: TextStyle(fontSize: 12),
                          ),
                          foregroundColor: Color(0xFFFAFCFF),
                          radius: 10,
                        ),
                      ),
                    )
                  ])
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 16 + 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: Text(
                            Labels.taskBasedExplanation,
                            style: style.headlineSmall,
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: {
                              Labels.addTask: Labels.creatives,
                              Labels.review: Labels.verificationProcess,
                              Labels.flowList: Labels.verificationProcess
                            }
                                .entries
                                .map(
                                  (e) => e.key == Labels.addTask
                                      ? Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: DottedBorder(
                                            color: scheme.outline,
                                            borderType: BorderType.RRect,
                                            radius: Radius.circular(12),
                                            dashPattern: [4],
                                            child: TaskCard(e: e),
                                          ),
                                        )
                                      : TaskCard(e: e),
                                )
                                .toList(),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              child: Text(
                                Labels.flowList,
                                style: style.headlineSmall,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: CupertinoButton(
                                  onPressed: () {},
                                  child: Text(
                                    Labels.seeAll,
                                  )),
                            )
                          ],
                        ),
                        Column(
                          children: {
                            Labels.documentVerification: Labels.minutesAgo(3),
                            Labels.newbieOnboarding: Labels.daysAgo(5),
                            Labels.getStarted: Labels.minutesAgo(5),
                            Labels.doYouWantToSeeFull: Labels.daysAgo(5),
                            Labels.flowList: Labels.daysAgo(5),
                            Labels.taskBasedExplanation: Labels.daysAgo(5),
                            Labels.carolinaTerner: Labels.daysAgo(5),
                          }
                              .entries
                              .map(
                                (e) => Column(children: [
                                  ListTile(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    title: Text(
                                      e.key,
                                    ),
                                    subtitle: Text(e.value),
                                  ),
                                  Divider(
                                    thickness: 1,
                                    indent: 24,
                                  )
                                ]),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: scheme.surface,
                        shadows: [
                          BoxShadow(blurRadius: 16, color: theme.shadowColor)
                        ]),
                    margin: const EdgeInsets.all(24),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          hintText: Labels.tryToFind),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
