#!/bin/bash

# Path to the wallpaper
WALLPAPER="$HOME/.config/hypr/wallpaper/current_wallpaper"
OUTPUT="$HOME/.config/hypr/wallpaper/modified_wallpaper.jpg"

# Check if the wallpaper exists
if [ ! -f "$WALLPAPER" ]; then
    notify-send "Error" "Wallpaper not found at $WALLPAPER"
    exit 1
fi

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    notify-send "Error" "ImageMagick is not installed"
    exit 1
fi

# Check if rofi is installed
if ! command -v rofi &> /dev/null; then
    notify-send "Error" "rofi is not installed"
    exit 1
fi

# Check if swww is installed
if ! command -v swww &> /dev/null; then
    notify-send "Error" "swww is not installed"
    exit 1
fi

# Define rofi menu options
OPTIONS="No Effect\nBlack and White\nBlurred\nCharcoal\nNegate\nSharpen"

# Show rofi menu and get selection
SELECTION=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Select effect")

# Apply selected effect
case "$SELECTION" in
    "No Effect")
        cp "$WALLPAPER" "$OUTPUT"
        ;;
    "Black and White")
        magick "$WALLPAPER" -colorspace gray -sigmoidal-contrast 10,40% "$OUTPUT"
        ;;
    "Blurred")
        magick "$WALLPAPER" -blur 0x8 "$OUTPUT"
        ;;
    "Charcoal")
        magick "$WALLPAPER" -charcoal 0x5 "$OUTPUT"
        ;;
    "Negate")
        magick "$WALLPAPER" -negate "$OUTPUT"
        ;;
    "Sharpen")
        magick "$WALLPAPER" -sharpen 0x5 "$OUTPUT"
        ;;
    *)
        notify-send "Error" "No effect selected"
        exit 1
        ;;
esac

# Check if conversion was successful
if [ $? -eq 0 ]; then
    # Set the modified wallpaper using swww
    swww img "$OUTPUT" --transition-type wipe --transition-duration 2
    notify-send "Success" "Effect '$SELECTION' applied successfully"
else
    notify-send "Error" "Failed to apply effect"
    exit 1
fi
