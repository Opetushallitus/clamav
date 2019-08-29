# Strict mode
set -eu

echo "Test that required software is installed"
apk --version
java -version
cat /etc/alpine-release

echo "Test that baseimage has files expected by the application during run script"
ls -la /usr/local/bin/clamav-rest.jar
ls -la /usr/local/bin/run

echo "Largest directories:"
du -d 3 -m /|sort -nr|head -n 20
