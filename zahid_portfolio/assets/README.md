# Assets Directory

This directory contains all visual assets for the Zahid Talib Portfolio App.

## 📁 Structure

```
assets/
├── images/
│   ├── profile_avatar.png          # Profile picture (512x512)
│   └── projects/
│       ├── ecommerce.png           # E-commerce app thumbnail
│       ├── social_media.png        # Social media app thumbnail
│       ├── fitness.png             # Fitness tracker thumbnail
│       ├── food_delivery.png       # Food delivery app thumbnail
│       ├── task_management.png     # Task management thumbnail
│       └── weather.png             # Weather app thumbnail
└── icons/
    └── app_icon.png                # App launcher icon
```

## 🎨 Asset Specifications

### Profile Avatar
- **Size**: 512x512px
- **Format**: PNG with transparency
- **Style**: Circular, gradient background (purple to blue)
- **Usage**: Home screen, Profile screen

### Project Thumbnails
- **Size**: 400x300px (4:3 aspect ratio)
- **Format**: PNG
- **Style**: Modern illustrations with gradient backgrounds
- **Usage**: Projects screen cards

### App Icon
- **Size**: 1024x1024px (will be resized for different platforms)
- **Format**: PNG
- **Style**: Purple gradient with Flutter logo
- **Usage**: App launcher icon

## 📝 Notes

- All images use the app's color scheme (purple #6C63FF primary)
- Gradients are consistent across all assets
- High-quality PNG format for best display on all devices
- Assets are optimized for mobile performance

## 🔄 Adding New Assets

1. Place images in appropriate subdirectory
2. Update `pubspec.yaml` to include new assets
3. Reference in code using `AssetImage` or `Image.asset()`

## 📦 Current Assets

✅ profile_avatar.png - Professional developer avatar
✅ project_ecommerce.png - E-commerce app illustration
⏳ Additional project thumbnails (can use placeholder or add later)
