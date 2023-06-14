#! /bin/bash

function less_than_3() {
    local arr=("$@")
    local arr_len=${#arr[@]} 
    if [[ $arr_len -lt 3 ]];
    then    
        echo -e "The number of arguments is not enough,\nenter at least 3 arguments"    
        echo "0"
    else
        echo "1"
    fi
}

function input_series() {
    echo "Please a sequence of number seperated by spcae"
    read sqnc
    if [ $sqnc =~ '^[0-9 ]+$' ];
    then
        local input_array=(${sqnc[@]}) #($seqc)
        echo "${input_array[@]}"
    else
        echo "0"
    fi
}

function display_og_series() {
   local arr=("$@")
   echo ${arr[@]} 
}

function display_sorted_series() {
    local arr=("$@")
    local sorted=$(echo "${arr[@]}" | tr ' ' '\n' | sort -n)  
    # echo "Sorted numbers smallest to largest: "
    echo ${sorted[@]}
}

function print_max() {
    local arr=("$@")
    arr=$(display_soreted_series ${arr[@]})
    local len=${#arr[@]} # $(series_length ${arr[@]})
    local max_location=$(( $len-1 ))
    local max=${arr[$max_location]}
    echo $max
}

function print_min() {
    local arr=("$@")
    arr=$(display_soreted_series ${arr[@]})
    local min=${arr[0]}
    echo $min
}

function print_avg() { 
    local arr=("$@")
    local sum=$(sum_series ${arr[@]})
    local len=$(series_length ${arr[@]})
    local avg=$(echo "scale=3;$sum/$len" | bc)
    echo "$avg" 
}

function series_length() {
    local arr=("$@")
    local len=${#arr[@]}
    echo  "$len"
}
function sum_series() {
    local arr=("$@")
    local sum=0
    for i in ${arr[@]};
      do
          sum=$(( $sum + $i ))
      done
    echo "$sum"
}

series="$@"
is_valid=$(less_than_3 ${series[@]})
if [ $is_valid -eq 0 ]
then    
    series=$(input_series)
    series=($series)
fi

select operation in Input_Series OG_Series Sorted_Series Series_Max Series_Min Series_AVG Series_Length Series_Sum Exit ;
do 
    case $operation in 
        Input_Series ) 
            series=$(input_series)
            series=($series)
            ;;               
        OG_Series )
            display_og_series ${series[@]}
            ;;
        Sorted_Series ) 
            display_sorted_series ${series[@]}
            ;;
        Series_Max ) 
            max=$(print_max ${series[@]})
            echo "The maximum value in the series is: $max"
             ;;
        Series_Min ) 
            min=$(print_min ${series[@]})
            echo "The maximum value in the series is: $min"
             ;;
         Series_AVG ) 
            avg=$(print_avg ${series[@]})
            echo "The average of the series is: $avg"
             ;;
        Series_Length )
            len=$(series_length ${series[@]})
            echo "The length of the series is: $len"
            ;;
        Series_Sum )
            sum=$(sum_series ${series[@]})
            echo "The sum of the series is: $sum"
            ;;
        Exit )
            exit 
            ;;
        * )
            echo "Invalid choice, try again!" 
            ;;
    esac    
done
