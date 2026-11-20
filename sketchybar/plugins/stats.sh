#!/bin/bash

# One macmon sample feeds the CPU+GPU sparklines, usage labels, CPU/GPU temps,
# and available RAM. macmon reads IOReport counters (same source as
# powermetrics) without sudo and with negligible overhead.

E_CORES=$(sysctl -n hw.perflevel1.logicalcpu 2>/dev/null || echo 0)
P_CORES=$(sysctl -n hw.perflevel0.logicalcpu 2>/dev/null || sysctl -n hw.logicalcpu)

SAMPLE=$(macmon pipe -s 1 -i 800 2>/dev/null)

if [ -n "$SAMPLE" ]; then
  read -r CPU GPU CPU_TEMP GPU_TEMP MEM_AVAIL MEM_PCT <<< "$(echo "$SAMPLE" | jq -r \
    --argjson e "$E_CORES" --argjson p "$P_CORES" \
    '[
      ((.ecpu_usage[1] * $e + .pcpu_usage[1] * $p) / ($e + $p) * 100),
      (.gpu_usage[1] * 100),
      .temp.cpu_temp_avg,
      .temp.gpu_temp_avg,
      ((.memory.ram_total - .memory.ram_usage) / 1073741824 * 10),
      (.memory.ram_usage / .memory.ram_total * 100)
    ] | map(round) | join(" ")')"
  # Rounded to tenths of a GiB above; render as one decimal
  MEM_AVAIL=$(awk -v v="$MEM_AVAIL" 'BEGIN {printf "%.1f", v/10}')
else
  # Fallback if macmon is unavailable: CPU + RAM only, no GPU or temps
  CPU=$(ps -A -o %cpu | awk -v n="$((E_CORES + P_CORES))" '{s+=$1} END {printf "%d", s/n}')
  GPU="--"
  CPU_TEMP="--"
  GPU_TEMP="--"
  MEM_AVAIL=$(vm_stat | awk -v ps="$(sysctl -n hw.pagesize)" '
    /Pages free/ {f=$NF+0}
    /Pages inactive/ {i=$NF+0}
    END {printf "%.1f", (f+i)*ps/1073741824}')
  MEM_PCT=$(vm_stat | awk -v ps="$(sysctl -n hw.pagesize)" -v total="$(sysctl -n hw.memsize)" '
    /Pages active/ {a=$NF+0}
    /Pages wired down/ {w=$NF+0}
    /occupied by compressor/ {c=$NF+0}
    END {printf "%d", (a+w+c)*ps/total*100}')
fi

GPU_FRAC=0
[ "$GPU" != "--" ] && GPU_FRAC=$(awk -v v="$GPU" 'BEGIN {print v/100}')

sketchybar --push cpu.graph "$(awk -v v="$CPU" 'BEGIN {print v/100}')" \
           --push gpu.graph "$GPU_FRAC" \
           --push mem.graph "$(awk -v v="$MEM_PCT" 'BEGIN {print v/100}')" \
           --set stats.cpu label="${CPU}%" \
           --set stats.gpu label="${GPU}%" \
           --set temp.cpu label="${CPU_TEMP}°" \
           --set temp.gpu label="${GPU_TEMP}°" \
           --set mem.avail label="${MEM_AVAIL}G"
