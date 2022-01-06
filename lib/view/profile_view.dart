import 'package:firebasegetex/core/view_model/auth_view_model.dart';
import 'package:firebasegetex/core/view_model/profile_view_model.dart';
import 'package:firebasegetex/view/widget/custemtext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
          init: ProfileViewModel(),
          builder: (controllor) => Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 60.1,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('lib/assets/images/aknik.jpg'),
                                radius: 60,
                              )),
                          Column(
                            children: [
                              GetBuilder<AuthViewModel>(
                                init: AuthViewModel(),
                                builder: (controllor) => CstumText(
                                  fontSize: 32,
                                  text: "", // controllor.id.toString(),
                                ),
                              ),
                              CstumText(
                                fontSize: 24,
                                text: 'oopokni@gmail.com',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.create),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CstumText(
                                    text: "Edit Profile",
                                  )
                                ],
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.maps_home_work_sharp),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CstumText(
                                    text: "Shopping Adress",
                                  )
                                ],
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.alarm),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CstumText(
                                    text: "Order History",
                                  )
                                ],
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.card_travel_rounded),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CstumText(
                                    text: "Cards",
                                  )
                                ],
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.notification_add_outlined),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CstumText(
                                    text: "Notification",
                                  )
                                ],
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        controllor.signOut();
                                      },
                                      child: Icon(Icons.logout)),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  CstumText(
                                    text: "Loug Out",
                                  )
                                ],
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
    );
  }
}
