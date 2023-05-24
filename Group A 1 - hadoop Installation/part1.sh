echo "----Installing Open JDK----"
sudo apt update
sudo apt install default-jdk -y

echo "--- Add Hadoop User---"
sudo addgroup hadoop
echo "---Be Ready to Add User Detauls---"
sudo adduser --ingroup hadoop hduser
sudo adduser hduser sudo
echo "---Installing Open SSH to generate keys---"
sudo apt install openssh-server

echo "Installing CURL to Download Hadoop"
sudo apt install curl wget -y
echo "Downloading Hadoop 2.9.0"
wget http://archive.apache.org/dist/hadoop/core/hadoop-2.9.0/hadoop-2.9.0.tar.gz
sudo tar -xvzf hadoop-2.9.0.tar.gz
sudo mv hadoop-2.9.0 /usr/local/hadoop
sudo chown -R hduser:hadoop /usr/local
sudo chown -R hduser:hadoop /usr/local/hadoop
sudo chmod -R 777 /usr/local/hadoop

echo "now do --- su hduser and run part2"
