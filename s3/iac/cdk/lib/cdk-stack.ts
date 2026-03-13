import { Stack, StackProps } from 'aws-cdk-lib/core';
import * as s3 from 'aws-cdk-lib/aws-s3';
import * as cdk from 'aws-cdk-lib';

export class CdkStack extends Stack {
  constructor(scope: cdk.App, id: string, props?: StackProps) {
    super(scope, id, props);

    new s3.Bucket(this, 'MYBucket');
  }
}
