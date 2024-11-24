import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/gen/assets.gen.dart';
import 'package:myapp/src/network/model/users.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/services/firebase_authentication.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final FirebaseAuthenticationServices _authServices =
      FirebaseAuthenticationServices();
  Users? user;

  Future<void> _fetchUserDetails() async {
    final userDetails = await _authServices.getUserDetails();
    setState(() {
      user = userDetails;
    });
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
                      height: screenHeight / 3,
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
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 100),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: AssetImage(
                                    Assets.pngs.defaultAvatar.path,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Welcome, ${user!.fullName}', // user is now guaranteed to be non-null
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('DashBoard Screen'),
                  ],
                ),
              ),
      ),
    );
  }
}
