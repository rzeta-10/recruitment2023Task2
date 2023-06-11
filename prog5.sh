#!/bin/bash

# Create a 2D matrix workspace
rows=5
cols=5
workspace=()
for ((i = 0; i < rows; i++)); do
    row=()
    for ((j = 0; j < cols; j++)); do
        row+=("1")
    done
    workspace+=("$row")
done

# Function to insert an obstacle at given coordinates
insert_obstacle() {
    local row=$1
    local col=$2
    workspace[$row][$col]="0"
}

# Function to move the robot
move_robot() {
    local current_row=$1
    local current_col=$2
    local new_row=$3
    local new_col=$4
    
    workspace[$current_row][$current_col]="1"
    workspace[$new_row][$new_col]="R"
}

# Function to display the workspace
display_workspace() {
    for ((i = 0; i < ${#workspace[@]}; i++)); do
        for ((j = 0; j < ${#workspace[i]}; j++)); do
            echo -n "${workspace[$i][$j]} "
        done
        echo
    done
}

# Insert an obstacle at coordinates (2, 3)
insert_obstacle 2 3

# Move the robot from coordinates (1, 1) to (3, 2)
move_robot 1 1 3 2

# Display the updated workspace
display_workspace
