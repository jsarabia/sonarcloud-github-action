#!/bin/bash

set -e

if [[ -z "${SONAR_TOKEN}" ]]; then
  echo "Set the SONAR_TOKEN env variable."
  exit 1
fi

if [[ -f "pom.xml" ]]; then
  echo "Maven project detected. You should run the goal 'org.sonarsource.scanner.maven:sonar' during build rather than using this GitHub Action."
  exit 1
fi

if [[ -z "${SONARCLOUD_URL}" ]]; then
  SONARCLOUD_URL="https://sonarcloud.io"
fi

sonar-scanner -Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} -Dsonar.host.url=${SONARCLOUD_URL} -Dsonar.projectDate=3020-12-01 ${INPUT_ARGS}
