import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/network_layer/firebase_utils.dart';
import 'package:todo/core/widgets/custom_text_form_field.dart';
import 'package:todo/model/task_model.dart';

class NewTaskBottomSheet extends StatefulWidget {
  const NewTaskBottomSheet({super.key});

  @override
  State<NewTaskBottomSheet> createState() => _NewTaskBottomSheetState();
}

class _NewTaskBottomSheetState extends State<NewTaskBottomSheet> {
  late TextEditingController taskTitleController;
  late TextEditingController taskDescriptionController;
  var formKey = GlobalKey<FormState>();
  DateTime taskSelectedDate = DateTime.now();
  late DateTime taskSelectedTime;

  @override
  void initState() {
    taskTitleController = TextEditingController();
    taskDescriptionController = TextEditingController();
    taskSelectedTime = DateTime(
      taskSelectedDate.year,
      taskSelectedDate.month,
      taskSelectedDate.day,
      TimeOfDay.now().hour,
      TimeOfDay.now().minute,
    );
    super.initState();
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Add new Task',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge!
                    .copyWith(color: theme.primaryColor),
              ),
            ),
            const SizedBox(height: 10),
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    title: 'Enter title',
                    textEditingController: taskTitleController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'You must provide task title';
                      } else if (value.length < 10) {
                        return 'Task title must be at least 10 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Enter description',
                    textEditingController: taskDescriptionController,
                    maxLines: 4,
                    validator: (String? value) {
                      if (taskDescriptionController.text.trim().isEmpty) {
                        return 'You must provide description';
                      } else if (taskDescriptionController.text.length > 100) {
                        return 'Description must not be more than 100 characters';
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Select Date',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => pickDate(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 110),
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.colorScheme.background.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  DateFormat.yMMMd().format(taskSelectedDate),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Select Time', style: theme.textTheme.bodyLarge),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => pickTime(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 120),
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.colorScheme.background.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  TimeOfDay(
                          hour: taskSelectedTime.hour,
                          minute: taskSelectedTime.minute)
                      .format(context),
                  style: TextStyle(color: theme.colorScheme.onSecondary),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: MaterialButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var task = TaskModel(
                      title: taskTitleController.text,
                      description: taskDescriptionController.text,
                      date: taskSelectedDate,
                      time: taskSelectedTime,
                      isDone: false,
                    );

                    await FirebaseUtils.addTaskToFirestore(task);

                    Navigator.pop(context);
                  }
                },
                color: theme.primaryColor,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text('Add Task', style: theme.textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }

  pickDate() async {
    var dateSelected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (dateSelected != null) {
      taskSelectedDate = dateSelected;
      setState(() {});
    }
  }

  pickTime() async {
    var timeSelected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (timeSelected != null) {
      taskSelectedTime = DateTime(
        taskSelectedDate.year,
        taskSelectedDate.month,
        taskSelectedDate.day,
        timeSelected.hour,
        timeSelected.minute,
      );
      setState(() {});
    }
  }
}
