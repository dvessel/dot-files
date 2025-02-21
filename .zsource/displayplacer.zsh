#!/usr/bin/env zsh

if type displayplacer &>/dev/null; then

  alias dpmore:120hz='displayplacer     "id:1 mode:72"'
  alias dpmore:60hz='displayplacer      "id:1 mode:73"'
  alias dpmore:59.94hz='displayplacer   "id:1 mode:74"'
  alias dpmore:50hz='displayplacer      "id:1 mode:75"'
  alias dpmore:48hz='displayplacer      "id:1 mode:76"'

  alias dpmore:notchless:120hz='displayplacer     "id:1 mode:66"'
  alias dpmore:notchless:60hz='displayplacer      "id:1 mode:67"'
  alias dpmore:notchless:59.94hz='displayplacer   "id:1 mode:68"'
  alias dpmore:notchless:50hz='displayplacer      "id:1 mode:69"'
  alias dpmore:notchless:48hz='displayplacer      "id:1 mode:70"'

  alias dpnative:120hz='displayplacer   "id:1 mode:54"'
  alias dpnative:60hz='displayplacer    "id:1 mode:55"'
  alias dpnative:59.94hz='displayplacer "id:1 mode:56"'
  alias dpnative:50hz='displayplacer    "id:1 mode:57"'
  alias dpnative:48hz='displayplacer    "id:1 mode:58"'

  alias dpnative:notchless:120hz='displayplacer   "id:1 mode:48"'
  alias dpnative:notchless:60hz='displayplacer    "id:1 mode:49"'
  alias dpnative:notchless:59.94hz='displayplacer "id:1 mode:50"'
  alias dpnative:notchless:50hz='displayplacer    "id:1 mode:51"'
  alias dpnative:notchless:48hz='displayplacer    "id:1 mode:52"'

fi
