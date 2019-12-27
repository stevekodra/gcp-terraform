#!/bin/sh

FILENAME = "hello-world"

cd ./code
zip -r ../${FILENAME}.zip .

gcloud 