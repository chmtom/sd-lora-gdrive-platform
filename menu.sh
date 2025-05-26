#!/bin/bash

clear
echo "====================="
echo "RunPod SD Platform"
echo "====================="
echo "1 - Launch AUTOMATIC1111 WebUI"
echo "2 - Launch kohya_ss GUI"
echo "3 - Enter bash shell"
echo "4 - Run txt2img from /prompts/prompts.csv"
echo "5 - Exit"
echo "====================="
read -p "Choose an option: " choice

case $choice in
    1) bash A1111-start.sh ;;
    2) bash Kohya-start.sh ;;
    3) /bin/bash ;;
    4) python3 generate_from_csv.py ;;
    5) exit 0 ;;
    *) echo "Invalid option"; sleep 2; bash menu.sh ;;
esac
