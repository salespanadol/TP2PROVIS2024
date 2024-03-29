import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DaftarDokter(),
    );
  }
}

class DaftarDokter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // Menambahkan jarak dari atas
            Center(
              child: Text(
                'Jadwal Dokter',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00A9FF),
                ),
              ),
            ),
            SizedBox(height: 20), // Menambahkan jarak antara judul dan search bar
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all( // Menambahkan border pada search bar
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Cari dokter...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10), // Menambahkan jarak antara search bar dan logo listing
                Icon(
                  Icons.list,
                  size: 40,
                  color: Color(0xFF00A9FF),
                ),
              ],
            ),
            SizedBox(height: 20), // Menambahkan jarak antara search bar dan data dokter
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Jumlah data dokter
                itemBuilder: (context, index) {
                  // Data dokter yang berbeda untuk setiap kolom
                  String name = 'Dr. ${index + 1}';
                  String specialization = 'Spesialis ${index + 1}';
                  double rating = (index + 1) * 0.5; // Rating berbeda untuk setiap kolom
                  
                  return DoctorCard(
                    name: name,
                    specialization: specialization,
                    rating: rating,
                    photoUrl: 'https://example.com/doctor$index.jpg',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final double rating;
  final String photoUrl;

  DoctorCard({required this.name, required this.specialization, required this.rating, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 120, 217, 241),
        borderRadius: BorderRadius.circular(10),
        border: Border.all( // Menambahkan border
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                specialization,
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 5),
                  Text(
                    '$rating',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(photoUrl),
          ),
        ],
      ),
    );
  }
}