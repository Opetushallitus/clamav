# Strict mode
set -euo pipefail

apk update
apk --no-cache add \
  bash \
  clamav \
  clamav-daemon \
  clamav-libunrar \
  openjdk8-jre-base

rm -rf /run/clamav
ln -fs  /tmp/run/clamav /run/clamav

rm -rf /var/log/clamav
ln -fs /tmp/varlog/clamav /var/log/clamav

rm -rf /var/lib/clamav
ln -fs /tmp/varlib/clamav /var/lib/clamav

chmod -R 777 /tmp

echo "TCPSocket 3310" >> /etc/clamav/clamd.conf
echo "MaxFileSize 1024M" >> /etc/clamav/clamd.conf
echo "MaxScanSize 1024M" >> /etc/clamav/clamd.conf
echo "StreamMaxLength 1024M" >> /etc/clamav/clamd.conf