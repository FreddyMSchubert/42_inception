rm directory_contents.log
find ./srcs -type d -name "web" -prune -o -type f -print | while read -r file; do
    echo "----- $file -----" >> directory_contents.log
    head -n 100 "$file" >> directory_contents.log  # Logs first 100 lines
    echo -e "\n" >> directory_contents.log
done
