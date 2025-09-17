import 'package:flutter/material.dart';
import 'package:test_demo/materials/app_colors.dart';
import 'package:test_demo/materials/app_text_styles.dart';
import 'package:test_demo/models/leadModel.dart';
import 'package:test_demo/screens/lead_status_screen.dart';

class LeadDetailsScreen extends StatefulWidget {
  const LeadDetailsScreen({super.key});

  @override
  State<LeadDetailsScreen> createState() => _LeadDetailsScreenState();
}

class _LeadDetailsScreenState extends State<LeadDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String _selectedChip = "Actionable (3)";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final List<LeadModel> leads = [
    LeadModel(
      id: '1',
      name: 'Satish Patil',
      earningOpportunity: "5,530",
      servicesSold: 5,
      products: ['SBI Prime', 'HDFC Freedom', 'Axis MyZone', 'Kiwi'],
      status: "Actionable",
      actionRequired: 'Upload income proof to proceed with your application',
    ),
    LeadModel(
      id: '2',
      name: 'Ajay Potdar',
      earningOpportunity: "5,530",
      servicesSold: 5,
      products: ['SBI Prime Credit Card'],
      status: "Actionable",
      actionRequired: 'Upload income proof to proceed with your application',
    ),
    LeadModel(
      id: '3',
      name: 'Akshata Kenjale',
      earningOpportunity: "5,530",
      servicesSold: 5,
      products: ['SBI Prime Credit Card'],
      status: "Actionable",
      bankLastUpdated: '21 August, 2025',
      nextUpdateExpected: '28 August, 2025',
      delayedDays: 6,
    ),
    LeadModel(
      id: '4',
      name: 'Ninganna',
      earningOpportunity: "5,530",
      servicesSold: 5,
      products: ['SBI Prime Credit Card'],
      status: "Actionable",
      bankLastUpdated: '21 August, 2025',
      nextUpdateExpected: '28 August, 2025',
      delayedDays: 6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondbg,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppColors.secondbg,
          title: Text("Leads", style: AppTextStyles.heading1),
          titleSpacing: 0,
          leading: const Icon(Icons.arrow_back_ios_sharp),
          actions: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "Lead Guide",
                    style: AppTextStyles.bodyText2.copyWith(
                        color: AppColors.buttonBg,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  const SizedBox(width: 5),
                  Icon(Icons.play_circle_rounded,
                      color: AppColors.buttonBg, size: 22),
                  const SizedBox(width: 5),
                ],
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Divider(
                height: 1,
                thickness: 1,
                color: AppColors.divider,
              )),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(13),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search by Name",
                  prefixIcon: const Icon(Icons.search_sharp,),
                  prefixIconColor: Colors.grey.shade400,
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey.shade500),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
          ),

          Container(
            height: 50,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelColor: AppColors.primaryText,
              unselectedLabelColor: Colors.grey.shade600,
              labelStyle: AppTextStyles.tabText,
              indicator: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              tabs: [
                _buildTab("Credit Cards", 20, 0),
                _buildTab("Savings A/C", 10, 1),
                _buildTab("Demat A/C", 10, 2),
              ],
            ),
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Row(
                children: [
                  _buildChip("Actionable",3),
                  const SizedBox(width: 8),
                  _buildChip("Pending",2),
                  const SizedBox(width: 8),
                  _buildChip("Rejected",1),
                  const SizedBox(width: 8),
                  _buildChip("Activated,",0),
                ],
              ),
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildLeadList(leads),
                _buildLeadList(leads),
                _buildLeadList(leads),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Facing an issue? Tap for help',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                  child: const Text(
                    'Need Help',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTab(String title, int count, int index) {
    bool isSelected = _tabController.index == index;

    return Tab(
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyles.unSelectedTabText,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              minimumSize: const Size(25, 20),
              backgroundColor: isSelected ? Colors.red : Colors.grey.shade400,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: AppTextStyles.badgeText,
            ),
            child: Text(
              "$count",
              style: AppTextStyles.badgeText,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildLeadList(List<LeadModel> leads) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: leads.length,
      itemBuilder: (context, index) {
        return LeadCard(leads[index]);
      },
    );
  }

  Widget _buildChip(String text,int count) {
    final bool isSelected = _selectedChip == text;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedChip = text;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : AppColors.secondbg,
          borderRadius: BorderRadius.circular(20),
          border: !isSelected ? Border.all(color: Colors.grey.shade400) : null,
        ),
        child: Text(
          "$text ($count)",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.buttonBg : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget LeadCard(LeadModel lead) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      elevation: 1,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => LeadStatusScreen(lead: lead)));
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(lead.name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  SizedBox(width: 3,),
                  const Icon(Icons.chevron_right),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text("Earning Opportunity: Rs. ${lead.earningOpportunity} ",style: AppTextStyles.bodyText2.copyWith(color: AppColors.goldShade,fontSize: 11,fontWeight: FontWeight.w600),),
                  Text("| Sold: ${lead.servicesSold} Services so far", style: AppTextStyles.bodyText2.copyWith(color: Colors.black87, fontSize: 11,fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 10),
              BuildProductsTabBar(lead.products),
              SizedBox(height: 10,),
              if (lead.actionRequired != null) BuildActionRequired(lead),
              if (lead.bankLastUpdated != null) BuildBankInfo(lead),
              BuildButtons(lead),
            ],
          ),
        ),
      ),
    );
  }

  Widget BuildProductsTabBar(List<String> products) {
    return DefaultTabController(
      length: products.length,
      child: SizedBox(
        height: 40,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: AppColors.primaryText,
            unselectedLabelColor: Colors.grey.shade700,
            labelStyle: AppTextStyles.tabText.copyWith(fontSize: 13),
            // Custom top indicator
            indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              insets: EdgeInsets.zero, // full width of tab
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.symmetric(horizontal: 12), // gap between tabs
            tabs: products.map((product) {
              return Tab(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(product),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget BuildActionRequired(lead){
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 16, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.goldBg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Customer Action Required',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            lead.actionRequired!,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget BuildBankInfo(lead) {
    return Card(
      color: AppColors.lightBluedBg,
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bank Last updated on',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        lead.bankLastUpdated!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expected Next update',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        lead.nextUpdateExpected!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (lead.delayedDays != null) ...[
              const SizedBox(height: 8),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.warning_rounded, color: AppColors.warning, size: 16),
                  const SizedBox(width: 6),
                  Text(
                    'Update from bank is delayed by ${lead.delayedDays} days',
                    style: const TextStyle(fontSize: 11, color: Colors.black87),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }


  Widget BuildButtons(lead){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 7),
      child: Row(
        children: [
          if (lead.actionRequired != null) ...[
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.buttonBg),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                ),
                child: Text(
                  'View Details',
                  style: TextStyle(
                    color: AppColors.buttonBg,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                ),
                child: const Text(
                  'Remind Customer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ] else ...[
            Expanded(
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side:  BorderSide(color: AppColors.buttonBg),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                ),
                child:  Text(
                  'View Details',
                  style: TextStyle(
                    color: AppColors.buttonBg,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
