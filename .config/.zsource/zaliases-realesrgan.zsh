#!/usr/bin/env zsh

if (( $+commands[realesrgan] ))
then
  for m in $XDG_DATA_HOME/realesrgan-ncnn-vulkan/models/*.param
  do
    alias "realesrgan.${m:t:r}"="realesrgan -n ${m:t:r}"
    compdef realesrgan.${m:t:r} _realesrgan
  done
fi
