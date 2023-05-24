sudo mkdir analyser_log
sudo chmod -R 777 ~/analyser_log/ 
sudo chown -R hduser ~/analyser_log/
sudo cp . ~/analyser_log
cd analyser_log
sudo chmod +r "."
export CLASSPATH="$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-core-2.9.0.jar:$HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-client-common-2.9.0.jar:$HADOOP_HOME/share/hadoop/common/hadoop-common-2.9.0.jar:~/analyser_log/SalesCountry/*:$HADOOP_HOME/lib/*"
javac -d . SalesCountryDriver.java SalesCountryReducer.java SalesMapper.java
jar -cfm analyser_log.jar manifest.txt SalesCountry/*.class
# start hadoop
sudo mkdir ~/input3000
# copy csv to input3000 folder
cp *csv ~/input3000
$HADOOP_HOME/bin/hdfs dfs -put ~/input3000 /
$HADOOP_HOME/bin/hadoop jar analyser_log.jar /input3000 /output3000
$HADOOP_HOME/bin/hdfs dfs -cat /output3000/part-00000

