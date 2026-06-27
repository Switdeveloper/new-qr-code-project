#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
RESET='\033[0m'

cd "$(dirname "$0")"

echo -e "${GREEN}"
echo "  KWARA STATE POLYTECHNIC, ILORIN"
echo "  School Fees Recording System"
echo -e "${RESET}"

FILE="school-fees.html"

case "$(uname)" in
  Linux)
    if command -v xdg-open &>/dev/null; then
      xdg-open "$FILE" &>/dev/null &
    elif command -v sensible-browser &>/dev/null; then
      sensible-browser "$FILE" &>/dev/null &
    else
      echo "Open $FILE in your browser."
    fi
    ;;
  Darwin)
    open "$FILE" &>/dev/null &
    ;;
  MINGW*|MSYS*|CYGWIN*)
    start "$FILE" &>/dev/null &
    ;;
  *)
    echo "Open $FILE in your browser."
    ;;
esac
