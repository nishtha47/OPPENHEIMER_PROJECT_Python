# The Oppenheimer Project 
As part of the policy to increase taxation relief to its working class hero affected by the Novel Coronavirus Infection, the governer of the City of Carson has called for an immediate a cut to all IT services budget. This includes terminating **all** applications hosted on cloud providers, include the one which you were tasked to work on.

Fear not... The development team has provided you with the Dev environment in the form of a `jar` file to assist you on your task.

## To proceed further:

##### 1. Download and clone this repository to your desktop. You may also choose to download the jar `OppenheimerProjectDev.jar`  
##### 2. To run the application, issue the following to your terminal. Replace `{path-to-this-jar}` with your actual path to the folder containing the jar 
```
java -jar {path-to-this-jar}/OppenheimerProjectDev.jar
```

##### 3. Give it a min or two to boot up and you should be able to visit the app and API interface here:
```
http://localhost:8080/
http://localhost:8080/swagger-ui.html
```

##### 4. Good luck and have fun

# Setup of Robot Framework


Step 1 : Pre-check
       Check if python is already installed
  python --version
  pip --version
       Check if robot framework is already installed
  robot --version

Step 2 : Install Python 
      check on cmd : python --version
          pip --version

Step 3 : Set Python in environment variables
      C:\Python27;C:\Python27\Scripts;
      Check: 
                python --version
  pip --version

Step 4 : Install robot framework
       pip install robotframework
       to uninstall : pip uninstall robotframework

Step 5 : Check on cmd :
  robot --version
  pybot --version
  
  Step 6: Install Robot framework extension in VS Code or any IDE.
  


 ### To run the Scenarios in Robot Framework,use the command ###

robot ...filename.robot under TestCases folder.
