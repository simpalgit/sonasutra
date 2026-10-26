import 'package:flutter/material.dart';

class PdfViewerScreen extends StatefulWidget {
  final String title;
  final String documentNumber;

  const PdfViewerScreen({
    super.key,
    this.title = 'Silver Growth Agreement PDF',
    this.documentNumber = 'SG0021 • Revision 01',
  });

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  String? _uploadedFileName;

  void _simulateDownload(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFFFFBF2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: const [
            Icon(Icons.download_done_rounded, color: Color(0xFF2E7D32), size: 24),
            SizedBox(width: 8),
            Text('Download Successful', style: TextStyle(color: Color(0xFF1B0D05), fontFamily: 'serif', fontSize: 18)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Document: ${widget.title}', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1B0D05), fontSize: 13)),
            const SizedBox(height: 4),
            Text('Ref: ${widget.documentNumber}', style: const TextStyle(color: Color(0xFF786253), fontSize: 12)),
            const SizedBox(height: 12),
            const Text('Saved to: Device Storage / Downloads & Gallery / SonaSutra Documents', style: TextStyle(color: Color(0xFFC8801C), fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: Color(0xFFC8801C), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _simulateUpload() {
    setState(() {
      _isUploading = true;
      _uploadProgress = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) setState(() => _uploadProgress = 0.35);
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) setState(() => _uploadProgress = 0.75);
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (mounted) {
        setState(() {
          _uploadProgress = 1.0;
          _isUploading = false;
          _uploadedFileName = 'Signed_Customer_Agreement_SG0021.pdf';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signed Document Uploaded Successfully!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B0D05),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B0D05),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Color(0xFFE5B864), size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFFFAF7F3),
            fontSize: 17,
            fontWeight: FontWeight.bold,
            fontFamily: 'serif',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.download_rounded,
                color: Color(0xFFE5B864), size: 22),
            onPressed: () => _simulateDownload(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Top Action Toolbar
            Container(
              color: const Color(0xFF1B0D05),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE5B864),
                        foregroundColor: const Color(0xFF1B0D05),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () => _simulateDownload(context),
                      icon: const Icon(Icons.file_download_rounded, size: 18),
                      label: const Text('Download to Gallery/Storage', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF381F10),
                      foregroundColor: const Color(0xFFE5B864),
                      side: const BorderSide(color: Color(0xFFE5B864)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: _simulateUpload,
                    icon: const Icon(Icons.file_upload_rounded, size: 18),
                    label: const Text('Upload PDF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                ],
              ),
            ),

            if (_isUploading)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: LinearProgressIndicator(
                  value: _uploadProgress,
                  backgroundColor: const Color(0xFF381F10),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFE5B864)),
                ),
              ),

            if (_uploadedFileName != null)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF4EC),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFC7E2CE)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded, color: Color(0xFF2E7D32), size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Attached: $_uploadedFileName',
                        style: const TextStyle(color: Color(0xFF1B5E20), fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),

            // Document Preview Paper View
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBF2),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Color(0x33000000), blurRadius: 10, offset: Offset(0, 4)),
                  ],
                  border: Border.all(color: const Color(0xFFF3E4CD), width: 1.5),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Seal
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'SONASUTRA',
                                style: TextStyle(
                                  color: Color(0xFF1B0D05),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'serif',
                                  letterSpacing: 2,
                                ),
                              ),
                              const Text(
                                'GOLD & SILVER VAULTING AGREEMENT',
                                style: TextStyle(color: Color(0xFFC8801C), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF1B0D05),
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFFE5B864), width: 1.5),
                            ),
                            child: const Center(
                              child: Icon(Icons.verified_user_rounded, color: Color(0xFFE5B864), size: 28),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Color(0xFFE8DCB9), thickness: 1.5),
                      const SizedBox(height: 12),

                      // Document Metadata Grid
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Ref: SG0021 • Revision 01', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 12, fontWeight: FontWeight.bold)),
                          Text('Date: 21 Oct 2026', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text('Participant: Chandan Soni (CUST0021)', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
                      const Text('Issuer: Sonasutra Jewellery Private Limited', style: TextStyle(color: Color(0xFF786253), fontSize: 12)),
                      const SizedBox(height: 16),

                      // Terms Body Text
                      const Text(
                        '1. CUSTODY & VAULTING TERMS',
                        style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'The Participant hereby agrees to vault 1,000.000 g of 999 Fine Physical Silver in Sonasutra Brinks Insured Vault for a term duration of 18 Months. Principal remains fully protected and locked until maturity.',
                        style: TextStyle(color: Color(0xFF5C4033), fontSize: 12, height: 1.4),
                      ),
                      const SizedBox(height: 14),

                      const Text(
                        '2. BENEFIT DISBURSEMENT SCHEDULE',
                        style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Monthly payout of 10.000 g 999-equivalent silver shall be credited on the 21st of each calendar month. The participant may request physical collection or bank settlement rate conversion at their discretion.',
                        style: TextStyle(color: Color(0xFF5C4033), fontSize: 12, height: 1.4),
                      ),
                      const SizedBox(height: 14),

                      const Text(
                        '3. MATURITY & SETTLEMENT',
                        style: TextStyle(color: Color(0xFF1B0D05), fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'serif'),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Upon reaching maturity on 21 Apr 2028, 100% of the 1,000.000 g principal weight or equivalent physical silver bars shall be handed over to the participant upon presentation of identity verification.',
                        style: TextStyle(color: Color(0xFF5C4033), fontSize: 12, height: 1.4),
                      ),
                      const SizedBox(height: 24),

                      // Signature Seal Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Participant Signature', style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
                              SizedBox(height: 4),
                              Text('Chandan Soni', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                              Text('Digitally Verified via OTP', style: TextStyle(color: Color(0xFF2E7D32), fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('Authorized Signatory', style: TextStyle(color: Color(0xFF786253), fontSize: 10)),
                              SizedBox(height: 4),
                              Text('Sonasutra Vaulting Ltd', style: TextStyle(color: Color(0xFF1B0D05), fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'serif')),
                              Text('Official Stamp Attached', style: TextStyle(color: Color(0xFFC8801C), fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
