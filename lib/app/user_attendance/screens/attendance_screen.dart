// ignore_for_file: prefer_const_constructors

import 'package:attendance_app/app/master_location/screens/setting_master_location_screen.dart';
import 'package:attendance_app/app/user_attendance/models/attendance_model.dart';
import 'package:attendance_app/app/user_attendance/state/user_attendance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider/user_attendance_provider.dart';

class AttendanceScreen extends HookConsumerWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(userAttendanceProvider, (previous, next) {
      var snackBar;
      if (next is AttendanceSuccess) {
        snackBar = SnackBar(
          content: Text(next.message),
        );

        // Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      if (next is AttendanceFailed) {
        snackBar = SnackBar(
          content: Text(next.message),
        );

        // Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

    var state = ref.watch(userAttendanceProvider);
    var notifier = ref.watch(userAttendanceProvider.notifier);

    var focusDay = useState(DateTime.now());
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Presensi",
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingMasterlocationScreen()));
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: screen.width,
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Hi, Selamat Datang",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Silakan check in kehadiranmu hari ini!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                color: Colors.white,
                child: TableCalendar<AttendanceModel>(
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                  focusedDay: focusDay.value,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  weekendDays: const [DateTime.saturday, DateTime.sunday],
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: (selectedDay, focusedDay) async {
                    focusDay.value = selectedDay;
                    await notifier.changeDate(focusDay.value);
                  },
                  selectedDayPredicate: (day) => isSameDay(day, focusDay.value),
                  enabledDayPredicate: (day) {
                    return day.day <= DateTime.now().day;
                  },
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      if (day.weekday == DateTime.saturday || day.weekday == DateTime.sunday) {
                        final text = DateFormat.E().format(day);
                        return Center(
                          child: Text(
                            text,
                            style: TextStyle(color: Colors.red),
                          ),
                        );
                      }
                    },

                    // defaultBuilder: (context, day, focusedDay) {},
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                color: Colors.white,
                width: screen.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                          color: Colors.black12,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CHECK IN",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              state.maybeWhen(
                                loading: () => SizedBox(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.black87,
                                    highlightColor: Colors.grey,
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                loaded: (model) {
                                  return Text(
                                    model.checkInStatus ? DateFormat("hh:mm").format(model.checkInAt!) : "-",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                                orElse: () {
                                  return Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "CHECK OUT",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              state.maybeWhen(
                                loaded: (model) {
                                  return Text(
                                    model.checkOutStatus ? DateFormat("hh:mm").format(model.checkOutAt!) : "-",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                                orElse: () {
                                  return Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    state.maybeWhen(
                      loaded: (model) => ElevatedButton(
                        onPressed: () async {
                          if (model.checkInStatus == false) {
                            await notifier.checkIn();
                          } else if (model.checkOutStatus == false) {
                            await notifier.checkOut();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                        child: (model.checkInStatus == false)
                            ? Text('Check In')
                            : (model.checkOutStatus == false)
                                ? Text('Check Out')
                                : Text("Selesai"),
                      ),
                      loading: () => ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // <-- Radius
                          ),
                        ),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      orElse: () => SizedBox(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
