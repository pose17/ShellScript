#!/bin/bash

# Function definitions
YES() {
    echo
    echo "YES" | boxes -d critical
    echo
}

NO() {
    echo "NO"
}

FAIL() {
    echo "[  FAIL  ]"
    exit 2
}

# Variable definitions


# Main function
echo -n "선택하십쇼~(yes/no): "
read CHOICE

case $CHOICE in
    y|Y|yes|YES|Yes) YES ;;
    n|N|no|NO|No)    NO ;;
    *)               FAIL;;
esac