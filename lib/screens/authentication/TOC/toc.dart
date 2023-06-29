import 'package:flutter/material.dart';

import '../../homepage/dashboard.dart';

class tocPage extends StatefulWidget {
  const tocPage({super.key});

  @override
  State<tocPage> createState() => _tocPageState();
}

class _tocPageState extends State<tocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          title: Text('Terms and Conditions'),
          backgroundColor: Colors.grey[800],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Last updated: June 29, 2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Developed by: \n\nKrishnaveni M\nAnna Jose\nBincy Benny\nSandra Maria Jose',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Please read these terms and conditions carefully before using Our Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Introduction',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to the STREETPATCH ! These terms and conditions govern your use of the app and its services. By using the app, you agree to comply with these terms and conditions.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Interpretation and Definitions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Interpretation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Definitions',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'For the purposes of these Terms and Conditions:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '- Application means the software program provided by the Company downloaded by You on any electronic device, named Streetpatch',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Application Store means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) in which the Application has been downloaded.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Affiliate means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Country refers to: Kerala, India',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Company (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Streetpatch.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Service refers to the Application.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Terms and Conditions (also referred as "Terms") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the TermsFeed Terms and Conditions Generator.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- Third-party Social Media Service means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Acknowledgment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Use of the app',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'a.Streetpatch allows users to file road complaints and development ideas(suggetions) by utilizing location and camera features. You must be at least 18 years old or have parental consent to use the App.\n\nb. You are solely responsible for the accuracy and content of the complaints submitted through the App.\n\nc. The Company reserves the right to modify or discontinue the App at any time without prior notice.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Links to Other Websites',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Termination',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Upon termination, Your right to use the Service will cease immediately.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Limitation of Liability',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven\'t purchased anything through the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party\'s liability will be limited to the greatest extent permitted by law.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '"AS IS" and "AS AVAILABLE" Disclaimer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The Service is provided to You "AS IS" and "AS AVAILABLE" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Without limiting the foregoing, neither the Company nor any of the company\'s provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Governing Law',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Location and Camera Usage',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'By using the road complaint app, you grant us permission to access and use your devices location and camera functionalities. This allows us to accurately capture and report road complaints. We respect your privacy and will handle your location and media data in accordance with our Privacy Policy.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Disputes Resolution',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Severability and Waiver',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Severability',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'If any provision of these Terms is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Waiver',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Except as provided herein, the failure to exercise a right or to require performance of an obligation under this Terms shall not effect a party\'s ability to exercise such right or require such performance at any time thereafter nor shall be the waiver of a breach constitute a waiver of any subsequent breach.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Translation Interpretation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'These Terms and Conditions may have been translated if We have made them available to You on our Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'You agree that the original English text shall prevail in the case of a dispute.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Changes to These Terms and Conditions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We reserve the right, at Our sole discretion, to modify or replace these Terms at any time. If a revision is material We will make reasonable efforts to provide at least 30 days\' notice prior to any new terms taking effect. What constitutes a material change will be determined at Our sole discretion.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'By continuing to access or use Our Service after those revisions become effective, You agree to be bound by the revised terms. If You do not agree to the new terms, in whole or in part, please stop using the website and the Service.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Information Collection',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'We collect certain personal information when you use the road complaint app, including your location data and media files (images, videos) that you choose to submit as part of your complaint. We may also collect anonymous usage data for analytics purposes.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Use of Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'We use the collected information to provide and improve the app\'s services, analyze usage patterns, respond to user inquiries, and address technical issues. We may also use the information to communicate with you regarding app updates, news, and promotions.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Data Sharing and Disclosure',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'We do not sell or rent your personal information to third parties. However, we may share your information with trusted service providers who assist us in operating the app and delivering services to you. We may also disclose your information in response to legal requirements or when necessary to protect our rights or the rights of other users.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Data Security',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'We implement reasonable security measures to protect your personal information from unauthorized access, alteration, or disclosure. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Children\'s Privacy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'The road complaint app is not intended for children under the age of 13. We do not knowingly collect personal information from children. If we discover that we have collected personal information from a child, we will take immediate steps to delete it.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Changes to the Privacy Policy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'We reserve the right to update or revise this Privacy Policy at any time. We will notify you of any material changes through the app or by other means. By continuing to use the app after such changes, you acknowledge and agree to the updated Privacy Policy.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Please note that this is a general template and may not cover all legal requirements for your specific app and jurisdiction. It\'s recommended to consult with a lawyer to ensure compliance with applicable laws and regulations.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'If you have any questions about these Terms and Conditions, You can contact us:',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '- By email: streetpatch5@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return Dashboard();
                            }),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 10.0),
                          backgroundColor:
                              const Color.fromARGB(255, 102, 104, 102),
                        ),
                        child: Text(
                          "I Accept",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
