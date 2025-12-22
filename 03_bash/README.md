## Bash Scripts

### 1. log-analyzer.sh

**Purpose**: Analyzes log files to count ERROR entries and display the last error with timestamp.

**Usage**:

```bash
chmod +x log-analyzer.sh
./log-analyzer.sh sample-application.log
```

**Output**:

- Counts total ERROR occurrences
- Displays the last ERROR entry
- Extracts and displays timestamp

---

### 2. backup-script.sh

**Purpose**: Creates compressed backups of /var/www/html with date-stamped filenames.

**Usage**:

```bash
chmod +x backup-script.sh
sudo ./backup-script.sh
```

**Output**:

- Creates tar.gz compressed archives
- Appends current date to filename (YYYY-MM-DD)
- Creates backup directory if it doesn't exist
- Displays backup size and location

**Backup Format**: `www-backup-YYYY-MM-DD.tar.gz`

---

### 3. disk-usage-alert.sh

**Purpose**: Monitors disk usage and alerts if any partition exceeds 80% usage.

**Usage**:

```bash
chmod +x disk-usage-alert.sh
./disk-usage-alert.sh
```

**Output**:

- Scans all mounted partitions
- Displays usage percentage for each partition
- Prints ALERT if usage > 80%
- Color-coded output for easy identification
- Exit code 1 if any partition exceeds threshold

---

## Sample Log File

A sample log file (`sample-application.log`) is included for testing the log analyzer script.
