# Heroes of Might and Magic III: Horn of the Abyss (HotA) macOS Installer

This repository provides an automated, dynamic installer for [Horn of the Abyss (HotA)](https://h3hota.com/en/download), a global expansion for Heroes of Might and Magic III, specifically tailored for macOS (Apple Silicon & Intel).

## 🚀 Features

*   **Dynamic Version Detection**: Automatically scrapes the official HotA website to find the latest version (no hardcoded versions!).
*   **Automated Dependency Management**: Checks for and installs:
    *   **Rosetta 2** (for Apple Silicon Macs).
    *   **Wine/Wineskin** (via Homebrew) to run the Windows executable.
*   **Smart Updates**: Compares your locally installed version with the latest web version and only runs the updater if necessary.
*   **One-Click Launch**: Functions as both an installer/updater and a game launcher.

## 📋 Prerequisites

Before running the script, ensure you have:

1.  **macOS** (Optimized for Apple Silicon, works on Intel).
2.  **Internet Connection** (for downloading the installer and dependencies).
3.  **Homebrew** installed. If you don't have it, install it by running:
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

> **Note**: You must own the original *Heroes of Might and Magic III* game files for HotA to work fully, though the HotA installer itself is a standalone package that often requires the base game data.

## 🛠 Installation & Usage

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/vkuprin/heroes-3.git
    cd heroes-3
    ```

2.  **Make the script executable**:
    ```bash
    chmod +x install.sh
    ```

3.  **Run the installer**:
    ```bash
    ./install.sh
    ```

## 📄 License

This project is for educational and utility purposes. *Heroes of Might and Magic III* is a trademark of Ubisoft. *Horn of the Abyss* is a fan-made expansion.
