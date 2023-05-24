cd ~/
#wget https://downloads.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz
#tar xzf apache-hive-3.1.2-bin.tar.gz
echo "export HIVE_HOME=/home/hduser/apache-hive-3.1.2-bin" >> ~/.bashrc
echo "export PATH=$PATH:$HIVE_HOME/bin" >> ~/.bashrc
source ~/.bashrc
echo "export HADOOP_HOME=/usr/local/hadoop" >> /home/hduser/apache-hive-3.1.2-bin/bin/hi>
hdfs dfs -mkdir /tmp
hdfs dfs -chmod g+w /tmp
hdfs dfs -mkdir -p /user/hive/warehouse
hdfs dfs -chmod g+w /user/hive/warehouse
rm $HIVE_HOME/lib/guava-19.0.jar
cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-11.0.2.jar $HIVE_HOME/lib/
schematool -initSchema -dbType derby
echo "sudo nano hive-site.xml – chae"
echo "metastore location to above created hdfs path(/user/hive/warehouse)"
