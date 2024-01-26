# Flightdeck Template

Template repository for [Flightdeck] deployments.

## Getting started
1. Create a new GitHub Repository using this template based on [this guide]
2. Set up Terraform execution

### To set up Terraform execution
1. Replace the following placeholders in `bin/setup` with real values:
	1. `AWS_HOME_REGION` (e.g. us-east-1)
	2. `AWS_SSO_START_URL` (e.g. https://thoughtbot.awsapps.com/start)
	3. `AWS_PROFILE_PREFIX` (e.g. thoughtbot)
	4. `AWS_ADMIN_PERMISSION_SET` (e.g. AdministratorAccess)
	5. `AWS_OPERATIONS_ACCOUNT_ID`
2. Run `bin/setup` from the root of your new repository, which will create the necessary profiles in your `.aws/config`

[Flightdeck]: https://github.com/thoughtbot/flightdeck
[this guide]: https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template
