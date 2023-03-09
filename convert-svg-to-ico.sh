
declare -a res=(16 24 32 48 64 128 256)

for d in */; do
    echo "$d"
    cd "./$d"
    mkdir temp
    for f in *.svg; do
        for r in "${res[@]}"; do
            inkscape -z -e temp/${f}${r}.png -w $r -h $r $f
        done
        resm=("${res[@]/#/temp/$f}")
        resm=("${resm[@]/%/.png}")
        convert "${resm[@]}" ${f%%.*}.ico

    done
    # rm -rf temp
    mv temp imagens
    cd ..
done

