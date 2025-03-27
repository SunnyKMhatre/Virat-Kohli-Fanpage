import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_fanpage/common_widget/family_container.dart';
import 'package:vk_fanpage/controller/family_controller.dart';

class Family_Home extends StatelessWidget {
  const Family_Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FamilyController>();
    return Scaffold(
      body: controller.responce == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: CommonContainer(
                  familyname: "About Virat Kohli",
                  image: controller.responce!.isNotEmpty
                      ? (controller.responce![0].image ?? "No Data")
                      : "No Data",
                  details:
                      "\t\t\t\t\tVirat Kohli is an Indian cricketer and one of the greatest batsmen of all time. Born on November 5, 1988, he has captained India across all formats, leading them to historic victories. Known for his aggressive gameplay and consistency, he has broken several records and won multiple ICC awards. Off the field, he is known for his charity work and influence in fitness and fashion.\n\t\t\t\t\tKohli’s career is filled with achievements, including leading India to victory in the 2008 U19 World Cup, playing a key role in the 2011 World Cup win, and helping India lift the 2013 Champions Trophy. He was the highest run-scorer in the 2023 World Cup and ended his T20I career with a match-winning knock in India’s 2024 T20 World Cup triumph.",
                  photowith: "More About Family",
                  bottomImages: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Father()));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/Circle_Father.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Mother()));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/Circle_Mother.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Wife()));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/Circle_Wife.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Brother()));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/Circle_Brother.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Sister()));
                      },
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          "assets/Circle_Sister.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
            ),
    );
  }
}

class Father extends StatelessWidget {
  const Father({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FamilyController>();
    return Scaffold(
      body: controller.responce == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: CommonContainer(
                  familyname: "Father: Prem Kohli",
                  image: controller.responce!.isNotEmpty
                      ? (controller.responce![4].image ?? "No Data")
                      : "No Data",
                  details:
                      "\t\t\t\t\tPrem Kohli was the father of Indian cricketer Virat Kohli. He was a criminal lawyer by profession and played a crucial role in supporting Virat's early cricketing journey. Prem Kohli recognized his son's talent at a young age and enrolled him in the West Delhi Cricket Academy. His untimely passing in 2006, when Virat was just 18 years old, was a deeply emotional moment for the cricketer. Despite the loss, Virat showed immense resilience, even playing a crucial Ranji Trophy match on the very next day of his father’s demise. Virat often credits his father for instilling discipline and dedication in him, which helped shape his career.",
                  photowith: "Photos with Father",
                  bottomImages: [
                    "assets/fatherpic1.jpg",
                    "assets/fatherpic2.jpg",
                    "assets/fatherpic3.jpg",
                    "assets/fatherpic4.jpg",
                  ]),
            ),
    );
  }
}

class Mother extends StatelessWidget {
  const Mother({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FamilyController>();
    return Scaffold(
      body: controller.responce == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: CommonContainer(
                  familyname: "Mother: Saroj Kohli",
                  image: controller.responce!.isNotEmpty
                      ? (controller.responce![1].image ?? "No Data")
                      : "No Data",
                  details:
                      "\t\t\t\t\tVirat Kohli's mother, Saroj Kohli, has been a strong pillar of support in his life. She is a homemaker and played a crucial role in raising Virat with discipline and values. After the passing of Virat’s father in 2006, she remained a source of strength for the family and encouraged Virat to stay focused on his cricketing career. Virat has often mentioned how his mother has been his emotional anchor, providing him with unconditional love and support. Despite his fame and success, he shares a close bond with her and frequently expresses his gratitude for her sacrifices.",
                  photowith: "Photos with Mother",
                  bottomImages: [
                    "assets/MotherPic1.jpg",
                    "assets/MotherPic2.jpg",
                    "assets/MotherPic3.jpg",
                    "assets/MotherPic4.jpg",
                    "assets/MotherPic5.jpg",
                  ]),
            ),
    );
  }
}

class Wife extends StatelessWidget {
  const Wife({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FamilyController>();
    return Scaffold(
      body: controller.responce == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: CommonContainer(
                  familyname: "Wife: Anushka Sharma",
                  image: controller.responce!.isNotEmpty
                      ? (controller.responce![3].image ?? "No Data")
                      : "No Data",
                  details:
                      "\t\t\t\t\tVirat Kohli’s wife, Anushka Sharma, is a renowned Indian actress, producer, and entrepreneur. She was born on **May 1, 1988**, and is one of the most successful actresses in Bollywood. Anushka and Virat met during a commercial shoot in 2013 and soon developed a strong bond. After years of dating, they got married in a private ceremony in **Italy on December 11, 2017**. The couple welcomed their daughter, **Vamika**, in January 2021. Anushka has been a constant source of support for Virat, often seen cheering for him during matches. She has also co-founded the production company **Clean Slate Filmz** and is actively involved in philanthropy and business ventures.",
                  photowith: "Photos with Mother",
                  bottomImages: [
                    "assets/WifePics1.jpg",
                    "assets/WifePics2.jpg",
                    "assets/WifePics3.jpg",
                    "assets/WifePics4.jpg",
                    "assets/WifePics5.jpg"
                  ]),
            ),
    );
  }
}

class Brother extends StatelessWidget {
  const Brother({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FamilyController>();
    return Scaffold(
      body: controller.responce == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: CommonContainer(
                  familyname: "Brother: Vikas Kohli",
                  image: controller.responce!.isNotEmpty
                      ? (controller.responce![6].image ?? "No Data")
                      : "No Data",
                  details:
                      "\t\t\t\t\tVirat Kohli’s elder brother, Vikas Kohli, is a businessman based in Delhi. While he did not pursue a career in cricket, he has always been supportive of Virat’s journey in the sport. Vikas played a key role in Virat’s early years, often accompanying him to practice sessions and matches. He is known for maintaining a low profile and staying away from the limelight, focusing on his business and family life. Despite Virat’s global fame, the two share a close bond, and Vikas continues to be a strong pillar of support in his younger brother’s life.",
                  photowith: "Photos with Mother",
                  bottomImages: [
                    "assets/BrotherPic1.jpg",
                    "assets/BrotherPic2.jpg",
                    "assets/BrotherPic3.jpg",
                    "assets/BrotherPic4.jpg",
                    "assets/BrotherPic5.jpg"
                  ]),
            ),
    );
  }
}

class Sister extends StatelessWidget {
  const Sister({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FamilyController>();
    return Scaffold(
      body: controller.responce == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: CommonContainer(
                  familyname: "Sister: Bhavna Kohli Dhingra",
                  image: controller.responce!.isNotEmpty
                      ? (controller.responce![5].image ?? "No Data")
                      : "No Data",
                  details:
                      "\t\t\t\t\tVirat Kohli’s elder sister, Bhavna Kohli Dhingra, is a businesswoman and a homemaker based in Delhi. She has always been a strong supporter of Virat’s cricketing journey and played a nurturing role in his upbringing. Bhavna shares a close bond with Virat and often expresses her pride in his achievements. Despite staying away from the media spotlight, she occasionally shares glimpses of their family moments on social media. She is married and has a family of her own, but she continues to be a source of encouragement and support for Virat.",
                  photowith: "Photos with Mother",
                  bottomImages: [
                    "assets/SisterPics1.jpg",
                    "assets/SisterPics2.jpg",
                    "assets/SisterPics3.jpg",
                    "assets/SIsterPics4.jpg",
                  ]),
            ),
    );
  }
}
