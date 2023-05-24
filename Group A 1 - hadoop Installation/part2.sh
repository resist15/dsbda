# Run This Script in hduser
# --- To get into hduser use command
# `su hduser`
echo "----Generating RSA Keys---"
ssh-keygen -t rsa -P ""
cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
echo "--- local host ssh is setup ---"
echo "---You Can Verify it by running ##ssh localhost##---"

sudo echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> /home/hduser/.bashrc
sudo echo "export HADOOP_HOME=/usr/local/hadoop" >> /home/hduser/.bashrc
sudo echo "export PATH=$PATH:/usr/local/hadoop/bin" >> /home/hduser/.bashrc
sudo echo "export PATH=$PATH:/usr/local/hadoop/sbin" >> /home/hduser/.bashrc
sudo echo "export HADOOP_MAPRED_HOME=/usr/local/hadoop" >> /home/hduser/.bashrc
sudo echo "export HADOOP_COMMON_HOME=/usr/local/hadoop" >> /home/hduser/.bashrc
sudo echo "export HADOOP_HDFS_HOME=/usr/local/hadoop" >> /home/hduser/.bashrc
sudo echo "export YARN_HOME=/usr/local/hadoop" >> /home/hduser/.bashrc
sudo echo "export HADOOP_COMMON_LIB_NATIVE_DIR=/usr/local/hadoop/lib/native" >> /home/hduser/.bashrc
sudo echo 'export HADOOP_OPTS="-Djava.library.path=/usr/local/hadoop/lib"' >> /home/hduser/.bashrc
source ~/.bashrc
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> /usr/local/hadoop/etc/hadoop/hadoop-env.sh

sudo cp *.xml /usr/local/hadoop/etc/hadoop
sudo mkdir -p /usr/local/hadoop_tmp/hdfs/namenode
sudo mkdir -p /usr/local/hadoop_tmp/hdfs/datanode

sudo chown -R hduser /usr/local/hadoop_tmp/
sudo chmod -R 777 /usr/local/hadoop_tmp/hdfs/namenode/
sudo chmod -R 777 /usr/local/hadoop_tmp/hdfs/datanode/
hdfs namenode -format
echo "source ~/.bashrc"
