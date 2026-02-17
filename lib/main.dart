import 'package:flutter/material.dart';

void main() => runApp(const EntreMigasApp());

class EntreMigasApp extends StatelessWidget {
  const EntreMigasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ScaffoldeScreen(),
    );
  }
}

class ScaffoldeScreen extends StatelessWidget {
  const ScaffoldeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradiente de fondo para dar más vida
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF8E1), Colors.white], // Crema suave a blanco
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Header con mejor espaciado
                    Row(
                      children: [
                        const Icon(Icons.menu_rounded, size: 35, color: Color(0xFF5D4037)),
                        const SizedBox(width: 12),
                        const Text(
                          'Entre Migas',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5D4037),
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    // Título Central con sombra suave
                    const Text(
                      'Entrega de\npedidos',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 46,
                        height: 1.1,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF1E88E5),
                        shadows: [
                          Shadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 45),
                    // Campos de entrada mejorados
                    _buildCustomInput(Icons.location_searching_rounded, "Dirección"),
                    const SizedBox(height: 20),
                    _buildCustomInput(Icons.history_toggle_off_rounded, "Entrega"),
                    const SizedBox(height: 20),
                    _buildCustomInput(null, "Buscar comida"),
                    const SizedBox(height: 35),
                    // Link Iniciar Sesión con estilo
                    TextButton(
                      onPressed: null, // Deshabilitado como pediste
                      child: Text(
                        'iniciar sesión',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.brown.withOpacity(0.7),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Croissant con mejor manejo de errores de carga
              Positioned(
                bottom: 10,
                right: 10,
                child: Opacity(
                  opacity: 0.8,
                  child: Image.network(
                    'https://raw.githubusercontent.com/AmbarKislev/pannnnnn/refs/heads/main/croissant.webp',
                    width: 140,
                    fit: BoxFit.contain,
                    // Esto ayuda a que no falle en Android si hay lag de red
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator(color: Colors.orangeAccent);
                    },
                    errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.bakery_dining, size: 80, color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomInput(IconData? icon, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF5D4037).withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        style: const TextStyle(fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: icon != null ? Icon(icon, color: const Color(0xFF1E88E5)) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
        ),
      ),
    );
  }
}