exp_path=$(dirname $1)
exp_name=$(basename $1)
output_file=$exp_path/val.$exp_name.csv

echo "iter,val_loss" > $output_file

  tail -f -n +1 $1 \
| grep "valid loss" \
| sed -E "s|\[([0-9]+)/[0-9]+\] valid loss: ([0-9.]+) .*$|\1,\2|" \
| tee -a $output_file