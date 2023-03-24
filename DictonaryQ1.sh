declare -A results

# roll the die and store the result in the array
while true; do
    # roll the die and store the result
    roll=$((1 + RANDOM % 6))
    results["$roll"]=$((results["$roll"] + 1))
    
    # check if any number has been rolled 10 times
    for key in "${!results[@]}"; do
        if (( results["$key"] >= 10 )); then
            echo "Number $key was rolled ${results["$key"]} times."

            # find the number that was rolled the most and the least
            max_key=$key
            min_key=$key
            for k in "${!results[@]}"; do
                if (( results["$k"] > results["$max_key"] )); then
                    max_key=$k
                fi
                if (( results["$k"] < results["$min_key"] )); then
                    min_key=$k
                fi
            done
            echo "Number $max_key was rolled the most (${results["$max_key"]} times)."
            echo "Number $min_key was rolled the least (${results["$min_key"]} times)."

            # exit the script
            exit 0
        fi
    done
done
