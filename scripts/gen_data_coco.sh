sd_path="stabilityai/stable-diffusion-2"
batch_size=2

CUDA_VISIBLE_DEVICES=0 python -m gen_data \
    --work-dir data/gen_coco \
    --json-path data/prompts/coco_prompts.json \
    --data-type coco \
    --sd-path $sd_path \
    --batch-size $batch_size \
    --self-res 24 \
    --cross-res 12 \
    --start 0 --end 10

# If you have 2 gpus, you can generate the dataset in parallel with
# ```
# CUDA_VISIBLE_DEVICES=0 python -m gen_data \
#     --work-dir data/gen_coco \
#     --json-path data/prompts/coco_prompts.json \
#     --sd-path $sd_path \
#     --batch-size $batch_size \
#     --start 0 --end 20000

# CUDA_VISIBLE_DEVICES=1 python -m gen_data \
#     --work-dir data/gen_coco \
#     --json-path data/prompts/coco_prompts.json \
#     --sd-path $sd_path \
#     --batch-size $batch_size \
#     --start 20000 --end 40000
# ```