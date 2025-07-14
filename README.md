# Astart - 2D Action Game

A simple 2D action game built with Godot Engine 4.4, featuring a forest setting with player movement and combat mechanics.

## 🎮 Game Overview

Astart is a 2D action game where you control a character named Foxy in a forest environment. The game features enemy encounters, shooting mechanics, and immersive audio effects.

## ✨ Features

- **Player Movement**: WASD controls for smooth character movement
- **Combat System**: Shooting mechanics with bullet projectiles
- **Enemy AI**: Slimer enemies with death animations
- **Audio Effects**: 
  - Background music (BGM)
  - Sound effects for gunshots, enemy deaths, and player actions
  - Running sound effects for movement
- **Visual Assets**: 
  - Forest background environment
  - Pixel art character sprites
  - Enemy sprites with death animations
  - Bullet projectiles
- **Game Over System**: Game over audio and mechanics

## 🎯 Controls

- **W** - Move Up
- **A** - Move Left  
- **S** - Move Down
- **D** - Move Right

## 🛠️ Technical Requirements

- **Engine**: Godot 4.4
- **Platform**: Cross-platform (Windows, macOS, Linux)
- **Graphics**: 2D pixel art style
- **Audio**: OGG and MP3 format support

## 📁 Project Structure

```
astart/
├── AssetBundle/           # Game assets
│   ├── Audio/            # Sound effects and music
│   │   ├── BGM.ogg      # Background music
│   │   ├── EnemyDeath.mp3
│   │   ├── GameOver.mp3
│   │   ├── Gun.mp3
│   │   └── Running.mp3
│   ├── Sprites/          # Character and environment sprites
│   │   ├── Bullet.png
│   │   ├── ForestBackground.png
│   │   ├── Foxy.png     # Player character
│   │   ├── Slimer.png   # Enemy sprite
│   │   └── SlimerDeath.png
│   └── Uranus_Pixel_11Px.ttf  # Game font
├── Scenes/               # Game scenes
│   ├── Game.tscn        # Main game scene
│   ├── player.tscn      # Player character scene
│   └── player.gd        # Player movement script
├── Scripts/              # Game scripts
│   └── player.gd        # Additional player scripts
└── project.godot        # Godot project file
```

## 🚀 Getting Started

### Prerequisites

- Godot Engine 4.4 or later
- Git (for cloning the repository)

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd astart
   ```

2. Open Godot Engine

3. Click "Import" and select the `project.godot` file

4. Click "Import & Edit" to open the project

### Running the Game

1. Open the project in Godot
2. Press F5 or click the "Play" button
3. Select `Scenes/Game.tscn` as the main scene when prompted
4. Use WASD keys to move your character around the forest

## 🎨 Assets

### Character Assets
- **Foxy**: Main player character sprite
- **Slimer**: Enemy character with death animation

### Environment Assets
- **Forest Background**: Seamless forest environment
- **Bullet**: Projectile sprite for combat

### Audio Assets
- **Background Music**: Atmospheric forest BGM
- **Sound Effects**: Combat, movement, and game state audio

### Font
- **Uranus Pixel 11Px**: Retro pixel font for UI elements

## 🔧 Development

### Current Implementation
- Basic player movement with WASD controls
- Camera system with 2.4x zoom
- Background parallax setup
- Asset organization and import system

### Future Enhancements
- Enemy AI implementation
- Combat system completion
- UI/HUD elements
- Game state management
- Level progression
- Power-ups and collectibles

## 📝 License

This project uses various assets. Please refer to individual asset licenses:
- Font assets may have specific licensing terms
- Audio and sprite assets should be verified for usage rights

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📧 Contact

For questions or feedback about this project, please create an issue in the repository.

---

*Built with ❤️ using Godot Engine* 