#!/usr/bin/env zsh

if type realesrgan &>/dev/null; then
  for m in $HOME/.local/share/realesrgan-ncnn-vulkan/models/*.param; do
    alias "realesrgan.${m:t:r}"="realesrgan -n ${m:t:r}"
    compdef realesrgan.${m:t:r} _realesrgan
  done
fi
