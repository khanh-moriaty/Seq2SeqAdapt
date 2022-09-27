exp_path=$(dirname $1)
exp_name=$(basename $1)
output_file_train=$exp_path/train.$exp_name.csv
output_file=$exp_path/val.$exp_name.csv

echo $output_file

echo "iter,train_loss,cls_loss,sim_loss" > $output_file_train

  cat $1 \
| grep "Loss" \
| sed -E "s|\[([0-9]+)/[0-9]+\] Loss: ([0-9.]+) CLS_Loss: ([0-9.]+) SIMI_Loss: ([0-9.]+) .*$|\1,\2,\3,\4|" \
| tee -a $output_file_train

echo "iter,val_loss,acc" > $output_file

  cat $1 \
| grep "valid loss" \
| sed -E "s|\[([0-9]+)/[0-9]+\] valid loss: ([0-9.]+) accuracy: ([0-9.]+),.*$|\1,\2,\3|" \
| tee -a $output_file