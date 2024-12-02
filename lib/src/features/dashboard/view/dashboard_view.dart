import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/features/dashboard/widget/clock.dart';
import 'package:myapp/src/features/dashboard/widget/todo_list.dart';
import 'package:myapp/src/network/model/users.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/services/firebase_authentication.dart';
import 'package:myapp/src/theme/styles.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final FirebaseAuthenticationServices _authServices =
      FirebaseAuthenticationServices();
  Users? user;

  String getCurrentTime() {
    final DateTime now = DateTime.now();
    final int hour = now.hour;
    return hour < 12
        ? 'Good Morning'
        : hour < 17
            ? 'Good Afternoon'
            : 'Good Evening';
  }

  Future<void> _fetchUserDetails() async {
    final userDetails = await _authServices.getUserDetails();
    setState(() {
      user = userDetails;
    });
  }

  Future<void> _handleLogout() async {
    await _authServices.signOut();
    AppCoordinator.showLoginScreen();
  }

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: user == null
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenHeight / 4,
                      color: AppColors.textHighLight,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(
                              Assets.svgs.duplicateCirclesAlt,
                              semanticsLabel: "Duplicate circles alt",
                              width: 150,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 10),
                              child: GestureDetector(
                                onTap: _handleLogout,
                                child: Text(
                                  'Log out',
                                  style: AppStyles.semiBoldText
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 55),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    Assets.pngs.defaultAvatar.path,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Welcome, ${user!.fullName}',
                                  style: AppStyles.boldText
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Spacer(),
                                  Text(
                                    getCurrentTime(),
                                    style: AppStyles.semiBoldText
                                        .copyWith(fontSize: 12),
                                  ),
                                ],
                              ),
                              const CurrentClock(),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Task list',
                                    style: AppStyles.semiBoldText.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const TodoList()
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
