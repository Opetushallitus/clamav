# Strict mode
set -eu

echo "Test that required software is installed"
apk --version
java -version
cat /etc/alpine-release

echo "Test that baseimage has files expected by the application during run script"
ls -la /root/clamav-rest.jar
ls -la /tmp/scripts/run

echo "Test temporary backwards-compatibility"
ls -la /root/bootstrap.sh

echo "Largest directories:"
du -d 3 -m /|sort -nr|head -n 20
