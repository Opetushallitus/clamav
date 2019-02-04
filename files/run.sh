set -eu

freshclam
clamd &
freshclam -d
java -Xms3g -Xmx3g -jar /root/clamav-rest.jar --clamd.port=3310 --clamd.host=localhost --clamd.timeout=480000 --clamd.maxfilesize=1024MB --clamd.maxrequestsize=1024MB
