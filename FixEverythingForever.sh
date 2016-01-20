#!/bin/bash
echo Im sorry your computer is not working
echo Let me Help
sleep 2
read -n1 -r -p "Press Enter to Fix Everything..." key
  if [ "$key" = ' ' ]; then
    sudo rm -rf ~/Desktop/memes.txt
  fi
  exit
fi
