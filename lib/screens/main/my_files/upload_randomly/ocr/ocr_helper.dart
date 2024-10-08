// Binary search for exact matching
int binarySearch(List<String> sortedList, String target) {
  int left = 0;
  int right = sortedList.length - 1;

  while (left <= right) {
    int middle = (left + right) ~/ 2;
    int compare = sortedList[middle].toLowerCase().compareTo(target.toLowerCase());

    if (compare == 0) {
      return middle;  // Exact match found
    } else if (compare < 0) {
      left = middle + 1;
    } else {
      right = middle - 1;
    }
  }

  return -1;  // No match found
}

// Levenshtein distance for fuzzy matching
int levenshteinDistance(String s1, String s2) {
  List<List<int>> dp = List.generate(
      s1.length + 1,
          (i) => List.generate(s2.length + 1, (j) => 0)
  );

  for (int i = 0; i <= s1.length; i++) {
    for (int j = 0; j <= s2.length; j++) {
      if (i == 0) {
        dp[i][j] = j;
      } else if (j == 0) {
        dp[i][j] = i;
      } else if (s1[i - 1] == s2[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1];
      } else {
        dp[i][j] = 1 + [dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]].reduce((a, b) => a < b ? a : b);
      }
    }
  }

  return dp[s1.length][s2.length];
}

// Calculate similarity between two strings
double calculateSimilarity(String s1, String s2) {
  int maxLength = s1.length > s2.length ? s1.length : s2.length;
  if (maxLength == 0) return 1.0;  // Both strings are empty

  int distance = levenshteinDistance(s1, s2);
  return 1.0 - (distance / maxLength);  // Return similarity as a percentage
}






//Work on the OCR
// Future<List<String>?> _extractText(String file) async {
//   final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
//   final InputImage inputImage = InputImage.fromFilePath(file);
//   final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
//
//   List<String> words = [];
//   String doctorName = '';
//   for (TextBlock block in recognizedText.blocks) {
//     for (TextLine line in block.lines) {
//      // words.addAll(line.text.split(RegExp(r'\s+')));
//       //need to find out the doctor name
//
//       List<String> lineWords = line.text.split(RegExp(r'\s+'));
//       words.addAll(lineWords);
//
//       // Check for potential doctor name in the line
//       for (int i = 0; i < lineWords.length; i++) {
//         String word = lineWords[i];
//
//         // Check for title "Dr." or "Doctor"
//         if (word.contains(RegExp(r'(Dr\.|Doctor)', caseSensitive: false))) {
//           List<String> potentialName = [];
//
//           // Collect name-like words following the title
//           for (int j = i + 1; j < lineWords.length; j++) {
//             String nextWord = lineWords[j];
//
//             // Stop if the next word matches a department or is non-alphabetic
//             if (doctorSpeciality.contains(nextWord) || nextWord.length < 2 || nextWord.contains(RegExp(r'[^a-zA-Z]'))) {
//               break;
//             }
//             potentialName.add(nextWord);
//           }
//
//           // Concatenate to form the full name
//           if (potentialName.isNotEmpty) {
//             doctorName = 'Dr. ' + potentialName.join(' ');
//             print('Doctor Name: $doctorName');
//           }
//         }
//       }
//     }
//   }
//   print(words);
//   return words;
// }


// List<String> medicalDepartments = [
//   "Anesthesiology",
//   "Cardiology",
//   "Dermatology",
//   "Emergency Medicine",
//   "Endocrinology",
//   "Gastroenterology",
//   "General Surgery",
//   "Hematology",
//   "Infectious Disease",
//   "Internal Medicine",
//   "Neonatology",
//   "Nephrology",
//   "Neurology",
//   "Neurosurgery",
//   "Gynecology",
//   "Obstetrics",
//   "Oncology",
//   "Ophthalmology",
//   "Orthopedics",
//   "Otolaryngology (ENT)",
//   "Pediatrics",
//   "Plastic Surgery",
//   "Psychiatry",
//   "Pulmonology",
//   "Radiology",
//   "Rheumatology",
//   "Urology",
//   "Vascular Surgery",
//   "Pathology",
//   "Immunology",
//   "Geriatrics",
//   "Pain Management",
//   "Rehabilitation Medicine",
//   "Palliative Care",
//   "Dentistry",
//   "Sports Medicine",
//   "Allergy and Immunology",
//   "Family Medicine",
//   "Nuclear Medicine",
//   "Occupational Medicine",
//   "Orthodontics",
//   "Prosthodontics",
//   "Oral and Maxillofacial Surgery",
//   "Public Health",
//   "Traumatology",
//   "Thoracic Surgery",
//   "Hepatology",
//   "Audiology",
//   "Sleep Medicine",
//   "Medical Genetics",
//   "Transplant Surgery",
//   "Gynecology", // Explicitly mentioned separately
//   "Andrology",
//   "Bariatric Surgery",
//   "Colorectal Surgery",
//   "Critical Care Medicine",
//   "Endodontics",
//   "Gastrointestinal Surgery",
//   "Hand Surgery",
//   "Maxillofacial Surgery",
//   "Nephrology",
//   "Orthopedic Oncology",
//   "Phlebology",
//   "Proctology",
//   "Psychosomatic Medicine",
//   "Sexology",
//   "Spine Surgery",
//   "Trauma Surgery",
//   "Vascular Medicine",
//   "Clinical Immunology",
//   "Addiction Medicine",
//   "Hyperbaric Medicine",
//   "Medical Toxicology",
//   "Perinatology",
//   "Forensic Medicine",
//   "Genomic Medicine",
//   "Laboratory Medicine",
//   "Preventive Medicine",
//   "Telemedicine",
//   "Neurocritical Care",
//   "Sleep Disorders Medicine",
//   "Dermatopathology",
//   "Pediatric Surgery",
//   "Neonatal Surgery",
//   "Hematologic Oncology",
//   "Infectious Disease and Immunology",
//   "Interventional Radiology"
// ];