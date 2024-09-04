set -e

./setup-workspace.sh

docker build . --platform linux/amd64 -t rpe
