import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DocumentViewer extends StatefulWidget {
  final String documentUrl;

  DocumentViewer({required this.documentUrl});

  @override
  _DocumentViewerState createState() => _DocumentViewerState();
}

class _DocumentViewerState extends State<DocumentViewer> {
  bool _isLoading = true;
  String? _localFilePath;

  @override
  void initState() {
    super.initState();
    _loadDocument();
  }

  Future<void> _loadDocument() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(widget.documentUrl));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        print('Downloaded bytes length: ${bytes.length}'); // Log for debugging
        final fileName = widget.documentUrl.split('/').last;
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/$fileName');
        await file.writeAsBytes(bytes);

        setState(() {
          _localFilePath = file.path;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load document: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error loading document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
      ),
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _localFilePath != null
          ? widget.documentUrl.toLowerCase().endsWith('.pdf')
          ? PDFView(
        filePath: _localFilePath!,
      )
          : Image.file(File(_localFilePath!))
          : Center(
        child: Text(
          'Failed to load document.',
          style: TextStyle(color: Colors.red),
        ),
      ),
      floatingActionButton: _localFilePath != null
          ? FloatingActionButton(
        onPressed: () async {
          if (_localFilePath != null) {
            final file = File(_localFilePath!);
            // Implement file sharing or download functionality here
            // Example: using the share plugin
            // await Share.shareFiles([file.path]);
            // or saving to a specific directory
            // await file.copy('your_desired_directory/${file.path.split('/').last}');
          }
        },
        child: Icon(Icons.file_download),
      )
          : null,
    );
  }
}
