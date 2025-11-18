#!/bin/bash

apt-get update
apt-get install -y apt-transport-https software-properties-common wget

echo "### Create a System User for Prometheus ###"
groupadd --system prometheus
useradd -s /sbin/nologin --system -g prometheus prometheus

echo "### Create Directories for Prometheus ###"
mkdir /etc/prometheus
mkdir /var/lib/prometheus

echo "### Download Prometheus and Extract Files ###"
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar vxf prometheus*.tar.gz

cd prometheus*/

echo "### Move the Binary Files & Set Owner ###"
mv prometheus /usr/local/bin
mv promtool /usr/local/bin
chown prometheus:prometheus /usr/local/bin/prometheus
chown prometheus:prometheus /usr/local/bin/promtool

echo "### Move the Configuration Files & Set Owner ###"
mv consoles /etc/prometheus
mv console_libraries /etc/prometheus
mv prometheus.yml /etc/prometheus
chown prometheus:prometheus /etc/prometheus
chown -R prometheus:prometheus /etc/prometheus/consoles
chown -R prometheus:prometheus /etc/prometheus/console_libraries
chown -R prometheus:prometheus /var/lib/prometheus

echo "### Create Prometheus Systemd Service ###"
cp /vagrant/servidorPrometheus/prometheus.service /etc/systemd/system/
systemctl daemon-reload

echo "### Start Prometheus Service ###"
systemctl enable prometheus
systemctl start prometheus

echo "### Add the Grafana APT repository ###"
mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list

echo "### Install Grafana ###"
apt-get update
apt-get install -y grafana

echo "### Start and enable the Grafana service ###"
systemctl start grafana-server
systemctl enable grafana-server
