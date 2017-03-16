# eXo Docker Containers for CI

The aim of this repository is to give the configuration to build all eXo Platform components in Docker containers for development and Continous Integration purpose.


## JDK6 - Maven 3.0 [![](https://images.microbadger.com/badges/image/exoplatform/ci:jdk6-maven30.svg)](https://microbadger.com/images/exoplatform/ci:jdk6-maven30 "exoplatform/ci:jdk6-maven30")

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

## JDK7 - Maven 3.0 [![](https://images.microbadger.com/badges/image/exoplatform/ci:jdk7-maven30.svg)](https://microbadger.com/images/exoplatform/ci:jdk7-maven30 "exoplatform/ci:jdk7-maven30")

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk7-maven30 clean package
```


## JDK7 - Maven 3.2 [![](https://images.microbadger.com/badges/image/exoplatform/ci:jdk7-maven32.svg)](https://microbadger.com/images/exoplatform/ci:jdk7-maven32 "exoplatform/ci:jdk7-maven32")

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk7-maven32 clean package
```


## JDK8 - Maven 3.2 [![](https://images.microbadger.com/badges/image/exoplatform/ci:jdk8-maven32.svg)](https://microbadger.com/images/exoplatform/ci:jdk8-maven32 "exoplatform/ci:jdk8-maven32")

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk8-maven32 clean package
```

## JDK8 - Maven 3.3 [![](https://images.microbadger.com/badges/image/exoplatform/ci:jdk8-maven33.svg)](https://microbadger.com/images/exoplatform/ci:jdk8-maven33 "exoplatform/ci:jdk8-maven33")

```
$ cd my-project
$ docker run --name=my-project-build -it -v $(pwd):/srv/ciagent/workspace \
     -v ~/.m2/repository:/home/ciagent/.m2/repository \
     -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml \
     exoplatform/ci:jdk8-maven33 clean package
```

## Puppet [![](https://images.microbadger.com/badges/image/exoplatform/ci:puppet.svg)](https://microbadger.com/images/exoplatform/ci:puppet "exoplatform/ci:puppet")

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

## XMLStarlet

XMLStarlet is a set of command line utilities (tools) which can be used to transform, query, validate, and edit XML documents and files using simple set of shell commands in similar way it is done for plain text files using UNIX grep, sed, awk, diff, patch, join, etc commands.
* http://xmlstar.sourceforge.net/doc/UG/xmlstarlet-ug.html#idm47077139729008

At eXo, we use it to update Maven POM XML files for FB and Translation process.

examples:
```
$ cd /tmp/xmlstarlet
$ wget https://raw.githubusercontent.com/exoplatform/maven-parent-pom/develop/pom.xml
$ docker run -it --rm --name=xmlstartlet  -v $(pwd):/srv/ciagent/workspace --entrypoint=/bin/bash  exoplatform/ci:jdk8-maven32

# Update POM version from X-SNAPSHOT to X-translation-SNAPSHOT
ciagent@b32b684a1d6b:/srv/ciagent/workspace$ xmlstarlet ed --inplace -N pom=http://maven.apache.org/POM/4.0.0 \
  -u '/pom:project/pom:version[contains(text(), "-SNAPSHOT")]' \
  -x "concat(substring-before(.,'-SNAPSHOT'), '-translation-SNAPSHOT')" \
  pom.xml

# Update all POMs files in a Maven reactor project
ciagent@b32b684a1d6b:/srv/ciagent/workspace$ find . -name pom.xml | xargs -t -n 1 xmlstarlet ed -P --inplace -N pom=http://maven.apache.org/POM/4.0.0 -u '/pom:project/pom:version[contains(text(), "-SNAPSHOT")]' -x "concat(substring-before(.,'-SNAPSHOT'), '-translation-SNAPSHOT')"
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

jdk8mvn33(){
	docker run --rm -v $(pwd):/srv/ciagent/workspace -v ~/.m2/repository:/home/ciagent/.m2/repository -v ~/.m2/settings.xml:/home/ciagent/.m2/settings.xml exoplatform/ci:jdk8-maven33 $*
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
