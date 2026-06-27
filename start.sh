#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
DARK='\033[0;90m'
BOLD='\033[1m'
RESET='\033[0m'

PORT=${1:-8080}

cleanup() {
  echo -e "\n${GREEN}Shutting down...${RESET}"
  [ -n "$SERVER_PID" ] && kill "$SERVER_PID" 2>/dev/null
  exit 0
}
trap cleanup SIGINT SIGTERM

echo -e "${GREEN}"
echo "  ╔══════════════════════════════════════════╗"
echo "  ║                                          ║"
echo "  ║     KWARA STATE POLYTECHNIC, ILORIN      ║"
echo "  ║     School Fees Recording System         ║"
echo "  ║                                          ║"
echo "  ║     Technology, Innovation and Service   ║"
echo "  ║                                          ║"
echo "  ╚══════════════════════════════════════════╝"
echo -e "${RESET}"

cd "$(dirname "$0")"

if ! command -v python3 &>/dev/null; then
  echo -e "${DARK}Python3 not found, trying python...${RESET}"
  if ! command -v python &>/dev/null; then
    echo "Error: Python is required to start the server."
    exit 1
  fi
  PYTHON=python
else
  PYTHON=python3
fi

echo -e "${BOLD}Starting server on port ${PORT}...${RESET}"
$PYTHON -m http.server "$PORT" --bind 127.0.0.1 &
SERVER_PID=$!
sleep 1

URL="http://127.0.0.1:${PORT}/school-fees.html"
echo -e "${GREEN}Opening ${URL}${RESET}"

case "$(uname)" in
  Linux)
    if command -v xdg-open &>/dev/null; then
      xdg-open "$URL" &>/dev/null &
    elif command -v sensible-browser &>/dev/null; then
      sensible-browser "$URL" &>/dev/null &
    fi
    ;;
  Darwin)
    open "$URL" &>/dev/null &
    ;;
  MINGW*|MSYS*|CYGWIN*)
    start "$URL" &>/dev/null &
    ;;
esac

echo -e "${DARK}Press Ctrl+C to stop.${RESET}"
wait "$SERVER_PID"
