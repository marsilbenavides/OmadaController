docker stop "omada-3.2.17"
docker rm "omada-3.2.17"
docker rmi "omada-3.2.17-img"
docker build --no-cache . -t "omada-3.2.17-img"

docker run -it -p 8088:8088 -p 8043:8043 --rm ^
  --cap-add SYS_CHROOT ^
  --cap-add AUDIT_CONTROL ^
  --cap-add AUDIT_READ ^
  --cap-add BLOCK_SUSPEND ^
  --cap-add DAC_READ_SEARCH ^
  --cap-add IPC_LOCK ^
  --cap-add IPC_OWNER ^
  --cap-add LEASE ^
  --cap-add LINUX_IMMUTABLE ^
  --cap-add MAC_ADMIN ^
  --cap-add MAC_OVERRIDE ^
  --cap-add NET_ADMIN ^
  --cap-add NET_BROADCAST ^
  --name "omada-3.2.17" ^
  "omada-3.2.17-img"
