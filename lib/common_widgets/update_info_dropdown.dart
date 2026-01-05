import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mementum/utils/app_colors.dart'; // Ensure this import matches your project

class UpdateInfoDropdown extends StatelessWidget {
  final String tittle;
  final String hint;
  final TextEditingController? textcontroller;
  final List<String> items; // List of dropdown items

  const UpdateInfoDropdown({
    super.key, 
    required this.tittle, 
    required this.hint, 
    this.textcontroller,
    required this.items, // Required now
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black
          ),
        ),
        Container(
          // Exact same height and decoration as your original
          height: Get.height * 0.05,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: AppColors.primarycolor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TextFormField(
              controller: textcontroller,
              readOnly: true, // Prevents manual typing, forces selection
              //enabled: false,
              //enableInteractiveSelection: false,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black), // Ensures selected text matches design
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: const Color(0xffC7C7C7)
                ),
                border: InputBorder.none,
                // The Dropdown Trigger
                suffixIcon: PopupMenuButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  onSelected: (String value) {
                    textcontroller?.text = value; // Assigns selection to controller
                  },
                  itemBuilder: (BuildContext context) {
                    return items.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(
                          choice,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14, // Slightly smaller for menu items
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}