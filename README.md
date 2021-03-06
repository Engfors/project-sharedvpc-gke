## Usage

To use this example you'll first have create the host project and VPC using `terraform apply -target module.host_project -target module.vpc`.

Once the run completes, run `terraform apply` to create the service project.
## Requirements
| Name        | Version   |
| ----------- | --------- |
| terraform   | ~> 0.14   |
| google      | ~> 3.61.0 |
| google-beta | ~> 3.61.0 |
| null        | ~> 2.1    |
| random      | ~> 2.3    |

## Providers

No provider.

## Modules

| Name            | Source                                          | Version |
| --------------- | ----------------------------------------------- | ------- |
| host_project    | terraform-google-modules/project-factory/google | ~> 10.2 |
| service_project | terraform-google-modules/project-factory/google | ~> 10.2 |
| vpc             | terraform-google-modules/network/google         | ~> 3.2  |

## Resources

No resources.

## Inputs

| Name             | Description                                     | Type     | Default | Required |
| ---------------- | ----------------------------------------------- | -------- | ------- | :------: |
| billing\_account | Billing Account use by the projects             | `string` | n/a     |   yes    |
| org\_id          | Organization id use by the projects             | `string` | n/a     |   yes    |
| project\_prefix  | Prefix used by the projects to personalize their names | `string` | n/a     |   yes    |

## Outputs

No output.
