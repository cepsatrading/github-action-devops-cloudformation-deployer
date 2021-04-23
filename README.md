# github-action-devops-cloudformation-deployer

The `github-action-devops-cloudformation-deployer` Github Action will install cloudformation-deployer library and deploy iac.

## Inputs

| Name | Description | Required |Default |
| --- | --- | --- | --- |
| `param` | cloudformation-deployer parameters | :heavy_check_mark: | |

## Requirements

* `xxxxxxxxxxxxx`

* Dependency with [`cepsadigital/github-action-devops-test-and-code-analysis`](https://github.com/cepsadigital/github-action-devops-test-and-code-analysis) Action, which generates the coverage and security (bandit) reports in a previous step.

## Usage

```yaml
on:
  workflow_dispatch:
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: SonarQube Scan
      uses: cepsadigital/github-action-devops-sonar-scan@1.0.0
      with:
        host: ${{ secrets.TD_SONAR_HOST }}
        login: ${{ secrets.TD_SONAR_USER }}
        password: ${{ secrets.TD_SONAR_PSW }} 
```

## Secrets

- `TD_SONAR_HOST` - **_(Required)_** this is the Cepsa TD SonarQube server URL.
- `TD_SONAR_USER` - **_(Required)_** this is the SonarQube username.
- `TD_SONAR_PSW` - **_(Required)_** this is the SonarQube password.

## Contact

DevOps Team - [Devops Documentation Portal](https://doc.devops.cepsacorp.com/) - devops@cepsa.com

More GitHub Actions in Cepsa TD: [https://github.com/cepsadigital?q=github-action-&type=&language=&sort=](https://github.com/cepsadigital?q=github-action-&type=&language=&sort=)
