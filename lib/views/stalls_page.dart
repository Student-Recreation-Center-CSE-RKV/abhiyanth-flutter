import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abhiyanth/views/stall_details_page.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import 'package:abhiyanth/providers/stalls_provider.dart';

class StallsPage extends ConsumerWidget {
  const StallsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig.init(context);
    final stallsState = ref.watch(stallsProvider);

    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth Stalls",
            style: TextStyle(
              fontFamily: "Audiowide",
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
            iconSize: SizeConfig.safeBlockHorizontal * 6,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 4),
          child: stallsState.when(
            data: (stalls) => GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two stalls per row
                childAspectRatio: 0.7, // Adjusted aspect ratio
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: stalls.length,
              itemBuilder: (context, index) {
                final stall = stalls[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StallDetailPage(stall: stall),
                      ),
                    );
                  },
                  child: Column(children: <Widget>[
                    Container(
                      height: SizeConfig.screenHeight * 0.18,
                      width: SizeConfig.screenWidth * 0.45,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(stall.image.toString()),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(SizeConfig.screenWidth * 0.03),
                            topRight:
                                Radius.circular(SizeConfig.screenWidth * 0.03)),
                      ),
                    ),
                    Container(
                      height: SizeConfig.screenHeight * 0.07,
                      width: SizeConfig.screenWidth * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(SizeConfig.screenWidth * 0.03),
                            bottomRight:
                                Radius.circular(SizeConfig.screenWidth * 0.03)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal*0.4),
                        child: Center(
                          child: Text(
                            stall.name!,
                            style: TextStyle(
                              fontFamily: "Audiowide",
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ]),
                  // child: Card(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(12)),
                  //   elevation: 4,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       ClipRRect(
                  //         borderRadius: const BorderRadius.vertical(
                  //             top: Radius.circular(10)),
                  //         child: stall.image != null
                  //             ? Image.network(
                  //                 stall.image!,
                  //                 width: double.infinity,
                  //                 height: SizeConfig.screenHeight * 0.14,
                  //                 fit: BoxFit.cover,
                  //                 loadingBuilder:
                  //                     (context, child, loadingProgress) {
                  //                   if (loadingProgress == null) return child;
                  //                   return Center(
                  //                     child: CircularProgressIndicator(
                  //                       value: loadingProgress
                  //                                   .expectedTotalBytes !=
                  //                               null
                  //                           ? loadingProgress
                  //                                   .cumulativeBytesLoaded /
                  //                               (loadingProgress
                  //                                       .expectedTotalBytes ??
                  //                                   1)
                  //                           : null,
                  //                     ),
                  //                   );
                  //                 },
                  //                 errorBuilder: (context, error, stackTrace) =>
                  //                     Container(
                  //                   width: double.infinity,
                  //                   height: 130,
                  //                   color: Colors.grey[300],
                  //                   child: const Icon(Icons.image_not_supported,
                  //                       size: 50),
                  //                 ),
                  //               )
                  //             : Container(
                  //                 width: double.infinity,
                  //                 height: 130,
                  //                 color: Colors.grey[400],
                  //                 child: const Icon(Icons.image_not_supported,
                  //                     size: 50),
                  //               ),
                  //       ),
                  //       Align(
                  //         alignment: Alignment.bottomCenter,
                  //         child: Text(
                  //           stall.name ?? "Unnamed Stall",
                  //           textAlign: TextAlign.center,
                  //           style: const TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 14,
                  //               fontFamily: "Audiowide"),
                  //           maxLines: 2,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                );
              },
            ),
            loading: () => const Center(child: BlinkingLogo()),
            error: (error, stackTrace) => Center(child: Text("Error: $error")),
          ),
        ),
      ),
    );
  }
}
