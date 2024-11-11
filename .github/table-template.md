| Image                                 | JDK       | Python  | GCC  | Build tool                                   | Tests                                                     |
|---------------------------------------|-----------|---------|------|----------------------------------------------|-----------------------------------------------------------|
| exoplatform/ci:base                   | n/a       | 2.7 & 3 | 5.4  | n/a                                          | [goss.yaml](base/tests/goss.yaml)                         |
| exoplatform/ci:base-alpine            | n/a       | 2.7 & 3 | 13.2  | n/a                                          | [goss.yaml](base-alpine/tests/goss.yaml)                  |
| exoplatform/ci:base-ubuntu20          | n/a       | 2.7 & 3 | 9.4  | n/a                                          | [goss.yaml](base-ubuntu20/tests/goss.yaml)                |
| exoplatform/ci:base-ubuntu22          | n/a       | 2.7 & 3 | 11.4  | n/a                                          | [goss.yaml](base-ubuntu22/tests/goss.yaml)                |
| exoplatform/ci:base-ubuntu24          | n/a       | 3       | 13.2  | n/a                                          | [goss.yaml](base-ubuntu24/tests/goss.yaml)                |
| exoplatform/ci:jdk6                   | 1.6.0_45  | 2.7 & 3 | 5.4  | n/a                                          | [goss.yaml](jdk/jdk6/tests/goss.yaml)                     |
| exoplatform/ci:jdk7                   | 1.7.0_80  | 2.7 & 3 | 5.4  | n/a                                          | [goss.yaml](jdk/jdk7/tests/goss.yaml)                     |
| exoplatform/ci:jdk8                   | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | n/a                                          | [goss.yaml](jdk/jdk8/tests/goss.yaml)                     |
| exoplatform/ci:jdk11                  | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | n/a                                          | [goss.yaml](jdk/jdk11/tests/goss.yaml)                    |
| exoplatform/ci:jdk17                  | ${JDK17_VERSION}        | 2.7 & 3 | 5.4  | n/a                                          | [goss.yaml](jdk/jdk17/tests/goss.yaml)                    |
| exoplatform/ci:jdk17-alpine           | ${JDK17_VERSION}        | 2.7 & 3 | 13.2  | n/a                                          | [goss.yaml](jdk/jdk17-alpine/tests/goss.yaml)             |
| exoplatform/ci:jdk17-ubuntu20         | ${JDK17_VERSION}        | 2.7 & 3 | 9.4  | n/a                                          | [goss.yaml](jdk/jdk17-ubuntu20/tests/goss.yaml)           |
| exoplatform/ci:jdk21-ubuntu20         | ${JDK21_VERSION}        | 2.7 & 3 | 9.4  | n/a                                          | [goss.yaml](jdk/jdk21-ubuntu20/tests/goss.yaml)              |
| exoplatform/ci:jdk21-ubuntu22         | ${JDK21_VERSION}        | 2.7 & 3 | 11.4 | n/a                                          | [goss.yaml](jdk/jdk21-ubuntu22/tests/goss.yaml)              |
| exoplatform/ci:jdk8-gradle2           | 1.8.0_202 | 2.7 & 3 | 5.4  | Gradle 2.14                                  | [goss.yaml](jdk/jdk8-gradle2/tests/goss.yaml)             |
| exoplatform/ci:jdk8-gradle2-android   | 1.8.0_202 | 2.7 & 3 | 5.4  | Gradle 2.14 / Android 23/24                  | [goss.yaml](gradle/jdk8-gradle2-android/tests/goss.yaml)  |
| exoplatform/ci:jdk8-gradle4           | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Gradle 4.1                                   | [goss.yaml](jdk/jdk8-gradle4/tests/goss.yaml)             |
| exoplatform/ci:jdk8-gradle4-android   | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Gradle 4.1 / Android 23/24/25/26/27          | [goss.yaml](gradle/jdk8-gradle4-android/tests/goss.yaml)  |
| exoplatform/ci:jdk8-gradle6           | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Gradle 6.1                                   | [goss.yaml](jdk/jdk8-gradle6/tests/goss.yaml)             |
| exoplatform/ci:jdk8-gradle6-android   | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Gradle 6.1 / Android 23/24/25/26/27          | [goss.yaml](gradle/jdk8-gradle6-android/tests/goss.yaml)  |
| exoplatform/ci:jdk17-gradle8          | ${JDK17_VERSION}        | 2.7 & 3 | 11.4 | Gradle 8.7                                   | [goss.yaml](jdk/jdk17-gradle8/tests/goss.yaml)            |
| exoplatform/ci:jdk17-gradle8-android  | ${JDK17_VERSION}        | 2.7 & 3 | 11.4 | Gradle 8.7 / Android 23/24/25/26/27/28/29/33 | [goss.yaml](gradle/jdk17-gradle8-android/tests/goss.yaml) |
| exoplatform/ci:jdk6-maven30           | 1.6.0_45  | 2.7 & 3 | 5.4  | Maven ${MVN30_VERSION}                                 | [goss.yaml](maven/jdk6-maven30/tests/goss.yaml)           |
| exoplatform/ci:jdk6-maven32           | 1.6.0_45  | 2.7 & 3 | 5.4  | Maven ${MVN32_VERSION}                                  | [goss.yaml](maven/jdk6-maven32/tests/goss.yaml)           |
| exoplatform/ci:jdk7-maven30           | 1.7.0_80  | 2.7 & 3 | 5.4  | Maven ${MVN30_VERSION}                                 | [goss.yaml](maven/jdk7-maven30/tests/goss.yaml)           |
| exoplatform/ci:jdk7-maven32           | 1.7.0_80  | 2.7 & 3 | 5.4  | Maven ${MVN32_VERSION}                                  | [goss.yaml](maven/jdk7-maven32/tests/goss.yaml)           |
| exoplatform/ci:jdk8-maven30           | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Maven ${MVN30_VERSION}                                 | [goss.yaml](maven/jdk8-maven30/tests/goss.yaml)           |
| exoplatform/ci:jdk8-maven32           | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Maven ${MVN32_VERSION}                                  | [goss.yaml](maven/jdk8-maven32/tests/goss.yaml)           |
| exoplatform/ci:jdk8-maven33           | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Maven ${MVN33_VERSION}                                  | [goss.yaml](maven/jdk8-maven33/tests/goss.yaml)           |
| exoplatform/ci:jdk8-maven35           | ${JDK8_VERSION}     | 2.7 & 3 | 5.4  | Maven ${MVN35_VERSION}                                  | [goss.yaml](maven/jdk8-maven35/tests/goss.yaml)           |
| exoplatform/ci:jdk11-maven32          | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN32_VERSION}                                  | [goss.yaml](maven/jdk11-maven32/tests/goss.yaml)          |
| exoplatform/ci:jdk11-maven33          | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN33_VERSION}                                  | [goss.yaml](maven/jdk11-maven33/tests/goss.yaml)          |
| exoplatform/ci:jdk11-maven35          | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN35_VERSION}                                  | [goss.yaml](maven/jdk11-maven35/tests/goss.yaml)          |
| exoplatform/ci:jdk11-maven36          | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN36_VERSION}                                  | [goss.yaml](maven/jdk11-maven36/tests/goss.yaml)          |
| exoplatform/ci:jdk11-maven38          | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN38_VERSION}                                  | [goss.yaml](maven/jdk11-maven38/tests/goss.yaml)          |
| exoplatform/ci:jdk11-mavend08         | ${JDK11_VERSION}        | 2.7 & 3 | 5.4  | Mavend 0.8.2                                 | [goss.yaml](mavend/jdk11-mavend08/tests/goss.yaml)        |
| exoplatform/ci:jdk17-maven36          | ${JDK17_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN36_VERSION}                                  | [goss.yaml](maven/jdk17-maven36/tests/goss.yaml)          |
| exoplatform/ci:jdk17-maven38          | ${JDK17_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN38_VERSION}                                  | [goss.yaml](maven/jdk17-maven38/tests/goss.yaml)          |
| exoplatform/ci:jdk17-mavend08         | ${JDK17_VERSION}        | 2.7 & 3 | 5.4  | Mavend 0.8.2                                 | [goss.yaml](mavend/jdk17-mavend08/tests/goss.yaml)        |
| exoplatform/ci:jdk17-mavend09         | ${JDK17_VERSION}        | 2.7 & 3 | 5.4  | Mavend 0.9.0                                 | [goss.yaml](mavend/jdk17-mavend09/tests/goss.yaml)        |
| exoplatform/ci:jdk17-maven39          | ${JDK17_VERSION}        | 2.7 & 3 | 5.4  | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk17-maven39/tests/goss.yaml)          |
| exoplatform/ci:jdk17-maven39-alpine   | ${JDK17_VERSION}        | 2.7 & 3 | 13.2 | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk17-maven39-alpine/tests/goss.yaml)   |
| exoplatform/ci:jdk17-maven39-ubuntu20 | ${JDK17_VERSION}        | 2.7 & 3 | 9.4  | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk17-maven39-ubuntu20/tests/goss.yaml) |
| exoplatform/ci:jdk17-maven39-ubuntu22 | ${JDK17_VERSION}        | 2.7 & 3 | 11.4 | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk17-maven39-ubuntu22/tests/goss.yaml) |
| exoplatform/ci:jdk17-maven39-ubuntu24 | ${JDK17_VERSION}        | 3       | 13.2 | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk17-maven39-ubuntu24/tests/goss.yaml) |
| exoplatform/ci:jdk17-maven40-ubuntu22 | ${JDK17_VERSION}        | 2.7 & 3 | 11.4 | Maven ${MVN40_VERSION}                           | [goss.yaml](maven/jdk17-maven40-ubuntu22/tests/goss.yaml) |
| exoplatform/ci:jdk21-maven39-ubuntu20 | ${JDK21_VERSION}        | 2.7 & 3 | 9.4  | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk21-maven39-ubuntu20/tests/goss.yaml) |
| exoplatform/ci:jdk21-maven39-ubuntu22 | ${JDK21_VERSION}        | 2.7 & 3 | 11.4 | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk21-maven39-ubuntu22/tests/goss.yaml) |
| exoplatform/ci:jdk21-maven39-ubuntu24 | ${JDK21_VERSION}        | 3       | 13.2 | Maven ${MVN39_VERSION}                                  | [goss.yaml](maven/jdk21-maven39-ubuntu24/tests/goss.yaml) |
| exoplatform/ci:jdk21-maven40-ubuntu22 | ${JDK21_VERSION}        | 2.7 & 3 | 11.4 | Maven ${MVN40_VERSION}                           | [goss.yaml](maven/jdk21-maven40-ubuntu22/tests/goss.yaml) |
