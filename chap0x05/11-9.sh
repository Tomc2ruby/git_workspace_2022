# loop on command output results 健壮性改进版本
set -e
for f in $(ps -eo command 2>/dev/null) ; do
  [[ -e "$f" ]] || continue
  ls "$f"
done

# 下面是改进前的「脆弱」版本，对比执行找不同
set -e
for f in $(ps -eo command) ; do
  ls "$f"
done
