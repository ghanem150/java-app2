# .......... java-APP1 ............

Build war with maven and java-app1 framework.

Steps are the following:

1. Clone the repository to your local machine
2. The Dockerfile will do:

        A. Create maven container <br />
        
     * copy pom.xml to /tmp <br />
     * copy folder "src" to /tmp/src <br />
     * Go to /tmp folder then run "mvn package"<br />
      
      The previos command will generate devopsarea-01.war<br />
        
        B. Create tomcat container<br />
        
     * Will move the file java-app1-01.war from maven container to /webapp in tomcat contaner<br />
     * Do health check to make sure that the artifact is deployed

3. Run 'docker build -t java-app1 .' <br />
    
     * Will create a Docker image called devopsarea <br />

4. Run ' docker run -d -p 2222:8080 java-app1 ' <br />
     * Will create a container called java-app1 and will forward the container internal port 8080 to locathost 2222 in the hosted machine 

5. Open [http://192.168.1.50:2222/java-app1-1.0/](http://192.168.1.50:2222/java-app1-1.0/) in your browser and see the result.
