# 🔋⚠️ Office Wi-Fi Battery Alert

This project contains a bash script that checks if your MacBook is on battery power when connected to certain Wi-Fi networks (like office networks). If it meets both conditions, it'll use text-to-speech to remind you to plug in your laptop and save battery life!

## Requirements

-   macOS (tested on macOS Catalina and later)
-   Terminal access

## Installation

1. Clone this repository or download the script file.
2. Open Terminal and navigate to the directory containing the script.
3. Make the script executable:

```bash
chmod +x battery-saver.sh
```

## Configuration

1. Open `battery-saver.sh` in a text editor.
2. Modify the `office_networks` array to include your office Wi-Fi network names:

```bash
office_networks=("Eleven Ways" "Home")
```

## Setting Up the Cron Job

To run the script automatically every 15 minutes:

1. Open Terminal.
2. Edit your crontab file:
    ```
    crontab -e
    ```
3. Add the following line (replace `/path/to/script` with the actual path):
    ```
    */15 * * * * /path/to/script/battery-saver.sh
    ```
4. Save and exit the editor.

## Manual Execution

To run the script manually:

```
./battery-saver.sh
```

## How It Works

1. The script checks if the MacBook is running on battery power.
2. It then checks if the current Wi-Fi network matches any in the predefined list of office networks.
3. If both conditions are true, it uses the `say` command to speak a reminder message.

## Customization

-   Modify the `speak_message` function to change the reminder text.
-   Adjust the cron job timing as needed (e.g., change `*/15` to `*/5` for every 5 minutes).

## Troubleshooting

-   Ensure the script has execute permissions.
-   Check that the Wi-Fi interface name (en0) matches your system. Use `networksetup -listallhardwareports` to verify.
-   Make sure your system volume is audible for the speech alert.

## License

This project is open source and available under the [MIT License](LICENSE).

## Contributing

Contributions, issues, and feature requests are welcome. Feel free to check [issues page](https://github.com/yourusername/your-repo-name/issues) if you want to contribute.

## Author

Roel Van Gils
