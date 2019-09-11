#!/bin/bash
# User specific values here
pangaea_path=.; # CWD folder by default
amount_base=0.00; # The amount you wish to send in every transaction

# Set static variables
wallet=$(LD_LIBRARY_PATH=. ./wallet.sh -t list | grep account | awk '{print $2}' | head -n1); # Set CWD folder as default install path
shardid=$(grep -Eom1 "\"shardID\"\:[0-9]+" latest/validator*.log | awk -F: '{print $2}'); # Defines the shard to use

# Main loop starts here
while true; do

# Set dinamic variables 
amount=$amount_base$(($RANDOM + 1)); # Defines the base ammount to send in every TX
pga_out=$(curl -s https://harmony.one/pga/network.csv);
nodes_online_count=$(echo "${pga_out}" |  grep -c .*,$shardid,true);
recipient=$(echo "${pga_out}" | grep -v $wallet | shuf -n 1 | awk -F , '{print$1}');

# Run wallet transfers
#./wallet.sh -t transfer --from $wallet --to $recipient --amount $amount --shardID $shardid --toShardID $(( RANDOM % 4 )) --pass pass:
./wallet.sh -t transfer --from $wallet --to $recipient --amount $amount --shardID $shardid --toShardID $shardid --pass pass:
wait

done
