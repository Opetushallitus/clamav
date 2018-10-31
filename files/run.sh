freshclam
clamd &
freshclam -d

java -Xms768m -Xmx768m -jar /root/clamav-rest.jar --clamd.port=3310 --clamd.host=localhost --clamd.timeout=5000 --clamd.maxfilesize=1024MB --clamd.maxrequestsize=1024MB
