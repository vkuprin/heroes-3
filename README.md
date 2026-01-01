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

### What the script does:
1.  **Checks** if Rosetta is installed (on Apple Silicon).
2.  **Installs** Wine via Homebrew if missing.
3.  **Fetches** the latest HotA version number from `h3hota.com`.
4.  **Downloads** the specific setup executable for that version.
5.  **Installs/Updates** the game using Wine.
6.  **Launches** the game launcher.

## 📂 Project Structure

*   `install.sh`: The main script that handles logic, downloading, and execution.
*   `downloads/`: Directory where installer `.exe` files are cached (ignored by git).
*   `.installed_version`: Local file tracking your current version to prevent unnecessary updates.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1.  Fork the project.
2.  Create your feature branch (`git checkout -b feature/AmazingFeature`).
3.  Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4.  Push to the branch (`git push origin feature/AmazingFeature`).
5.  Open a Pull Request.

## 📄 License

This project is for educational and utility purposes. *Heroes of Might and Magic III* is a trademark of Ubisoft. *Horn of the Abyss* is a fan-made expansion.
