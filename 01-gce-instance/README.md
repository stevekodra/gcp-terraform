<img width="500" src="https://cloud.google.com/_static/87a95081a4/images/cloud/cloud-logo.svg">

# 01/ Google Compute Engine

Google Compute Engine (GCE) is the Infrastructure as a Service (IaaS) component of Google Cloud Platform which is built on the global infrastructure that runs Google's search engine, Gmail, YouTube and other services. Google Compute Engine enables users to launch virtual machines (VMs) on demand.

## Description

This example will create an virtual instance in GCP project according to user's Project assignment. Instance deploys into Shared VPC host project, therefore can use Interconnect links to company networks.

## Variables

Defined in `terraform.tfvars` file. Before deploying the example, please change values of your `project`. Networking project names and related subnetworks for other stages can be found on [Cloud.Hub](https://github.deutsche-boerse.de/pages/dev/cloud.hub/#/google_cloud_platform).

## Operating System/Base Image

Example uses DBG CentOS 7 hardened image. Base images for Deutsche Boerse are created in standalone base images GCP Project.

We prepare for users of GCP several flavours of Linux and Windows Server 2016/19. You can find a list of family names on [Cloud.Hub](https://github.deutsche-boerse.de/pages/dev/cloud.hub/#/google_cloud_platform).

## Bootstraping the instance

To bootstrap your instance, please edit file `/files/bootstrap.sh` and state commands you want to run when instance is starting.

## SSH Key

In order to reach instance, you need to provide SSH key to GCE machine. Public part of SSH key is inserted from file `/files/id_rsa.pub`. Don't forget to change the file content before actual deployment.
