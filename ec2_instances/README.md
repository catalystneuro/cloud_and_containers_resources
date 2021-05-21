## Setup of EC2 instances
- Choose EC2 instance [type](https://aws.amazon.com/ec2/instance-types/)

- Change `Instance > Security > Security groups > Inbound rules` to allow ssh on port 22 from any IP. Same for forwarding of other relevant ports (8888, 5000, 80...)

- [Create new users](https://aws.amazon.com/premiumsupport/knowledge-center/new-user-accounts-linux-instance/). Each user will need: username, password and public key file (.pem)

- [Install anaconda](https://docs.anaconda.com/anaconda/install/multi-user/) for all users.


## Access EC2 instances from command line
- [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) 
- [CLI configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

* Users will need (provided by the admin):
    * AWS Access Key ID
    * AWS Secret Access Key
    * Public key file (.pem)
    * EC2 instance username
    * EC2 instance password

- To create a catalystneuro profile for your aws cli:
```
$ aws configure --profile catalystneuro

AWS Access Key ID [None]: AKIAI44QH8DHBEXAMPLE
AWS Secret Access Key [None]: je7MtGbClwBF/2Zp9Utk/h3yCo8nvbEXAMPLEKEY
Default region name [None]: us-east-2
Default output format [None]: json
```

- [Start the EC2](https://docs.aws.amazon.com/cli/latest/reference/ec2/start-instances.html) instance you want to use:
```
$ aws ec2 --profile catalystneuro start-instances --instance-ids i-0f9078ffa55example
```

- Connect to the EC2 instance [through SSH](https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html):
```
$ ssh -i userpair.pem username@ec2-X-XXX-X-XXX.us-east-2.compute.amazonaws.com
```

- [Stop EC2](https://docs.aws.amazon.com/cli/latest/reference/ec2/terminate-instances.html) instance you are no longer using:
```
$ aws ec2 --profile catalystneuro stop-instances --instance-ids i-0f9078ffa55example
```

- Find available EC2 instances:
```
$ aws ec2 --profile catalystneuro describe-instances
```

- Running Jupyter notebooks:
```
$ ssh -i userpair.pem -N -f -L 8888:localhost:8888 username@ec2-X-XXX-X-XXX.us-east-2.compute.amazonaws.com
```