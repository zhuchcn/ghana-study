#!/usr/bin/env bash -l

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -o|--output-dir)
        output_dir="$2"
        shift 2
        ;;
    *)    
        POSITIONAL+=("$1") # save it in an array for later
        shift # past argument
        ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

R -q -e "rmarkdown::render(\"$1\", output_dir=\"$output_dir\")"