## Covert to JSON

<!-- yq -o=json policy.yaml > policy.json -->

## Create the policy
aws iam create-policy \
--policy-name my-fun-policy \
--policy-document file://policy.json

## Update the policy version
aws iam create-policy-version \
--policy-arn arn:aws:iam::779846778159:policy/my-fun-policy \
--policy-document "$(yq -o=json policy.yaml)" \
--set-as-default

## Attach the policy to a user
aws iam attach-user-policy \
--user-name aws-examples \
--policy-arn arn:aws:iam::779846778159:policy/my-fun-policy

## Delete the policy version
aws iam delete-policy-version --policy-arn arn:aws:iam::779846778159:policy/my-fun-policy --version-id v1
aws iam delete-policy-version --policy-arn arn:aws:iam::779846778159:policy/my-fun-policy --version-id v2
aws iam delete-policy-version --policy-arn arn:aws:iam::779846778159:policy/my-fun-policy --version-id v3
aws iam delete-policy-version --policy-arn arn:aws:iam::779846778159:policy/my-fun-policy --version-id v4

## Delete the policy
aws iam delete-policy \
--policy-arn arn:aws:iam::779846778159:policy/my-fun-policy