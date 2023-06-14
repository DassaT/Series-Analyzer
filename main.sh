@@ -25,19 +25,19 @@ function input_series() {
}

function display_og_series() {
   local arr="$@"
   local arr=("$@")
   echo ${arr[@]} 
}

function display_sorted_series() {
    local arr="$@"
    local arr=("$@")
    local sorted=$(echo "${arr[@]}" | tr ' ' '\n' | sort -n)  
    # echo "Sorted numbers smallest to largest: "
    echo ${sorted[@]}
}

function print_max() {
    local arr="$@"
    local arr=("$@")
    arr=$(display_soreted_series ${arr[@]})
    local len=${#arr[@]} # $(series_length ${arr[@]})
    local max_location=$(( $len-1 ))
@@ -46,22 +46,22 @@ function print_max() {
}

function print_min() {
    local arr="$@"
    local arr=("$@")
    arr=$(display_soreted_series ${arr[@]})
    local min=${arr[0]}
    echo $min
}

function print_avg() { 
    local arr="$@"
    local sum= $(sum_series ${arr[@]})
    local len= $(series_length ${arr[@]})
    avg=$(echo “scale=3;$sum/$len” | bc)
    local arr=("$@")
    local sum=$(sum_series ${arr[@]})
    local len=$(series_length ${arr[@]})
    local avg=$(echo "scale=3;$sum/$len" | bc)
    echo "$avg" 
}

function series_length() {
    local arr="$@"
    local arr=("$@")
    local len=${#arr[@]}
    echo  "$len"
}
@@ -76,7 +76,7 @@ function sum_series() {
}

series="$@"
is_valid=$(less_then_3 ${series[@]})
is_valid=$(less_than_3 ${series[@]})
if [ $is_valid -eq 0 ]
then    
    series=$(input_series)
@@ -109,12 +109,12 @@ do
            echo "The average of the series is: $avg"
             ;;
        Series_Length )
            len=$(print_avg ${series[@]})
            len=$(series_length ${series[@]})
            echo "The length of the series is: $len"
            ;;
        Series_Sum )
            sum=$(print_avg ${series[@]})
            echo "The length of the series is: $sum"
            sum=$(sum_series ${series[@]})
            echo "The sum of the series is: $sum"
            ;;
        Exit )
            exit 
