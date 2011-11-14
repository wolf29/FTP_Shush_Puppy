# Read source directories in array
mapfile -t oldnames < <(find ../ftarget7/example1/ -maxdepth 1 -mindepth 1 -type d | sort)
# Read target names in array
mapfile -t newnames < flist16.txt

echo "oldnames: ${#oldnames[@]} : ${oldnames[@]}"
echo "newnames: ${#newnames[@]} : ${newnames[@]}"

# Compare array sizes
[[ ${#oldnames[@]} -ne ${#newnames[@]} ]] && echo "Data inconsistent" && exit
