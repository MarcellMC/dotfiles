#!/usr/bin/env bash

if [[ -z $(hyprctl workspaces | grep special:magic) ]]; then
    hyprctl dispatch 'hl.dsp.window.move({workspace = "special:magic", follow = false})'
else
    hyprctl --batch 'dispatch hl.dsp.workspace.toggle_special("magic");dispatch hl.dsp.window.move({workspace = "+0"})'
fi
