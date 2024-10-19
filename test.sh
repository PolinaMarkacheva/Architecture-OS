path=$1
limit=$2
cd $path
print_limit=$(df -h $path | awk 'NR == 2 {print $5}')
print_limit2=$(echo $print_limit | tr -d '%')
echo $print_limit2
if [ $print_limit2 -gt  $limit ]; then
mkdir -p old_files
find $path -type f -atime +30 -exec mv {} old_files/ \;
new_cd=$(echo $path | sed 's|/[^/]*$||')
cd $new_cd
mkdir -p backup
new_cd=$(echo $new_cd/backup)
path_to_old=$(echo $path/old_files)
tar -czvf $new_cd/archiver.tar.gz -C $path_to_old/
rm -r $path_to_old
else
echo "Limit unreached"
exit 1
fi