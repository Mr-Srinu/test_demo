import 'package:flutter/material.dart';
import '../materials/app_colors.dart';
import '../materials/app_text_styles.dart';
import '../models/leadModel.dart';

class LeadStatusScreen extends StatefulWidget {
  final LeadModel lead;

  const LeadStatusScreen({super.key, required this.lead});

  @override
  State<LeadStatusScreen> createState() => _LeadStatusScreenState();
}

class _LeadStatusScreenState extends State<LeadStatusScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> subTabs = ["All", "Actionable", "Pending", "Rejected", "Activated"];
  int selectedChipIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondbg,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

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
                  border: Border(
                    bottom: BorderSide(color: Colors.black, width: 1),
                  ),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                tabs: [
                  _buildTab("Lead Status", 5, 0),
                  _buildTab("Recommended for You", 2, 1),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: [
                    _buildChip("All", 5, 0),
                    const SizedBox(width: 8),
                    _buildChip("Actionable", 3, 1),
                    const SizedBox(width: 8),
                    _buildChip("Pending", 2, 2),
                    const SizedBox(width: 8),
                    _buildChip("Rejected", 1, 3),
                    const SizedBox(width: 8),
                    _buildChip("Activated", 4, 4),
                  ],
                ),
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTabContent(), // Lead Status Tab
                  const Center(child: Text("Recommended for You")),
                ],
              ),
            ),
          ],
        ),
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
          const SizedBox(width: 6),
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

  Widget _buildChip(String text, int count, int index) {
    final bool isSelected = selectedChipIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedChipIndex = index;
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

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColors.secondbg,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.lead.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/whatsapp-1.jpg',
              fit: BoxFit.contain,
              // color: const Color(0xFF25D366),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildLeadCard(),
          _buildApplicationStatus(),
        ],
      ),
    );
  }

  Widget _buildLeadCard() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      color: AppColors.secondbg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            widget.lead.products.first,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            "Earning Opportunity: Rs. ${widget.lead.earningOpportunity}",
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFFB800),
            ),
          ),
          const SizedBox(height: 16),
          if (widget.lead.delayedDays != null)
            BuildBankInfo(widget.lead)
          else
            Row(
              children: [
                _buildUpdateInfo("Last updated on", widget.lead.bankLastUpdated ?? '-'),
                _buildUpdateInfo("Next update", widget.lead.nextUpdateExpected ?? '-'),
              ],
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
                  height: 30, // height of vertical divider
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

            // Horizontal divider
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
  Widget _buildUpdateInfo(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF6C757D),
              )),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }

  Widget _buildApplicationStatus() {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      padding: const EdgeInsets.all(16),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'APPLICATION STATUS',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: (){},
                child: Text('Hide Details',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF007BFF),
                  fontWeight: FontWeight.w500,
                ),
              ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildTimelineItem('Card Activated', false),
          _buildTimelineItem('Card Dispatched', false),
          _buildTimelineItem('Approval Status', false),
          _buildTimelineItem('Application Under Review', true, subtitle: 'Customer Acceptance Pending'),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            color: AppColors.lightBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              child: Row(
                children: [
                  _buildActionButton(Icons.sms, 'SMS', const Color(0xFF007BFF)),
                  const SizedBox(width: 12),
                  _buildActionButton(Icons.message_outlined, 'Whatsapp', const Color(0xFF25D366)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildTimelineItem('Accept Terms & Conditions', true, timestamp: '12 June 2025, 10:15 AM'),
          _buildTimelineItem('Eligibility Check', true, timestamp: '07 June 2025, 3 PM'),
          _buildTimelineItem('Income Proof Submission', true, timestamp: '05 June 2025, 12 PM'),
          _buildTimelineItem('KYC & Verification', true, timestamp: '03 June 2025, 11 AM'),
          _buildTimelineItem('Fill Application Form', true, timestamp: '02 June 2025, 10 AM'),
          _buildTimelineItem('Application Started', true, timestamp: '01 June 2025, 9:30 AM'),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(String title, bool isCompleted,
      {String? subtitle, String? timestamp}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xFF28A745) : Colors.grey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCompleted ? Icons.check : Icons.check_circle_outline,
              size: 20,
              color: isCompleted ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF6C757D)),
                  ),
                if (timestamp != null)
                  Text(
                    timestamp,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF6C757D)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 16),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
