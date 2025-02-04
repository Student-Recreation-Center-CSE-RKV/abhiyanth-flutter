import 'package:abhiyanth/widgets/event_card_widget.dart';
import 'package:abhiyanth/widgets/glowing_logo.dart';
import 'package:abhiyanth/widgets/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:abhiyanth/services/size_config.dart';
import 'package:abhiyanth/utilities/gradient_background.dart';
import '../providers/culturals_provider.dart';

class CulturalsPage extends ConsumerStatefulWidget {
  const CulturalsPage({super.key});
  @override
  ConsumerState<CulturalsPage> createState() => _CulturalsPageState();
}

class _CulturalsPageState extends ConsumerState<CulturalsPage> {
  @override
  void initState() {
    super.initState();

    // Fetch ongoing culturals when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(culturalsProvider.notifier).fetchCulturals();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // Watch the ongoing culturals state
    final culturalsState = ref.watch(culturalsProvider);

    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Abhiyanth 2K25",
            style: TextStyle(
              fontFamily: "Audiowide",
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
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
        body: culturalsState.when(
            data: (culturals) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.safeBlockVertical * 2),
                    const Text(
                      "Ongoing Culturals",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 22,
                        fontFamily: "Audiowide",
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    ...culturals.map((cultural){
                      if(cultural.status=="live"){
                        return AuditionCard(cultural: cultural);
                      }
                      else {
                        return Container();
                      }
                    }),
                    const SizedBox(height: 16),
                    const Text(
                      "Upcoming Culturals",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 22,
                        fontFamily: "Audiowide",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...culturals.map((cultural){
                      if(cultural.status!="live"){
                        return AuditionCard(cultural: cultural);
                      }
                      else {
                        return Container();
                      }
                    }),
                  ],
                ),
              );
            },
            error:
              (error, _) {
                return Center(
                    child: Text(
                      "Error loading events: $error",
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
              },
            loading: () => const Center(
              child : BlinkingLogo(logoPath: "assets/images/Abhiyanthlogo2.png",),
              // child: CircularProgressIndicator(color: Colors.white),
            ),),
      ),
    );
  }
}
