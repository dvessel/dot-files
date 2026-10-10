#!/usr/bin/env zsh

if [[ -n $commands[realesrgan] ]]
then
  for m in $HOME/.local/share/realesrgan-ncnn-vulkan/models/*.param
  do
    alias "realesrgan.${m:t:r}"="realesrgan -n ${m:t:r}"
    compdef realesrgan.${m:t:r} _realesrgan
  done
fi
