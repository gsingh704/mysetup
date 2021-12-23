#!/bin/sh
i=0
while [ $i -ne $1 ]
do
        i=$(($i+1))
        mkdir -p user$i/docs/news  user$i/docs/old  user$i/docs/future  user$i/works   user$i/backup
        touch  user$i/docs/news/1.txt     user$i/docs/news/2.txt
done
