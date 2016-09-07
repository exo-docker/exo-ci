# eXo Docker Containers for CI

The aim of this repository is to give the configuration to build all eXo Platform components in Docker containers for development and Continous Integration purpose.


## JDK6 - Maven 3.0

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/srv/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/srv/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk6-maven30 clean package
```

### With Release Profile

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     -v ~/.gnupg/pubring.gpg:/home/ciagent/.gnupg/pubring.gpg:ro \
     -v ~/.gnupg/secring.gpg:/home/ciagent/.gnupg/secring.gpg:ro \
     -v ~/.gnupg/gpg.conf:/home/ciagent/.gnupg/gpg.conf:ro \
     exoplatform/ci:jdk6-maven30 install -Prelease
```

## JDK7 - Maven 3.0

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk7-maven30 clean package
```


## JDK7 - Maven 3.2

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk7-maven32 clean package
```


## JDK8 - Maven 3.2

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk8-maven32 clean package
```

## Puppet

```
$ cd my-project
$ docker run --name puppet-validation -it -v ${PWD}:/srv/ciagent/workspace \
      exoplatform/ci:puppet
```

You can specify the ``-u`` option to force the modules update via ``r10k``
Example :
```
docker run --name puppet-validation -it -v ${PWD}:/srv/ciagent/workspace \
      exoplatform/ci:puppet -u
```

## Configure your .bash_profile

```
jdk6mvn30(){
	docker run --rm -v $(pwd):/srv/ciagent/workspace -v ~/.m2/repository:/home/ciagent/.m2/repository -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml exoplatform/ci:jdk6-maven30 $*
}

jdk7mvn30(){
	docker run --rm -v $(pwd):/srv/ciagent/workspace -v ~/.m2/repository:/home/ciagent/.m2/repository -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml exoplatform/ci:jdk7-maven30 $*
}

jdk7mvn32(){
	docker run --rm -v $(pwd):/srv/ciagent/workspace -v ~/.m2/repository:/home/ciagent/.m2/repository -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml exoplatform/ci:jdk7-maven32 $*
}

jdk8mvn32(){
	docker run --rm -v $(pwd):/srv/ciagent/workspace -v ~/.m2/repository:/home/ciagent/.m2/repository -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml exoplatform/ci:jdk8-maven32 $*
}

puppet_validate(){
docker run --name puppet-validation -it -v ${PWD}:/srv/ciagent/workspace \
      exoplatform/ci:puppet $*
}
```

## Build with the right configuration

```
$ source ~/.bash_profile
$ cd my-project
$ jdk8mvn32 clean package
```
