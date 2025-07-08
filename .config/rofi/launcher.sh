#!/usr/bin/env bash
theme_name="onedark"
theme_dir="$HOME/.config/rofi/themes/$theme_name"
launcher="$theme_dir/style.rasi"
term="ghostty"
rofi \
	-show drun \
	-terminal $term \
	-kb-cancel Escape \
	-theme $launcher \
