import 'package:abhiyanth/models/stalls_model.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:abhiyanth/widgets/gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

class StallDetailPage extends StatefulWidget {
  const StallDetailPage({super.key, required this.stall});
  final StallModel stall;

  @override
  State<StallDetailPage> createState() => _StallDetailPageState();
}

class _StallDetailPageState extends State<StallDetailPage> {
  bool _isLoading = false;
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
                        widget.stall.name.toString(),
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
                            image: NetworkImage(widget.stall.image.toString()),
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
                                    widget.stall.imageLeft.toString()),
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
                                    widget.stall.imageRight.toString()),
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
                widget.stall.name ?? "Unnamed Stall",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 8),

              // Stall Owner
              Text(
                "from ${widget.stall.belongTo ?? "Unknown"}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 8),

              // Timings
              if (widget.stall.timings != null)
                Text(
                  "Timings: ${widget.stall.timings!}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: "Audiowide"),
                ),

              const SizedBox(height: 16),

              // Main Description
              if (widget.stall.mainDescription != null)
                Text(widget.stall.mainDescription!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Audiowide",
                    ),
                    textAlign: TextAlign.justify),

              if (widget.stall.items != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Items",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontFamily: "Audiowide")),
                    const SizedBox(height: 8),
                    ...widget.stall.items!.split(',').map((item) {
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
                            item,
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
              if (widget.stall.offers != null &&
                  widget.stall.offers!.isNotEmpty)
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
                      children: widget.stall.offers!
                          .map((offer) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.local_offer,
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
              if (widget.stall.contact != null &&
                  widget.stall.contact!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contact",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                            fontFamily: "Audiowide")),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.stall.contact!.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "${entry.key}: ${entry.value}",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Audiowide",
                                color: Colors.white),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
            ],
          ),
        ),
        floatingActionButton: widget.stall.menuCard != null
            ? BorderGradient(
                borderWidth: 6.0,
                gradientColors: const [Color(0xFFFF6AB7), Color(0xFF6AE4FF)],
                borderRadius:
                    BorderRadius.circular(SizeConfig.safeBlockHorizontal * 5),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    _showPdfDialog(context, widget.stall.menuCard!);
                  },
                  backgroundColor: Colors.black,
                  label: _isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: BlinkingLogo()
                        )
                      : Text(
                          "View Menu",
                          style: TextStyle(
                              fontFamily: "Audiowide",
                              color: Colors.white,
                              fontSize: 14),
                        ),
                ),
              )
            : null,
      ),
    );
  }

  void _showPdfDialog(BuildContext context, String pdfUrl) async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    final response = await http.get(Uri.parse(pdfUrl));

    if (response.statusCode == 200) {
      Uint8List pdfBytes = response.bodyBytes;
      setState(() {
        _isLoading = false;
      });

      // Show dialog with the PDF content
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              child: Column(
                children: [
                  AppBar(
                    title: const Text(
                      "Menu Card",
                      style: TextStyle(
                          fontFamily: "Audiowide", color: Colors.white),
                    ),
                    backgroundColor: Colors.black,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.all(SizeConfig.blockSizeHorizontal * 2),
                      child: PDFView(
                        pdfData: pdfBytes,
                        enableSwipe: true,
                        swipeHorizontal: false,
                        autoSpacing: false,
                        pageFling: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Handle error if PDF could not be fetched
      print('Failed to load PDF from URL');
      // You can show an alert or a message here
    }
  }
}
