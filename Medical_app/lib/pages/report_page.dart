import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/style/app_style.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: Text(
                "Report",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 20),
            FadeInLeft(
              delay: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue[100]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Heart Rate',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    Row(
                      children: [
                        const Text(
                          '96',
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'bpm',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 40),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                            child: Image.asset(AppStyle.heartBeat))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BounceInLeft(
                  delay: const Duration(milliseconds: 1000),
                  child: const BodyMassWidget(
                    color: Color.fromARGB(255, 253, 209, 214),
                    img: AppStyle.blood,
                    title: 'Blood Group',
                    mainText: 'A+',
                  ),
                ),
                BounceInRight(
                  delay: const Duration(milliseconds: 1000),
                  child: const BodyMassWidget(
                    color: Color.fromARGB(255, 253, 235, 180),
                    img: AppStyle.weight,
                    title: 'Weight',
                    mainText: '80 kg',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            FadeInLeft(
              delay: const Duration(milliseconds: 1100),
              child: Text(
                "Test Report",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 25),
            FadeInUp(
              child: _testReportWidget(Colors.blue[100], AppStyle.reportIcon,
                  Colors.blue[900], 'General Health', '8 files'),
            ),
            const SizedBox(height: 15),
            FadeInUp(
              child: _testReportWidget(Colors.teal[100], AppStyle.reportIcon,
                  Colors.teal[900], 'Test Cases', '2 files'),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyMassWidget extends StatelessWidget {
  const BodyMassWidget({
    super.key,
    required this.color,
    required this.img,
    required this.title,
    required this.mainText,
  });
  final Color color;
  final String img;
  final String title;
  final String mainText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                img,
                height: 30,
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            mainText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          )
        ],
      ),
    );
  }
}

Widget _testReportWidget(color, icon, iconColor, title, subtitle) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    elevation: 5,
    child: Container(
        padding: const EdgeInsets.all(12),
        height: 110,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: color),
                  child: Center(
                    child: SvgPicture.asset(
                      AppStyle.reportIcon,
                      color: iconColor,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert)
              ],
            )
          ],
        )),
  );
}
