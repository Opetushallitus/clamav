set -eu

for dir in run varlog varlib; do
  mkdir -p /tmp/$dir/clamav
done

freshclam
clamd &
freshclam -d
java -Xms3g -Xmx3g -jar /usr/local/bin/clamav-rest.jar --clamd.port=3310 --clamd.host=localhost --clamd.timeout=1200000 --clamd.maxfilesize=1024MB --clamd.maxrequestsize=1024MB --clamd.qos.maxrequests=1 --clamd.qos.waitms=100
