git checkout master

git pull https://github.com/influxdata/influxdb-java.git master || exit 1

#git commit -m "Merging upstream" || exit 1

git push origin master || exit 1

git checkout plugin || exit 1

git merge master || exit 1
