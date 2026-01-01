# Heroes of Might and Magic III: Horn of the Abyss (HotA) macOS Installer

Dynamic installer for [Horn of the Abyss (HotA)](https://h3hota.com/en/download), a global expansion for Heroes of Might and Magic III, specifically tailored for macOS (Apple Silicon & Intel).

## 📋 Setup

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
