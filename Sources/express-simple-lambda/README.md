<h2>Macro.swift Examples - Express on AWS Lambda
  <img src="http://zeezide.com/img/macro/MacroExpressIcon128.png"
       align="right" width="100" height="100" />
</h2>

This is the same demo app like express-simple, it shows Mustache templates,
endpoints and some middleware.


### Build & Deployment

This assumes that `aws configure` has been run to configure the AWS access 
tokens and region.

Call `swift lambda build` to build the demo for AWS, 
or just `swift lambda deploy` to deploy it, it'll build on demand:
```bash
swift lambda deploy -d 5.2 -p express-simple-lambda -f HelloWorld
Lambda: express-simple-lambda.zip
{
  "FunctionName": "HelloWorld",
  "FunctionArn": "arn:aws:lambda:eu-west-3:123456789:function:HelloWorld:24",
  "Runtime": "provided",
  "Role": "arn:aws:iam::123456789:role/service-role/HelloWorld-role-xyz12ab3",
  "Handler": "hello.handler",
  "CodeSize": 23662925,
  "Description": "",
  "Timeout": 3,
  "MemorySize": 128,
  "LastModified": "2020-08-08T14:07:18.024+0000",
  "CodeSha256": "fykvewkSBes/zz/A/5xYkJ5jwPXaQrp1eJ8XsSARIT4=",
  "Version": "24",
  "TracingConfig": {
    "Mode": "PassThrough"
  },
  "RevisionId": "597e9e19-644f-4da7-bc7b-26cc9725ee07",
  "State": "Active",
  "LastUpdateStatus": "Successful"
}
```

What are the arguments?
- `-d 5.2` selects the Swift 5.2 Amazon Linux cross compiler
  (installed via: 
   `brew install SPMDestinations/tap/spm-dest-5.2-x86_64-amazonlinux2`)
- `-p express-simple-lambda` selects the package manager product to be deployed 
  as a function. This is needed because we have multiple products in the
  Package.swift (if the name matches the package directory, it can't be
  omitted)
- `-f HelloWorld` configures the Lambda endpoint (the "function") we want to 
  deploy into. Can be any Lambda configured in the AWS dashboard (or by other
  means)

Invoke `swift lambda deploy -h` to see all options.


### Differences

A few adjustments had to be made:
- the `session` related things have been removed, lambdas are not
  long running and cannot use the RAM based session middleware
  (the session module could be used, but a persistent backend, 
   e.g. using DynamoDB, would be required)
- the test is deployed into a function called "HelloWorld", which
  is hosted under `/hello`. To deal with that, the static resources
  had to be moved to a hello subdirectory 
  (FIXME, improve this, maybe by considering the AWS_LAMBDA_FUNCTION_NAME
   environment variable in the serve module, or allow setting a prefix somehow)


## Who

**Macro** is brought to you by
[ZeeZide](http://zeezide.de).
We like 
[feedback](https://twitter.com/ar_institute), 
GitHub stars, 
cool [contract work](http://zeezide.com/en/services/services.html),
presumably any form of praise you can think of.

There is a `#microexpress` channel on the 
[Noze.io Slack](http://slack.noze.io/). Feel free to join!

