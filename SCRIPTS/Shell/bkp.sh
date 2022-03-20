echo "Starting Backup"
DATE=`date +%Y-%m-%d-%H.%M.$$`
echo "Starting Backup, except *.tar extensions"
tar -zcvf blog-"${DATE}".tar.gz --exclude='*.tar' .
if [ "$?" -eq "0" ]
then
	echo "Backup Successfully..."
	exit 0
else
	echo "Backup has failed, please check"
	exit 1
fi
