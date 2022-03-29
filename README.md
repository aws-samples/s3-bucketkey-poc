# Amazon S3 Bucket Key Proof of concept

S3 Bucket Key Proof of concept (POC) will demonstrate how request traffic decreases (up to 99%) from Amazon S3 to AWS KMS when you enable the S3 bucket Key.


Amazon S3 Bucket Keys reduce the cost of Amazon S3 server-side encryption using AWS Key Management Service (SSE-KMS). This new bucket-level key for SSE can reduce AWS KMS request costs by up to 99 percent by decreasing the request traffic from Amazon S3 to AWS KMS. 


# Setup

- Run the  [Cloud Formation template](cfn/cfn_s3_bucket_key_poc.json)
- Following the instruction as in [S3BucketKeyPOC_CFN_instruction](setup/S3BucketKeyPOC_Instruction.pdf) 

Cloudformation template will create all the necessary required infrastructure as demonstrated the architecture diagram below. It will create two S3 Buckets enabled with SSE-KMS encryption. First Bucket with Bucket Key Disabled and Second Bucket S3 Bucket Key Enabled. It will create Lambda function to generate the traffic in both of these buckets. Once the traffic is generated Instruction guild will provide you queries to anlayze the KMS API calls from Amazon S3 to AWS KMS  using CloudTrail and Amazon Athena.
# Architecture
<p align="center">
  <img src="imgs/S3BucketKeyPOC.png" width="350" title="hover text">

# Sample POC results
#### Result of POC demonstrate that by uploading 50 file objects and by downloading 100 files objects on both SSE-KMS encrypted bucket,Bucket Key enabled bucket has 97.33% lower KMS API Calls. 

S3 Bucket with Bucket Key Enabled made Only 4 KMS API calls 
S3 Bucket with Bucket Key Disabled made 150 KMS API calls
 

In this example there is 97.33% reduction in KMS API calls.

<p align="center">
  <img src="imgs/S3BucketKeyPOCResult.PNG" width="500" title="hover text">


``
# License

This library is licensed under the MIT-0 License. See the LICENSE file.