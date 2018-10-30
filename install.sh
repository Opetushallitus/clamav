# Strict mode
set -euo pipefail

apk update
apk --no-cache add \
  bash \
  clamav \
  clamav-daemon \
  clamav-libunrar \
  openjdk8-jre-base

mkdir -p /run/clamav/
chmod 777 /run/clamav/

echo "TCPSocket 3310" >> /etc/clamav/clamd.conf

# Symlink for backwards-compatibility, can be removed once service stacks are updated
ln -s /tmp/scripts/run /root/bootstrap.sh
