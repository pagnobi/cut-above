#!/bin/sh
# src/game.html is the game as published on claude.ai (claude.ai adds the page skeleton itself).
# This wraps it into the complete index.html that GitHub Pages serves.
cd "$(dirname "$0")"
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n</head>\n<body>\n'
  cat src/game.html
  printf '\n</body>\n</html>\n'
} > index.html
echo "Built index.html"
