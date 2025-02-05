import 'package:flutter/material.dart';
import 'package:abhiyanth/widgets/dev_card.dart';

class AboutUsPage extends StatelessWidget {
  final List<Map<String, dynamic>> devTeams = [
    {
      "category": "Mobile Devs",
      "developers": [
        {
          "name": "S. Asif Basha",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/asif.jpeg",
          "socials": {
            "github": "https://github.com/sayyad-asifbasha",
            "linkedin":
                "https://www.linkedin.com/in/sayyad-asifbasha-b15731305/",
            "instagram": "https://www.instagram.com/sayyad._.asif._/",
          },
        },
        {
          "name": "Venkata Phanindra",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/phani.jpeg",
          "socials": {
            "github": "https://github.com/venkataPhanindraVutla",
            "linkedin": "https://www.linkedin.com/in/phanindra-vutla/",
            "instagram": "https://www.instagram.com/self._name_/",
          },
        },
        {
          "name": "Syed Sahil",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/sahel.jpeg",
          "socials": {
            "github": "https://github.com/SyedShahil",
            "linkedin": "https://www.linkedin.com/in/syed-sahil-076546286/",
            "instagram": "https://www.instagram.com/______s_a_i_f_______05/#",
          },
        },
      ],
    },
    {
      "category": "Backend Devs",
      "developers": [
        {
          "name": "Shaik Azad",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/azad.jpg",
          "socials": {
            "github": "https://github.com/Azad99-9",
            "linkedin": "https://www.linkedin.com/in/shaik-azad-4505b7240/",
            "instagram": "https://instagram.com/revanth_kumar_j",
          },
        },
        {
          "name": "B.Nagarjuna",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/nagarjuna.jpg",
          "socials": {
            "github": "https://github.com/Nagarjuna0033",
            "linkedin": "https://www.linkedin.com/in/nagarjuna3/",
          },
        },
      ],
    },
    {
      "category": "UI/UX Team",
      "developers": [
        {
          "name": "S.Md.Ishrath",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/ishrath.jpeg",
          "socials": {
            "github": "https://github.com/IshrathAsh",
            "linkedin": "http://linkedin.com/in/shaikmahammadishrath",
            "instagram": "https://www.instagram.com/ishrath_ash/",
          },
        },
        {
          "name": "B.Naga Pavan",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/pavan.jpeg",
          "socials": {
            "github": "https://github.com/Naga-Pavan-Bhuma",
            "linkedin": "https://www.linkedin.com/in/bhuma-naga-pavan/",
            "instagram": "https://www.instagram.com/nagapavan_8/",
          },
        },
        {
          "name": "Sam Chitrala",
          "image":
              "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/sam.jpeg",
          "socials": {
            "github": "https://github.com/SamChitrala",
            "linkedin": "https://www.linkedin.com/in/samify-design-91b416305/",
          },
        },
      ],
    },
    {
      "category": "Frontend Devs",
      "developers": [
        {
          "name": "J.Revanth Kumar",
          "image": "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/revanth.jpeg",
          "socials": {
            "github": "https://github.com/revanthkumarJ",
            "linkedin": "https://www.linkedin.com/in/jilakararevanthkumar/",
            "instagram": "https://instagram.com/revanth_kumar_j",
          },
        },
        {
          "name": "V.Achyutha",
          "image": "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/achyutha.jpeg",
          "socials": {
            "github": "https://github.com/AchyuthaVikaram",
            "linkedin": "https://www.linkedin.com/in/achyuthavikaram",
            "instagram": "https://www.instagram.com/_lightening_rose__/",
          },
        },
        {
          "name": "T.Srikanth",
          "image": "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/sreekanth.jpeg",
          "socials": {
            "github": "https://github.com/THOTA-SRIKANTH",
            "linkedin": "https://www.linkedin.com/in/thota-srikanth-725757280/",
          },
        },
        {
          "name": "S.Rakshita",
          "image": "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/rakshitha.jpeg",
          "socials": {
            "github": "https://github.com/Rakshita4121",
            "linkedin":
                "https://www.linkedin.com/in/rakshita-reddy-singam-8136a7280/",
            "instagram": "https://www.instagram.com/singam_rakshitareddy/",
          },
        },
        {
          "name": "M.Rajeswari",
          "image": "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/rajeswari.jpeg",
          "socials": {
            "github": "https://github.com/Rajeswari-Machina",
            "linkedin": "https://www.linkedin.com/in/rajeswari-machina",
          },
        },
        {
          "name": "N.Thanisha",
          "image": "https://raw.githubusercontent.com/Student-Recreation-Center-CSE-RKV/Abhiyanth-Client/refs/heads/main/src/assets/images/ourTeam/tanisha.jpeg",
          "socials": {
            "github": "https://github.com/thanishanitturu",
            "linkedin":
                "https://www.linkedin.com/in/thanisha-nitturu-0412b22a2",
            "instagram": "https://www.instagram.com/niitturu_thanisha_reddy/",
          },
        },
      ],
    },
  ];

  AboutUsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: devTeams.map((team) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(team["category"],
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: team["developers"].map<Widget>((dev) {
                    return DevCard(dev: dev);
                  }).toList(),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
