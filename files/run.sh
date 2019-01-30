set -eu

freshclam
clamd &
freshclam -d
java -Xms3584m -Xmx3584m -jar /root/clamav-rest.jar --clamd.port=3310 --clamd.host=localhost --clamd.timeout=300000 --clamd.maxfilesize=1024MB --clamd.maxrequestsize=1024MB
