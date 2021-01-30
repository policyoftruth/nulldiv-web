# manual steps
1. create route53 domain name
2. create s3 bucket for tf state (backend.tf)

# todo
1. encrypted state
2. https
3. template backend.conf because can't variablize :(
4. pipeline with github actions

# notes
1. make sure DNS on primary zone is updated on domain

# resources
1. https://medium.com/@dblencowe/hosting-a-static-website-on-s3-using-terraform-0-12-aa5ffe4103e
2. https://medium.com/@dblencowe/adding-ssl-to-a-s3-static-website-managed-by-terraform-817d994e30d4
3. https://docs.aws.amazon.com/AmazonS3/latest/dev/WebsiteHosting.html
4. https://medium.com/@bansalnagesh/hosting-a-secure-static-website-on-aws-1bcdc007726
