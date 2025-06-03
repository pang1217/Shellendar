# Shellendar
**Shellendar** is a lightweight, terminal-based task manager built with Bash. It let you schedule tasks by date and view them overlaid on your terminal calendar using the `cal` command.

## Features 
- View monthly calendar with task dates highlighted
- Add tasks for specific dates
- View tasks scheduled for any given day
- Simple text-based task storage (~/.task_schedule.txt)
- Works entirely in the terminal - no dependencies beyond standart UNIX tools

## Installation
1. Clone this repository :
```bash
git clone git@github.com:pang1217/Shellendar.git
cd Shellendar
```

2. Mask the script executable : 
```bash
chmod +x calendar.sh
```

3. (Optional) Add it to your PATH : 
```bash
sudo ln -s "$(pwd)/calendar.sh" /usr/local/bin/shellendar
```

## Usage
Run the script with any of the following commands : 
```bash
./calendar.sh add # Add a task for a specific date
./calendar.sh view # View current month's calendar with marked tash days
./calendar.sh tasks # View tasks for a specific date
```
### Exaxmple 
```bash
$ ./schedule.sh add
Enter date (YYYY-MM-DD): 2025-06-05
Enter task: Submit project report
Task added for 2025-06-05.

$ ./schedule.sh view
# Displays the calendar with the 5th highlighted

$ ./schedule.sh tasks
Enter date (YYYY-MM-DD): 2025-06-05
Tasks for 2025-06-05:
 -> Submit project report
```

## Task File Format
Tasks are stored in :
```bash
~/.task_schedule.txt
```
Each task is stored as :
```txt
YYYY-MM-DD|Task description
```

## Requirements
* Bash
* `cal` command (usually available in `util-linux`)
* `grep`, `sed`, `cut` (standart on most UNIX systems)

## Contributions
Pull requests and suggestions are welcome! Feel free to fork and improve **Shellendar**.
