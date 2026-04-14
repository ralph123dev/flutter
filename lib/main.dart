import 'package:flutter/material.dart'; // Importation du package Flutter Material Design

void main() {
  runApp(const InstagramApp()); // Point d'entrée de l'app, lance le widget principal
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram', // Titre de l'application
      debugShowCheckedModeBanner: false, // Cache le bandeau "DEBUG"
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black), // Thème basé sur le noir
        useMaterial3: true, // Material Design 3
      ),
      home: const InstagramHomePage(), // Page d'accueil
    );
  }
}

class InstagramHomePage extends StatefulWidget {
  const InstagramHomePage({super.key});

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  int _selectedIndex = 0; // Index de l'onglet sélectionné (0 = Home par défaut)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fond blanc
      bottomNavigationBar: _buildBottomNav(), // Seul élément affiché : la barre de navigation
    );
  }

  // ─── BOTTOM NAVIGATION BAR ──────────────────────────────────────────────────

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,                              // Onglet actuellement sélectionné
      onTap: (index) => setState(() => _selectedIndex = index),  // Met à jour l'état quand on tape un onglet
      type: BottomNavigationBarType.fixed,   // Tous les onglets ont la même taille
      selectedItemColor: Colors.black,       // Couleur de l'icône sélectionnée
      unselectedItemColor: Colors.black,     // Même couleur pour les non-sélectionnées (style Instagram)
      showSelectedLabels: false,             // Cache les labels sous les icônes sélectionnées
      showUnselectedLabels: false,           // Cache les labels sous les icônes non-sélectionnées
      backgroundColor: Colors.white,         // Fond blanc de la barre
      elevation: 1,                          // Légère ombre au-dessus de la barre
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),   // Maison vide (non sélectionné)
          activeIcon: Icon(Icons.home),      // Maison pleine (sélectionné)
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle_outline), // Bouton play vide (Reels)
          activeIcon: Icon(Icons.play_circle),   // Bouton play plein (sélectionné)
          label: 'Reels',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.send_outlined), // Icône envoi (Messages / DM)
          activeIcon: Icon(Icons.send),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search), // Loupe pour la recherche
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline), // Personne vide (Profil)
          activeIcon: Icon(Icons.person),   // Personne pleine (sélectionné)
          label: 'Profile',
        ),
      ],
    );
  }
}