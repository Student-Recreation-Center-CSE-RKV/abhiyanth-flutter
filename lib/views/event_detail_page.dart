import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/views/register_page.dart';
import 'package:abhiyanth/widgets/map_widget.dart';
import 'package:flutter/material.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:latlong2/latlong.dart';

class EventDetailPage extends StatelessWidget {
  final Map<String, dynamic> event;

  const EventDetailPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Center(
            child: Text(
              event['title'] ?? 'Event Details',
              style: TextStyle(
                fontFamily: "Audiowide",
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal * 5.5,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (event['image'] != null)
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: Image.network(
                      event['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Text(
                  event['description'] ?? 'No Description',
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                    fontFamily: "Audiowide",
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Divider(height: 1,color: Colors.white60,),
                SizedBox(height: SizeConfig.blockSizeVertical * 2),
                Table(
                  columnWidths: {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(2),
                  },
                  children: [
                    _buildTableRow('Department:', event['department'] ?? 'N/A'),
                    _buildTableRow(
                        'Start Date :', event['start_date_formatted'] ?? 'N/A'),
                    _buildTableRow(
                        'End Date :', event['end_date_formatted'] ?? 'N/A'),
                    _buildTableRow(
                        'First Prize :', '₹${event['prize_money'] ?? 'N/A'}'),
                    if (event['second_prize'] != null)
                      _buildTableRow(
                          'Second Prize :', '₹${event['second_prize']}'),
                    _buildTableRow(
                        'Entry Fee :', '₹${event['entry_fee'] ?? 'N/A'}'),
                    _buildTableRow('Team Size:', event['team_size'] ?? 'N/A'),
                    if (event['deadline_formatted'] != null)
                      _buildTableRow(
                          'Deadline :', event['deadline_formatted'] ?? 'N/A'),
                    if (event['sponsors'] != null && event['sponsors'] is List)
                      _buildTableRow(
                          'Sponsors :', (event['sponsors'] as List).join(', ')),
                    if (event['result'] != null && event['result'] is List)
                      _buildTableRow(
                          'Results :', (event['result'] as List).join(', ')),
                  ],
                ),
                // if (event['location'] != null)
                //   LocationMap(
                //     location: LatLng(
                //       event['location'].latitude,
                //       event['location'].longitude,
                //     ),
                //   ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(eventTitle: event['title']),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFFFF3366),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeHorizontal * 2.5),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical * 0.7,
                      horizontal: SizeConfig.blockSizeHorizontal * 1.75,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the row takes only as much space as needed
                    children: [
                      Text(
                        "Register Now",
                        style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                        ),
                      ),
                      SizedBox(
                          width: SizeConfig.blockSizeHorizontal *
                              1), // Optional spacing between text and icon
                      Icon(
                        Icons.arrow_outward_outlined,
                        size: SizeConfig.blockSizeHorizontal *5, // Adjust icon size if needed
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],

            ),
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              label,
              style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 4,
                fontFamily: "Audiowide",
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical * 1),
          child: Text(
            value,
            style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4,
              fontFamily: "Audiowide",
              color: Colors.white60,
            ),
          ),
        ),
      ],
    );
  }
}
