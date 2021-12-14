source common.sh

name_exp_test=${name_exp}_test
path_ckpt=logs/$name_exp/checkpoints
path_latest=$(find $path_ckpt -name *.pth | sort | tail -n 1)

cp common.sh logs/$name_exp_test
cp test_sdfc.sh logs/$name_exp_test

CUDA_VISIBLE_DEVICES=0 python experiment_scripts/test_sdfc.py \
                              --checkpoint_path=$path_latest \
                              --experiment_name=$name_exp_test \
                              --resolution=128 \
                              --dim_embd=$dim_embd \
                              --num_class=$num_class \
                              --dim_hidden=$dim_hidden \
                              --num_layer=$num_layer \
                              --dropout=$dropout  
