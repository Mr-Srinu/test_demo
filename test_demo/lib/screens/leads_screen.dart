import 'package:flutter/material.dart';
import 'package:test_demo/materials/app_colors.dart';
import 'package:test_demo/materials/app_text_styles.dart';

import 'lead_details_screen..dart';

class LeadsScreen extends StatelessWidget {
  const LeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          leading: const Icon(Icons.arrow_back_ios_sharp),
          title: Text("Leads", style: AppTextStyles.heading1),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Divider(
              thickness: 1,
              color: AppColors.divider,
              height: 1,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal:15 ),
              child: Column(
              children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/magnet.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                "No Leads yet!",
                style: AppTextStyles.heading1,
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Create your first lead & earn upto  ",
                      style: AppTextStyles.bodyText2,
                    ),
                    TextSpan(
                      text: "\u20B95,000",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBg,
                  minimumSize: const Size(double.infinity, 39),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LeadDetailsScreen()));
                },
                child: Text(
                  "Start Generating Leads",
                  style: AppTextStyles.buttonText,
                ),
              ),
              ]
              )
              ),
              const SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.grey.shade300,  // darker at edge
                            Colors.grey.shade100,  // faded near text
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Learn How to Create Leads",
                      style: AppTextStyles.bodyText2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  Expanded(child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors:[
                            Colors.grey.shade100,
                            Colors.grey.shade300
                          ] )
                    ),
                  ))
                ],
              ),

              const SizedBox(height: 10),

              // Promo Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/banner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
