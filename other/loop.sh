  GNU nano 4.8                        arbre.sh                                  
#!/bin/sh
i=0
while [ $i -ne $1 ]
do
        i=$(($i+1))

           mkdir user$i
           mkdir user$i/docs
           mkdir user$i/docs/news
           mkdir user$i/docs/old
           mkdir user$i/docs/future
           mkdir user$i/works
           mkdir user$i/backup
           touch user$i/docs/news/1.txt
           touch user$i/docs/news/2.txt

done
