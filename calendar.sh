#!/bin/bash

TASK_FILE="./task_schedule.txt"

add_task(){
    read -p "Enter date (YYYY-MM-DD) : " date
    read -p "Enter task : " task
    echo "$date|$task" >> "$TASK_FILE"
    echo "Task added for $date."
}


show_calendar(){
    month=$(date +%m)
    year=$(date +%Y)
    cal_output=$(cal "$month" "$year")

    days=($(grep "^$year-$month" "$TASK_FILE" | cut -d'-' -f3 | cut -d'|' -f1 | sed 's/^0*//'))

    for d in "${days[@]}" ; do
        formatted_day=$(printf "%2d" "$d")
        highlight=$(printf " \33[1;31m%2d\033[0m" "$d")
        cal_output=$(echo "$cal_output" | sed "s/ $formatted_day/$highlight/")
    done

    echo -e "$cal_output"
}

show_tasks_for_day() {
    read -p "Enter date (YYYY-MM-DD): " date
    echo "Tasks for $date:"
    grep "^$date|" "$TASK_FILE" | cut -d'|' -f2 | while read -r task; do 
        echo " -> $task" 
    done
}

case "$1" in 
    add)
        #echo add
        add_task
        ;;
    view)
        # echo view
        show_calendar
        ;;
    tasks)
        #echo tasks
        show_tasks_for_day
        ;;
    *)
        echo "usage $0 {add|view|tasks}"
        ;;
esac
