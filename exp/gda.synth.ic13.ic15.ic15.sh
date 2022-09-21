exp_path=$(dirname $0)
exp_name=$(basename $0 | sed -E "s,\.sh$,,")

CUDA_VISIBLE_DEVICES=$1 python3.6 -u $exp_path/../train_da_gradual.py \
--Transformation TPS --FeatureExtraction ResNet --SequenceModeling BiLSTM --Prediction Attn \
--src_train_data /dataset/OOV/data_lmdb_release/training/ \
--tar_train_data /workspace/data_CVPR2021/training/label/real/ \
--tar_select_data "3.IC13-4.IC15" --tar_batch_ratio "0.5-0.5" --tar_domain_ratio "0.5-0.5" \
--valid_data /dataset/data_lmdb_release/IC15/test/ \
--batch_size 128 --lr 1 \
--experiment_name _$exp_name --pc 0.1 \
2>&1 | tee $exp_path/$exp_name.log