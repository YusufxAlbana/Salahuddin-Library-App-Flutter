import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light grey background
      body: Stack(
        children: [
          // Background content (Scrollable)
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100), // Space for bottom nav
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const _HeaderSection(),
                    Positioned(
                      top: 190, 
                      left: 20, 
                      right: 20,
                      child: const _SearchBar(),
                    ),
                  ],
                ),
                // Height of header (220) - SearchBar top (190) = 30px overlap internal.
                // SearchBar height is approx 60px.
                // So it extends 30px below the header.
                // We need space for that + previous spacing (24).
                const SizedBox(height: 60), 
                const _BookGrid(),
              ],
            ),
          ),
          
          // Custom Bottom Navigation (Fixed)
          const Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: _CustomBottomNav(),
          ),
        ],
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0F5132), // Dark Green
            Color(0xFF198754), // Slightly Lighter Green
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          // Custom Pattern Background
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: CustomPaint(
                painter: _BackgroundPatternPainter(),
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Selamat Datang di',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Salahudin Library',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                 const SizedBox(height: 10),
                 Container(
                   height: 4,
                   width: 150,
                   color: Colors.white,
                 )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white.withOpacity(0.15) // Brighter stroke
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    double step = 80; // Larger grid size for cleaner look

    var waves = Path();

    // 1. Horizontal Sine Waves
    for (double y = 0; y < size.height + step; y += step) {
      waves.moveTo(0, y);
      for (double x = 0; x < size.width + step; x += step) {
        waves.quadraticBezierTo(x + step / 4, y - 25, x + step / 2, y);
        waves.quadraticBezierTo(x + 3 * step / 4, y + 25, x + step, y);
      }
    }

    // 2. Vertical Sine Waves
    for (double x = 0; x < size.width + step; x += step) {
      waves.moveTo(x, 0);
      for (double y = 0; y < size.height + step; y += step) {
        waves.quadraticBezierTo(x - 25, y + step / 4, x, y + step / 2);
        waves.quadraticBezierTo(x + 25, y + 3 * step / 4, x, y + step);
      }
    }
    canvas.drawPath(waves, paint);

    // 3. Diamonds & Circles at intersections
    for (double y = 0; y < size.height + step; y += step) {
      for (double x = 0; x < size.width + step; x += step) {
        // Outer Diamond
        Path diamond = Path();
        double dSize = 25;
        diamond.moveTo(x, y - dSize);
        diamond.lineTo(x + dSize, y);
        diamond.lineTo(x, y + dSize);
        diamond.lineTo(x - dSize, y);
        diamond.close();
        canvas.drawPath(diamond, paint);
        
        // Inner Diamond
        Path innerDiamond = Path();
        double idSize = 15;
        innerDiamond.moveTo(x, y - idSize);
        innerDiamond.lineTo(x + idSize, y);
        innerDiamond.lineTo(x, y + idSize);
        innerDiamond.lineTo(x - idSize, y);
        innerDiamond.close();
        canvas.drawPath(innerDiamond, paint);

        // Center Circle
        canvas.drawCircle(Offset(x, y), 6, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; 
  }
}


class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search a book...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: const SizedBox(width: 20), // Spacer
          suffixIcon: const Icon(Icons.search, size: 28, color: Colors.black54),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }
}


class _BookGrid extends StatelessWidget {
  const _BookGrid();

  Widget _buildBookImage(String? imageUrl, {BoxFit fit = BoxFit.cover}) {
    if (imageUrl == null || imageUrl.isEmpty) {
       return Image.network('https://placehold.co/150x200/png?text=No+Image', fit: fit);
    }

    // Check if SVG
    if (imageUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl,
        fit: fit,
        placeholderBuilder: (context) => const Center(child: CircularProgressIndicator()),
      );
    }

    // Standard Image
    return Image.network(
      imageUrl,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        // Fallback for when Image.network fails (e.g. wrong format labeled as jpg, or really broken)
        // If it's a "Failed to detect image file format", it might be an un-extensioned SVG. 
        // But for now, let's assume valid extensions.
        return const Center(child: Icon(Icons.broken_image, color: Colors.grey));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // 1. Fetch Real Data from Supabase
    final booksFuture = Supabase.instance.client
        .from('books')
        .select()
        .order('created_at', ascending: false); // Optional: sort by newest

    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: booksFuture,
        builder: (context, snapshot) {
          // Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          // Error State
          if (snapshot.hasError) {
             return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Data
          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text('No books found.'));
          }

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65, // Adjust card height
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final book = data[index];
              
              // Map Supabase fields (adjust keys if your table is different)
              final title = book['judul'] ?? book['title'] ?? 'No Title';
              final author = book['penulis'] ?? book['author'] ?? 'Unknown Author';

              final stock = book['stok']?.toString() ?? book['stock']?.toString() ?? '0';
              
              // Random color generation for variety
              final color = Colors.primaries[index % Colors.primaries.length].shade100;
              
              // Debug: Print keys to see available columns
              print('Book data keys: ${book.keys}');
              final imageUrl = book['cover'] ?? 
                               book['image_url'] ?? 
                               book['cover_url'] ?? 
                               book['sampul'] ?? 
                               book['gambar'];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(
                      flex: 3,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // 1. Blurred Background Layer (Fills container)
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            child: imageUrl != null
                                ? ImageFiltered(
                                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child: _buildBookImage(imageUrl, fit: BoxFit.cover),
                                  )
                                : Container(color: color),
                          ),
                          
                          // Darken layer for better contrast
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            ),
                          ),

                          // 2. Main Image Layer (Centered, contained)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: _buildBookImage(imageUrl, fit: BoxFit.contain),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    
                    // Info
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              author,
                              style: TextStyle(color: Colors.grey[600], fontSize: 10),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2E8B57), // Green Button
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '$stock Buku',
                                    style: const TextStyle(color: Colors.white, fontSize: 10),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _CustomBottomNav extends StatelessWidget {
  const _CustomBottomNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.bookmark, color: Colors.black54),
                onPressed: () {},
              ),
              const SizedBox(width: 50), // Space for center button
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.black54),
                onPressed: () {},
              ),
            ],
          ),
          
          // Center Button
          Positioned(
            top: -15, // Float up
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF2E8B57),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2E8B57).withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Icon(Icons.home, color: Colors.white, size: 30),
            ),
          ),
           // Search Icon to the right of home, left of settings in the design, 
           // but design shows ( Bookmark | Home | Search | Settings )?
           // Actually looking at image: It seems to be Home (floating) overlaying the bar?
           // Wait, image shows: Left side: Empty? Right side: Search, Settings?
           // Let's look closer at the image.
           // Bottom component: White rounded rect.
           // Icons: Book (left), Search (middle-right), Settings (right).
           // Floating Green Home button: Sits on the left side? No, it sits on the designated "notch" or just floating.
           // In the image provided: Bottom Left = Green Home Circle. Bottom list = Bookmark, Search, Settings.
           // Wait, looking at the very bottom of the image...
           // Actually, it looks like a standard bottom nav with a floating button.
           // Let's stick to a balanced layout: Bookmark - (Home) - Search - Settings
           // Or as per image: It seems the green home button is actually part of a custom shape or just floating.
           // I will implement: [Bookmark] [Home(Floating)] [Search] [Settings]
        ],
      ),
    );
  }
}
