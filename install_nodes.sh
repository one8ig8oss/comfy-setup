#!/bin/bash
# ComfyUI Custom Nodes Installer for BIG BOSS
# Run this on a fresh pod to install all custom nodes
# Usage: bash install_nodes.sh

NODES_DIR="/workspace/runpod-slim/ComfyUI/custom_nodes"
VENV="/workspace/runpod-slim/ComfyUI/.venv-cu128/bin/pip"

cd "$NODES_DIR"
echo "Installing custom nodes..."

# Confirmed URLs
git clone https://github.com/MoonGoblinDev/Civicomfy.git
git clone https://github.com/M1kep/ComfyLiterals
git clone https://github.com/crystian/ComfyUI-Crystools.git ComfyUI-Crystools
git clone https://github.com/city96/ComfyUI-GGUF.git ComfyUI-GGUF
git clone https://github.com/kijai/ComfyUI-GIMM-VFI.git
git clone https://github.com/kijai/ComfyUI-KJNodes.git
git clone https://github.com/Lightricks/ComfyUI-LTXVideo.git
git clone https://github.com/ltdrdata/ComfyUI-Manager.git
git clone https://github.com/princepainter/ComfyUI-PainterLongVideo.git
git clone https://github.com/yuvraj108c/ComfyUI-Rife-Tensorrt.git
git clone https://github.com/MadiatorLabs/ComfyUI-RunpodDirect.git
git clone https://github.com/GACLove/ComfyUI-VFI.git
git clone https://github.com/kijai/ComfyUI-WanVideoWrapper.git
git clone https://github.com/TripleHeadedMonkey/ComfyUI-Zlycoris.git
git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git
git clone https://github.com/ClownsharkBatwing/RES4LYF.git
git clone https://github.com/melMass/comfy_mtb.git comfy-mtb
git clone https://github.com/sipherxyz/comfyui-art-venture.git comfyui-art-venture
git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git comfyui-custom-scripts
git clone https://github.com/yolain/ComfyUI-Easy-Use.git comfyui-easy-use
git clone https://github.com/Fannovel16/ComfyUI-Frame-Interpolation.git comfyui-frame-interpolation
git clone https://github.com/alexopus/ComfyUI-Image-Saver.git comfyui-image-saver
git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack.git comfyui-impact-pack
git clone https://github.com/kijai/ComfyUI-MMAudio.git comfyui-mmaudio
git clone https://github.com/Smirnov75/comfyui-mxtoolkit.git comfyui-mxtoolkit
git clone https://github.com/11dogzi/Comfyui-ergouzi-Nodes.git comfyui-simple-switch
git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git comfyui-videohelpersuite
git clone https://github.com/boobkake22/ComfyUI-WanResolutions.git comfyui-wanresolutions
git clone https://github.com/jtydhr88/ComfyUI-Workflow-Encrypt.git comfyui-workflow-encrypt
git clone https://github.com/Comfy-Org/Nvidia_RTX_Nodes_ComfyUI.git comfyui_nvidia_rtx_nodes
git clone https://github.com/gseth/ControlAltAI-Nodes.git controlaltai-nodes
git clone https://github.com/rgthree/rgthree-comfy.git
git clone https://github.com/numz/ComfyUI-SeedVR2_VideoUpscaler.git seedvr2_videoupscaler
git clone https://github.com/VraethrDalkr/ComfyUI-TripleKSampler.git tripleksampler

echo ""
echo "Installing pip requirements..."
for req in "$NODES_DIR"/*/requirements.txt; do
    if [ -f "$req" ]; then
        NODE=$(basename $(dirname "$req"))
        echo "[$NODE] installing requirements..."
        $VENV install -r "$req" -q 2>/dev/null || true
    fi
done

# Extra packages needed
$VENV install colored tensorrt polygraphy -q 2>/dev/null || true

echo ""
echo "Done! Restart ComfyUI to load all nodes."
