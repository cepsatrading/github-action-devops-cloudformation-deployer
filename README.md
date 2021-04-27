# github-action-devops-cloudformation-deployer

The `github-action-devops-cloudformation-deployer` Github Action will install cloudformation-deployer library and deploy iac.

## Inputs

| Name | Description | Required |Default |
| --- | --- | --- | --- |
| `param` | cloudformation-deployer parameters | :heavy_check_mark: | |

## Requirements

* Folder `iac` with templates to deploy

* Dependency with [`cepsadigital/github-action-devops-cloudformation-deployer`](https://github.com/cepsadigital/github-action-devops-cloudformation-deployer) Action, which install cloudformation-deployer library to deploy infrastructure.

## Usage

```yaml
on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Enter environment for deployment. Default is dev'
        required: true
        default: 'dev'

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2    
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with: 
          aws-access-key-id: ${{ secrets.TRADING_DEV_ACCESS_KEY }}
          aws-secret-access-key: ${{ secrets.TRADING_DEV_SECRET_KEY }}
          aws-region: eu-west-1
      - name: get aws caller indentity
        run:  aws sts get-caller-identity
      - uses: actions/checkout@v2
      - name: Build and Install Cloudformation-deployer library to deploy cloudformation in aws
        uses: cepsatrading/github-action-devops-cloudformation-deployer@master
        with:
          cfnparams: folder optional_arguments
```
In cfnparams, we can enter the following values:
* positional arguments:

  -  folder -> list of template folders in order that contain the Cloudformation and params files to deploy

* optional arguments:
  -  -h, --help         show this help message and exit
  -  --ask              this flag will ask for confirmation on every deploy
  -  --ignore-role-arn  this flag will unset the rolearn param of the deployments, so CF will inherit the current user IAM role to perform the deployment, this should be used for admin/platform deployments only
  -  --region           use with value us-east-1 if you need to deploy infra in North Virginia
  -  --jenkins_inputs   use this list to include input parameters using Jenkins. Example: --jenkins_inputs param1=param1value ... param2=param2value

## Secrets

- `TRADING_DEV_ACCESS_KEY` - **_(Required)_** this is the Access Key of the github user to deploy iac in AWS.
- `TRADING_DEV_SECRET_KEY` - **_(Required)_** this is the Secret Key of the github user to deploy iac in AWS

## Contact

DevOps Team - [Devops Documentation Portal](https://doc.devops.cepsacorp.com/) - devops@cepsa.com

More GitHub Actions in Cepsa TD: [https://github.com/cepsadigital?q=github-action-&type=&language=&sort=](https://github.com/cepsadigital?q=github-action-&type=&language=&sort=)
