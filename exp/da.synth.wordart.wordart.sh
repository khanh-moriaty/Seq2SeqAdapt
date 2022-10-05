exp_path=$(dirname $0)
exp_name=$(basename $0 | sed -E "s,\.sh$,,")
mkdir -p $exp_path/log

CUDA_VISIBLE_DEVICES=$1 python3.6 -u $exp_path/../train_da_global_local_selected.py \
--Transformation TPS --FeatureExtraction ResNet --SequenceModeling BiLSTM --Prediction Attn \
--src_train_data /dataset/OOV/data_lmdb_release/training/ \
--tar_train_data /workspace/data_CVPR2021/training/label/real/ \
--tar_select_data "12.WordArt" --tar_batch_ratio "0.5" \
--valid_data /workspace/data_CVPR2021/validation/12.WordArt/ \
--batch_size 128 --lr 1 \
--experiment_name _$exp_name --pc 0.1 \
2>&1 | tee $exp_path/log/$exp_name.log