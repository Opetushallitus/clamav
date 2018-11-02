set -eu

freshclam
clamd &
freshclam -d
java -Xms3g -Xmx3g -jar /root/clamav-rest.jar --server.port=8765 --clamd.port=3310 --clamd.host=localhost --clamd.timeout=120000 --clamd.maxfilesize=1024MB --clamd.maxrequestsize=1024MB
