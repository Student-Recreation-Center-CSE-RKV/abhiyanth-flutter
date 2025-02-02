
import 'package:abhiyanth/models/culturals_model.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:flutter/material.dart';


class CulturalDetailPage extends StatefulWidget {
  const CulturalDetailPage({super.key, required this.cultural});
  final CulturalsModel cultural;

  @override
  State<CulturalDetailPage> createState() => _CulturalDetailPageState();
}

class _CulturalDetailPageState extends State<CulturalDetailPage> {
  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(SizeConfig.screenHeight * 0.015),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: SizeConfig.safeBlockHorizontal * 4),
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
                          horizontal: SizeConfig.safeBlockHorizontal * 5,
                          vertical: SizeConfig.safeBlockVertical * 1.5),
                      child: Text(
                        widget.cultural.name.toString(),
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
              ),
              Container(
                height: SizeConfig.screenHeight * 0.45,
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 30,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(widget.cultural.images.mainImage.toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Container(
                          height: SizeConfig.blockSizeVertical * 14,
                          width: SizeConfig.screenWidth * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.cultural.images.descImageLeft.toString()),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: SizeConfig.blockSizeVertical * 14,
                          width: SizeConfig.screenWidth * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.cultural.images.descImageRight.toString()),
                                fit: BoxFit.cover),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Stall Name
              Text(
                widget.cultural.name ?? "Unnamed Stall",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 8),

              // Stall Owner
              Text(
                "Date: ${widget.cultural.date.day}-${widget.cultural.date.month}-${widget.cultural.date.year}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 8),

                Text(
                  "Timings:  ${widget.cultural.date.hour % 12}:${widget.cultural.date.minute.toString().padLeft(2, '0')} ${widget.cultural.date.hour < 12 ? 'AM' : 'PM'}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: "Audiowide"),
                ),

              const SizedBox(height: 16),
              Text(
                "Venue : ${widget.cultural.venue}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 16),
                Text(widget.cultural.mainDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Audiowide",
                    ),
                    textAlign: TextAlign.justify),

              const SizedBox(height: 16),

                Text(widget.cultural.mainDescription,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Audiowide",
                    ),
                    textAlign: TextAlign.justify),
              if (widget.cultural.organizers.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Organizers",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontFamily: "Audiowide")),
                    const SizedBox(height: 8),
                    ...widget.cultural.organizers.map((item) {
                      return Padding(
                        padding:
                        EdgeInsets.all(SizeConfig.blockSizeHorizontal * 1),
                        child: Row(children: [
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.02,
                          ),
                          Icon(
                            Icons.circle_outlined,
                            size: 14,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth * 0.03,
                          ),
                          Text(
                            '${item.name}-${item.mobile}',
                            style: TextStyle(
                                fontFamily: "Audiowide",
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ]),
                      );
                    })
                  ],
                ),

              const SizedBox(height: 16),

              // Offers
              if (widget.cultural.results .isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Special Offers",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontFamily: "Audiowide")),
                    const SizedBox(height: 8),
                    Column(
                      children: widget.cultural.results
                          .map((offer) => Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            const Icon(Icons.circle_outlined,
                                color: Colors.green),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                offer,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Audiowide",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                          .toList(),
                    ),
                  ],
                ),

              const SizedBox(height: 16),

              // Contact Details
              // if (widget.stall.contact != null &&
              //     widget.stall.contact!.isNotEmpty)
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       const Text("Contact",
              //           style: TextStyle(
              //               fontSize: 18,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.blueAccent,
              //               fontFamily: "Audiowide")),
              //       const SizedBox(height: 8),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: widget.stall.contact!.entries.map((entry) {
              //           return Padding(
              //             padding: const EdgeInsets.symmetric(vertical: 4.0),
              //             child: Text(
              //               "${entry.key}: ${entry.value}",
              //               style: const TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.w500,
              //                   fontFamily: "Audiowide",
              //                   color: Colors.white),
              //             ),
              //           );
              //         }).toList(),
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
    );
  }

}
