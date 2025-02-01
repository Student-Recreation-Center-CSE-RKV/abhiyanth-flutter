import 'package:abhiyanth/models/stalls_model.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';

void _showPdfDialog(BuildContext context, String pdfUrl) async {
  // Fetch the PDF from the URL
  final response = await http.get(Uri.parse(pdfUrl));

  if (response.statusCode == 200) {
    // If the request is successful, fetch the bytes
    Uint8List pdfBytes = response.bodyBytes;

    // Show dialog with the PDF content
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                AppBar(
                  title: const Text("Menu Card"),
                  backgroundColor: Colors.blue,
                  automaticallyImplyLeading: false,
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                Expanded(
                  child: PDFView(
                    pdfData: pdfBytes, // Pass the PDF bytes here
                    enableSwipe: true,
                    swipeHorizontal: false,
                    autoSpacing: false,
                    pageFling: false,
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

class StallDetailPage extends StatelessWidget {
  final StallModel stall;

  const StallDetailPage({super.key, required this.stall});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            stall.name ?? "Stall Detail",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Audiowide",
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main Stall Image
              if (stall.image != null)
                Image.network(stall.image!,
                    fit: BoxFit.cover, width: double.infinity, height: 200),

              const SizedBox(height: 16),

              // Stall Name
              Text(
                stall.name ?? "Unnamed Stall",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 8),

              // Stall Owner
              Text(
                "from ${stall.belongTo ?? "Unknown"}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "Audiowide"),
              ),

              const SizedBox(height: 8),

              // Timings
              if (stall.timings != null)
                Text(
                  "Timings: ${stall.timings!}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: "Audiowide"),
                ),

              const SizedBox(height: 16),

              // Main Description
              if (stall.mainDescription != null)
                Text(stall.mainDescription!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontFamily: "Audiowide",
                    ),
                    textAlign: TextAlign.justify),

              const SizedBox(height: 16),

              // Offers
              if (stall.offers != null && stall.offers!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Special Offers",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Audiowide")),
                    const SizedBox(height: 8),
                    Column(
                      children: stall.offers!
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
              if (stall.contact != null && stall.contact!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Contact",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "Audiowide")),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: stall.contact!.entries.map((entry) {
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
        floatingActionButton: stall.menuCard != null
            ? FloatingActionButton.extended(
                onPressed: () {
                  _showPdfDialog(context, stall.menuCard!);
                },
                backgroundColor: Colors.black,
                // backgroundColor: LinearGradient(colors: [C]),
                icon: const Icon(Icons.food_bank_outlined, color: Colors.white),
                label: const Text(
                  "View Menu",
                  style:
                      TextStyle(fontFamily: "Audiowide", color: Colors.white),
                ),
              )
            : null,
      ),
    );
  }
}
