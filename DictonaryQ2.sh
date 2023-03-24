declare -A birth_months

# generate the birth month of 50 individuals between the year 92 and 93
for (( i=1; i<=50; i++ )); do
    # generate a random birth year between 92 and 93
    birth_year=$((92 + RANDOM % 2))

    # generate a random birth month between 1 and 12
    birth_month=$((1 + RANDOM % 12))
    
    # add the birth month to the array
    birth_months["$i"]=$birth_month
done

# find all the individuals having birthdays in the same month
for (( month=1; month<=12; month++ )); do
    echo "Individuals with birthdays in month $month:"
    for key in "${!birth_months[@]}"; do
        if (( birth_months["$key"] == month )); then
            echo "- Individual $key"
        fi
    done
done
