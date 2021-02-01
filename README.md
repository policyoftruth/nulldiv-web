# manual steps
1. create route53 domain name
  * don't create default DNS zone
2. create s3 bucket for tf state (backend.tf)
3. update domain with your nameservers
  * included `update_ns.sh` as an example
  * a terraform apply will output the values for the script

# todo
1. encrypted state
2. https
3. template backend.conf because can't variablize :(
4. pipeline with github actions
5. integrate domain NS script

# resources
1. https://medium.com/@dblencowe/hosting-a-static-website-on-s3-using-terraform-0-12-aa5ffe4103e
2. https://medium.com/@dblencowe/adding-ssl-to-a-s3-static-website-managed-by-terraform-817d994e30d4
3. https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html
4. https://medium.com/@bansalnagesh/hosting-a-secure-static-website-on-aws-1bcdc007726
5. https://docs.aws.amazon.com/Route53/latest/APIReference/API_domains_UpdateDomainNameservers.html
6. https://docs.aws.amazon.com/cli/latest/reference/route53domains/update-domain-nameservers.html
7. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation
