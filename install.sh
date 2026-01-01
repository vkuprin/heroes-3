#!/usr/bin/env bash
set -e

# Configuration
VERSION_FILE=".installed_version"
GAME_WINE_INSTALLED_PATH="$HOME/.wine/drive_c/Games/Heroes3_HotA/"
DOWNLOAD_DIR="./downloads"

# Ensure download directory exists
mkdir -p "$DOWNLOAD_DIR"

# 1. Determine latest version dynamically
echo "Checking for latest HotA version..."
GAME_VERSION=$(curl -s https://h3hota.com/en/download | grep -o 'Latest version HotA [0-9.]*' | head -1 | awk '{print $4}')

if [ -z "$GAME_VERSION" ]; then
    echo "Error: Could not determine latest version from h3hota.com."
    exit 1
fi

echo "Latest version determined: $GAME_VERSION"

# Construct download URL
# Pattern: https://heroes3towns.com/HotA/HotA_1.8.0_setup.exe
GAME_INSTALLER_DOWNLOAD_URL="https://heroes3towns.com/HotA/HotA_${GAME_VERSION}_setup.exe"
INSTALLER_FILENAME="HotA_${GAME_VERSION}_setup.exe"
INSTALLER_PATH="${DOWNLOAD_DIR}/${INSTALLER_FILENAME}"

install_rosetta() {
  if [ -n "$CI" ]; then
    echo "CI environment detected. Skipping Rosetta installation."
    return
  fi
  if /usr/bin/pgrep oahd >/dev/null 2>&1; then
    echo "Rosetta is already installed."
  else
    echo "Installing Rosetta..."
    softwareupdate --install-rosetta --agree-to-license
  fi
}

install_wineskin() {
    if [ -n "$CI" ]; then
        echo "CI environment detected. Skipping Wineskin/Wine installation."
        return
    fi
    if brew list --cask | grep -q wineskin; then
        echo "Wineskin/Wine is already installed."
    else
        echo "Installing Wine via Homebrew..."
        brew install --cask --no-quarantine wine@staging
    fi
}

download_game_installer() {
    if [ -f "$INSTALLER_PATH" ]; then
        echo "Installer ($INSTALLER_FILENAME) already downloaded."
    else
        echo "Downloading $GAME_INSTALLER_DOWNLOAD_URL..."
        curl -L -o "$INSTALLER_PATH" "$GAME_INSTALLER_DOWNLOAD_URL"
    fi
}

install_hota() {
  CURRENT_INSTALLED_VERSION=""
  if [ -f "$VERSION_FILE" ]; then
    CURRENT_INSTALLED_VERSION=$(cat "$VERSION_FILE")
  fi

  if [ "$CURRENT_INSTALLED_VERSION" == "$GAME_VERSION" ]; then
    echo "HotA $GAME_VERSION is already installed."
  else
    echo "Installing/Updating to HotA $GAME_VERSION..."
    
    if [ -n "$CI" ]; then
        echo "CI environment detected. Skipping actual Wine execution."
        echo "Verifying installer file exists..."
        if [ -f "$INSTALLER_PATH" ]; then
            echo "Installer found at $INSTALLER_PATH"
            # Simulate successful install for CI
            echo "$GAME_VERSION" > "$VERSION_FILE"
        else
            echo "Error: Installer not found in CI!"
            exit 1
        fi
    else
        # Run the installer with Wine
        wine "$INSTALLER_PATH"
        
        # Update local version file
        echo "$GAME_VERSION" > "$VERSION_FILE"
        echo "Update complete."
    fi
  fi
}

run_hota() {
   if [ -n "$CI" ]; then
      echo "CI environment detected. Skipping game launch."
      return
   fi
   echo "Launching HotA..."
   cd "$GAME_WINE_INSTALLED_PATH"
   wine HotA_launcher.exe
}

# Main execution flow
install_rosetta
install_wineskin
download_game_installer
install_hota
run_hota
