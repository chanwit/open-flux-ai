#!/bin/sh

# Following: 
# https://github.com/kingdonb/stats-tracker-ghcr/pull/49
# https://github.com/kingdonb/stats-tracker-ghcr/commit/8af93bea0c6bc41e3ea831a1f2703fcad5301e53
# (and) https://github.com/orgs/community/discussions/25678
# with the omission of ghc-8 and hhvm, (that no longer seem to be installed by default)

echo "=============================================================================="
echo "Freeing up disk space on CI system"
echo "=============================================================================="
echo "Listing 100 largest packages"
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n | tail -n 100
df -h
echo "Removing large packages"
# sudo apt-get remove -y '^ghc-8.*'
sudo apt-get remove -y '^dotnet-.*'
sudo apt-get remove -y '^llvm-.*'
sudo apt-get remove -y 'php.*'
sudo apt-get remove -y azure-cli google-cloud-cli google-chrome-stable firefox powershell mono-devel
sudo apt-get autoremove -y
sudo apt-get clean
df -h
echo "Removing large directories"
# deleting 15GB
rm -rf /usr/share/dotnet/
df -h
