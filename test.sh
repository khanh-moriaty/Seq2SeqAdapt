find $1 -name "iter_300000.pth" \
    | xargs -I {} python3.6 test.py --benchmark_all_eval \
        --Transformation TPS \
        --FeatureExtraction ResNet \
        --SequenceModeling BiLSTM \
        --Prediction Attn \
        --eval_data /workspace/data_CVPR2021/evaluation/all \
        --saved_model {}