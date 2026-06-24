import 'package:flutter/material.dart';
import 'package:jobportal/models/ApplicantDetails.dart';
import 'package:jobportal/screens/ChatScreen.dart';
import 'package:jobportal/models/ChatUser.dart';

class ApplicationDetailsScreen extends StatefulWidget {
  final ApplicantDetails applicant;

  const ApplicationDetailsScreen({super.key, required this.applicant});

  @override
  State<ApplicationDetailsScreen> createState() =>
      _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState extends State<ApplicationDetailsScreen> {
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.applicant.status;
  }

  void updateStatus(String status) {
    setState(() {
      selectedStatus = status;
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Status changed to $status')));
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.applicant;

    return Scaffold(
      backgroundColor: const Color(0xff021520),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF02111D), Color(0xFF032C45), Color(0xFF010B14)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff031420),
                  border: Border(
                    bottom: BorderSide(color: Colors.amber.withOpacity(.3)),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.amber),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Application Details',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'AI-Powered Analysis',
                            style: TextStyle(color: Colors.amber, fontSize: 12),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'AI',
                        style: TextStyle(color: Colors.amber),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      /// PROFILE CARD
                      buildProfileCard(user),

                      const SizedBox(height: 10),

                      /// STATUS CARD
                      buildStatusCard(),

                      const SizedBox(height: 10),

                      /// RESUME CARD
                      buildResumeCard(),

                      const SizedBox(height: 10),

                      /// COVER LETTER
                      buildCoverLetterCard(),

                      const SizedBox(height: 10),

                      /// CHAT BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                  user: ChatUser(
                                    name: user.name,
                                    designation: user.role,
                                    avatarText: user.name
                                        .substring(0, 1)
                                        .toUpperCase(),
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_outline),
                          label: const Text(
                            "Start Chat Conversation",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 54,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF004B74),
                                  foregroundColor: const Color.fromARGB(
                                    255,
                                    255,
                                    200,
                                    0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  updateStatus("Shortlisted");
                                },
                                child: Text(
                                  "Shortlist",
                                  style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: SizedBox(
                              height: 54,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    85,
                                    85,
                                    85,
                                  ),
                                  foregroundColor: const Color.fromARGB(
                                    255,
                                    0,
                                    0,
                                    0,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  updateStatus("Rejected");
                                },
                                child: const Text(
                                  "Reject",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileCard(ApplicantDetails user) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.amber.withOpacity(.5)),
        gradient: LinearGradient(
          colors: [Colors.blue.withOpacity(.15), Colors.black.withOpacity(.5)],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(.7),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    user.name[0],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      user.role,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '⚡ ${user.matchScore}% Match',
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          _infoRow(Icons.email_outlined, user.email),

          const SizedBox(height: 8),

          _infoRow(Icons.call_outlined, user.phone),

          const SizedBox(height: 8),

          _infoRow(Icons.calendar_today_outlined, 'Applied ${user.appliedAgo}'),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber, size: 22),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }

  Widget buildStatusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.35),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.amber.withOpacity(.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.bolt, color: Colors.amber, size: 22),
              SizedBox(width: 10),
              Text(
                "Application Status",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(child: _statusButton("New")),
              const SizedBox(width: 12),
              Expanded(child: _statusButton("Reviewing")),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: [
              Expanded(child: _statusButton("Shortlisted")),
              const SizedBox(width: 12),
              Expanded(child: _statusButton("Rejected")),
            ],
          ),

          const SizedBox(height: 6),

          SizedBox(
            width: MediaQuery.of(context).size.width * .38,
            child: _statusButton("Accepted"),
          ),
        ],
      ),
    );
  }

  Widget _statusButton(String status) {
    final selected = selectedStatus == status;

    return InkWell(
      onTap: () => updateStatus(status),
      child: Container(
        height: 42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? Colors.amber : const Color(0xFF062C43),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.amber.withOpacity(.7)),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget buildResumeCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.amber.withOpacity(.5)),
        color: Colors.black.withOpacity(.35),
      ),
      child: Row(
        children: [
          const Icon(Icons.description_outlined, color: Colors.amber, size: 30),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Resume',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.applicant.resumeName,
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Download Resume')));
            },
            icon: const Icon(Icons.download, color: Colors.amber),
            label: const Text(
              "Download",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCoverLetterCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.amber.withValues(alpha: 1.4),
          width: 1.2,
        ),
        color: Colors.black.withValues(alpha: .35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.description_outlined, color: Colors.amber, size: 28),
              SizedBox(width: 12),
              Text(
                'Cover Letter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          Text(
            widget.applicant.coverLetter,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}
