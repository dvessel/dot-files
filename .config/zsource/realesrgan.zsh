#!/usr/bin/env zsh

if (( $+commands[realesrgan] ))
then
  local model
  for model in $XDG_DATA_HOME/realesrgan-ncnn-vulkan/models/*.param(:t:r.N)
  do alias "realesrgan.$model"="realesrgan -n $model"
  done
fi
