#! /bin/bash


string ="#define SAMPLES "
echo ""> ans.txt
max = 20000
for i in {35000..80000..5000}
do
    #string1 = "#define SAMPLES ${i}"
    #echo "${string1}"
    sed -i "12s/.*/#define SAMPLES $i/" cpa.c
    gcc cpa.c helpers.c -lm
    echo "$i" >> ans.txt
     ./a.out  Trace/Trace/waveTDC2024-2-24_12-11-31.data  Trace/Trace/data-out2024-2-24_12-11-31.txt >> ans.txt

done
#string1 = ${string}$
#sed -i '12s/.*/#define SAMPLES ${i}/' cpa.c
