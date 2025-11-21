# Sunit's Home Portal - iOS App

This is a native iOS app that replicates the exact look and feel of the original HTML portal.

## Setup Instructions

### 1. Copy Images to Assets

Before building the app, you need to copy all images from the `images` folder to the iOS Assets catalog.

**Option A: Using the provided script (macOS/Linux)**
```bash
chmod +x copy_images.sh
./copy_images.sh
```

**Option B: Manual copy in Xcode**
1. Open `SunitPortal.xcodeproj` in Xcode
2. Right-click on `Assets.xcassets` in the project navigator
3. For each image in the `images` folder:
   - Right-click in Assets.xcassets → New Image Set
   - Name it exactly as the image filename (without extension)
   - Drag the image file into the image set

**Required Images:**
- Coloredlights.jpg (background)
- headerBgrnd.gif (header background)
- All other images referenced in ContentView.swift

### 2. Build and Run

1. Open `SunitPortal.xcodeproj` in Xcode
2. Select your target device or simulator
3. Click Run (⌘R)

## Project Structure

- `SunitPortal/SunitPortalApp.swift` - Main app entry point
- `SunitPortal/ContentView.swift` - Main view replicating the portal layout
- `SunitPortal/Assets.xcassets/` - Image assets
- `SunitPortal/Info.plist` - App configuration

## Features

- Exact visual replication of the original HTML portal
- Table-based layout matching the original design
- All links open in Safari
- Responsive layout that maintains the original appearance
- Background image and header styling preserved

## Notes

- The app requires iOS 17.0 or later
- All external links open in Safari using SFSafariViewController
- Images must be added to Assets.xcassets before the app will build successfully
- The image `img3.jpg` is automatically renamed to `img3_icici` in assets to avoid conflict with `img3.gif`
- Image names with dots (like `syracuse.com`) are supported in iOS assets

## Image Name Mapping

Some images have been renamed to avoid conflicts:
- `img3.jpg` → `img3_icici` (ICICI Bank logo)
- `img3.gif` → `img3` (who.is logo)

All other images use their original filenames (without extension) as asset names.

