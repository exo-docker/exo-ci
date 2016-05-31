# eXo Docker Containers for CI

The aim of this repository is to give the configuration to build all eXo Platform components in Docker containers for development and Continous Integration purpose.


## JDK6 - Maven 3.0

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/opt/ciagent/workspace \
     -v ~/.m2/repository:/opt/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/opt/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk6-maven30 clean package
```

## JDK7 - Maven 3.0

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/opt/ciagent/workspace \
     -v ~/.m2/repository:/opt/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/opt/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk7-maven30 clean package
```


## JDK7 - Maven 3.2

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/opt/ciagent/workspace \
     -v ~/.m2/repository:/opt/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/opt/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk7-maven32 clean package
```


## JDK8 - Maven 3.2

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/opt/ciagent/workspace \
     -v ~/.m2/repository:/opt/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/opt/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk8-maven32 clean package
```
