#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
RESET='\033[0m'

cd "$(dirname "$0")"
FILE="login.html"

case "$(uname)" in
  Linux)
    echo -e "${GREEN}Opening Kwara Poly Fees...${RESET}"
    if command -v xdg-open &>/dev/null; then
      xdg-open "$FILE" &>/dev/null &
    else
      sensible-browser "$FILE" &>/dev/null &
    fi
    ;;
  Darwin)
    echo -e "${GREEN}Opening Kwara Poly Fees...${RESET}"
    open "$FILE" &>/dev/null &
    ;;
  MINGW*|MSYS*|CYGWIN*)
    echo -e "${GREEN}Opening Kwara Poly Fees...${RESET}"
    cmd.exe /c start "" "$FILE" &>/dev/null &
    ;;
  *)
    echo "Open $FILE in your browser."
    ;;
esac
