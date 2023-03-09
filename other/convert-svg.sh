mkdir temp

declare -a res=(24)

for f in *.svg; do
    for r in "${res[@]}"; do
        inkscape -z -e temp/${f}${r}.png -w $r -h $r $f
    done
    resm=("${res[@]/#/temp/$f}")
    resm=("${resm[@]/%/.png}")
    convert "${resm[@]}" ${f%%.*}.ico

done

rm -rf temp
