# 🗄️ Multi DB Backup Script

This script automatically creates daily backups of multiple MySQL and SQLite databases.

It saves each backup in a separate folder for each database, with filenames including timestamps for easy tracking.

The script keeps only the 10 most recent backups for each database, deleting older ones automatically.

## 📂 How to Use

### Step 1:
 Open the databases.conf file and list the details of all the databases you want to back up.

Each line in the file should describe one database using the correct format (MySQL or SQLite).

### Step 2:
 Use crontab to schedule the script so it runs every day automatically.

To do this, open your crontab editor by running the command:
```
crontab -e.
```

Then add this line at the bottom to run the script every day at 2:00 AM:
```
0 2 * * * /full/path/to/multi_db_backup.sh
```

Make sure to replace /full/path/to/multi_db_backup.sh with the actual full path to your backup script file.

