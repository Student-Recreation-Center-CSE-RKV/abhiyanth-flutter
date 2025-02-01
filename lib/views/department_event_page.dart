import 'package:abhiyanth/providers/department_event_provider.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/constants/Department_Event_Names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../services/size_config.dart';
import '../utilities/gradient_background.dart';
import '../widgets/event_card_widget.dart';
import '../widgets/gradient_border.dart';
import '../widgets/image_slider.dart';

class DepartmentEventPage extends ConsumerStatefulWidget {
  const DepartmentEventPage({Key? key, required this.department})
      : super(key: key);
  final String department;
  @override
  ConsumerState<DepartmentEventPage> createState() => _DepartmentEventState();
}

// class _DepartmentEventState extends ConsumerState<DepartmentEventPage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//      ref.read(DepartmentEventProvider.notifier).fetchTechEvents(widget.department);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig.init(context);
//
//     final techEventsState = ref.watch(DepartmentEventProvider);
//     return GradientBackground(
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//             ),
//           ),
//           leadingWidth: 60,
//           backgroundColor: Colors.transparent,
//           title: const Text(
//             "Abhiyanth 2K25",
//             style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
//           ),
//         ),
//         body: techEventsState.when(
//           data: (events) {
//             final ongoingEvents = events['ongoing'] ?? [];
//             final upcomingEvents = events['upcoming'] ?? [];
//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
//                     child: BorderGradient(
//                       borderWidth: 6.0,
//                       gradientColors: const [
//                         Color(0xFFFF6AB7),
//                         Color(0xFF6AE4FF)
//                       ],
//                       borderRadius: BorderRadius.circular(
//                           SizeConfig.safeBlockHorizontal * 5),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: SizeConfig.safeBlockHorizontal * 15,
//                           vertical: SizeConfig.safeBlockVertical*1.5
//                         ),
//                         child: Text(
//                           '${widget.department} - ${
//                           departments.firstWhere((dept) => dept["code"] == widget.department,)["name"]
//                           }',
//
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: "Audiowide",
//                             fontSize: SizeConfig.safeBlockHorizontal * 5,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.safeBlockVertical * 3),
//                   const Text(
//                     "Ongoing Events",
//                     style: TextStyle(
//                       color: Colors.lightBlueAccent,
//                       fontSize: 22,
//                       fontFamily: "Audiowide",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(height: SizeConfig.safeBlockVertical * 2),
//                   if (ongoingEvents.isNotEmpty)
//                     ImageSliderWidget(
//                       items: ongoingEvents.map((e) {
//                         return {
//                           'image':
//                           e['image'] ?? 'https://via.placeholder.com/150',
//                           'text': e['title'] ?? 'No Title',
//                         };
//                       }).toList(),
//                     )
//                   else
//                     const Center(
//                       child: Text(
//                         "No Ongoing Events",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   const SizedBox(height: 16),
//                   const Text(
//                     "Upcoming Events",
//                     style: TextStyle(
//                       color: Colors.lightBlueAccent,
//                       fontSize: 22,
//                       fontFamily: "Audiowide",
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   ...upcomingEvents.map(
//                         (event) {
//                       return AuditionCard(
//                         image : event['image'] ?? 'https://via.placeholder.com/150',
//                         title: event['title'] ?? 'No Title',
//                         date: event['date'] ?? 'No Date',
//                         time: event['time'] ?? 'No Time',
//                         venue: event['venue'] ?? 'No Venue',
//                         description: event['description'] ?? 'No Description',
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             );
//           },
//           loading: () => Center(
//             child: LoadingAnimationWidget.inkDrop(
//               color: Colors.white,
//               size: SizeConfig.safeBlockHorizontal * 10,
//             ),
//           ),
//           error: (error, _) => Center(
//             child: Text(
//               "Error loading events: $error",
//               style: const TextStyle(color: Colors.red),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class _DepartmentEventState extends ConsumerState<DepartmentEventPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(departmentEventProvider.notifier)
          .fetchTechEvents(widget.department);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    final techEventsState = ref.watch(departmentEventProvider);
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          leadingWidth: 60,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth 2K25",
            style: TextStyle(color: Colors.white, fontFamily: "Audiowide"),
          ),
        ),
        body: techEventsState.when(
          data: (events) {
            final carouselImages = events.departmentCarousel;
            final ongoingEvents = events.ongoingEvents;
            final upcomingEvents = events.upcomingEvents;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
                    child: BorderGradient(
                      borderWidth: 6.0,
                      gradientColors: const [
                        Color(0xFFFF6AB7),
                        Color(0xFF6AE4FF)
                      ],
                      borderRadius: BorderRadius.circular(
                          SizeConfig.safeBlockHorizontal * 5),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal * 15,
                            vertical: SizeConfig.safeBlockVertical * 1.5),
                        child: Text(
                          '${widget.department} - ${departments.firstWhere((dept) => dept["code"] == widget.department)["name"]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Audiowide",
                            fontSize: SizeConfig.safeBlockHorizontal * 5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  if (carouselImages.isNotEmpty)
                    ImageSliderWidget(
                      items: carouselImages.map((e) {
                        return {
                          'image': e,
                        };
                      }).toList(),
                    ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 3),
                  ongoingEvents.isNotEmpty ?const Text(
                    "Ongoing Events",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.w400,
                    ),
                  ):SizedBox(),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2),
                  ...ongoingEvents.map(
                        (event) {
                      return AuditionCard(
                        event: event,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  upcomingEvents.isNotEmpty ?const Text(
                    "Upcoming Events",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 22,
                      fontFamily: "Audiowide",
                      fontWeight: FontWeight.w400,
                    ),
                  ):SizedBox(),
                  const SizedBox(height: 16),
                  ...upcomingEvents.map(
                    (event) {
                      return AuditionCard(
                        event: event,
                      );
                    },
                  ),
                ],
              ),
            );
          },
          loading: () => Center(
            child: LoadingAnimationWidget.inkDrop(
              color: Colors.white,
              size: SizeConfig.safeBlockHorizontal * 10,
            ),
          ),
          error: (error, _) => Center(
            child: Text(
              "Error loading events: $error",
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
