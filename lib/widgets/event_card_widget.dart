import 'package:abhiyanth/services/Routes/navigation_service.dart';
import 'package:abhiyanth/services/Routes/routesname.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/models/department_event_model.dart';
import 'package:abhiyanth/services/notification_service.dart';
class AuditionCard extends StatelessWidget {
  final Event? event;
  final String ?title;
  final String ?date;
  final String? time;
  final String? venue;
  final String ?description;
  final String?short_description;
  final String ?image;

   AuditionCard({
    super.key,
    this.event,
     this.title,
     this.date,
     this.time,
     this.venue,
    this.description,
    this.short_description,
    this.image ,
  });
  final NavigationService navigationService=NavigationService();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              Colors.pinkAccent.withOpacity(0.6), // Border with gradient effect
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              Container(
                width: 140,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    event?.image ?? image!,
                    width: 140,
                    height: 100,
                    fit: BoxFit
                        .cover, // Ensures the image fits within the dimensions
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100,
                        height: 100,
                        color:
                            Colors.grey[400],
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 16), // Spacing between image and text
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     event?.title ?? title!,
                      style: const TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Audiowide",
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Date : ${event?.date != null ? "${event!.date.day}-${event!.date.month}-${event!.date.year}": date!}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Audiowide",
                      ),
                    ),
                    Text(
                      'Time : ${event?.date != null ? '${event!.date.hour % 12}:${event!.date.minute.toString().padLeft(2, '0')} ${event!.date.hour < 12 ? 'AM' : 'PM'}': time!}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Audiowide",
                      ),
                    ),
                    Text(
                      'Venue : ${event?.venue ?? venue!}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Audiowide",
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Text(
            event?.short_description ?? short_description!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontFamily: "Audiowide",
            ),
          ),
          SizedBox(height: 10,),

          TextButton(
            onPressed: () {
              navigationService.pushScreen(RoutesName.showEvent,arguments: event);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFFF3366),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    SizeConfig.blockSizeHorizontal * 2.5),
              ),
              padding: EdgeInsets.symmetric(
                vertical: SizeConfig.blockSizeVertical * 1,
                horizontal: SizeConfig.blockSizeHorizontal * 5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // Ensures the row takes only as much space as needed
              children: [
                Text(
                  "Read More",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4,
                    fontFamily: "Audiowide",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
